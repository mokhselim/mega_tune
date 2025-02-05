import 'package:audio_session/audio_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mega_tune/presentation/player_screen/player_components.dart';
import 'package:mega_tune/shared/constants.dart' as local;

import '../../controllers/home_controller.dart';
import '../../models/channels_model.dart';
import '../../shared/components.dart';
import '../../shared/shared.dart';
import '../../style/app_colors.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({
    super.key,
    required this.channelsData,
  });

  final ChannelsData channelsData;

  @override
  PlayerScreenState createState() => PlayerScreenState();
}

class PlayerScreenState extends State<PlayerScreen>
    with WidgetsBindingObserver {
  final _player = AudioPlayer();
  final HomeController homeCtrl = Get.put(HomeController());
  late String radioUrl;
  late String radioImage;
  late String radioName;
  late String radioSlug;

  @override
  void initState() {
    radioSlug = widget.channelsData.slug ?? "";
    radioUrl = widget.channelsData.httpsUrl?.last.url ?? "";
    radioImage = widget.channelsData.logo?.original ?? "";
    radioName = widget.channelsData.name ?? "";

    super.initState();
    local.ambiguate(WidgetsBinding.instance)!.addObserver(this);

    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      debugPrint('A stream error occurred: $e');
    });

    try {
      _player.setVolume(0.5);
      await _player.setAudioSource(AudioSource.uri(Uri.parse(radioUrl)),
          preload: true);

      _player.play();
    } on PlayerException catch (e) {
      debugPrint("Error loading audio source: $e");

      await channelNotAvailableAction(context);
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    local.ambiguate(WidgetsBinding.instance)!.removeObserver(this);

    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    } else if (state == AppLifecycleState.resumed) {
      _player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CachedImages(
            imageUrl: radioImage,
            height: local.screenHeight(context),
          ),
          ClipRect(
            child: DropBlur(
              child: ColoredBox(
                color: AppColors.radioHeader.withValues(alpha: 0.3),
                child: SizedBox(
                  height: local.screenHeight(context),
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  height: 6,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                StreamBuilder<IcyMetadata?>(
                  stream: _player.icyMetadataStream,
                  builder: (context, snapshot) {
                    final metadata = snapshot.data;
                    final String title = metadata?.info?.title ?? radioSlug;
                    String url = metadata?.info?.url ?? radioImage;
                    if (!Uri.parse(url).isAbsolute) {
                      url = radioImage;
                    }
                    return Padding(
                      padding: EdgeInsets.only(
                          top: local.screenHeight(context) / 10),
                      child: Column(
                        children: [
                          CoolShadowWidget(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
                              child: CachedImages(
                                imageUrl: url,
                                fit: BoxFit.fill,
                                height: local.screenWidth(context) / 1.5,
                                width: local.screenWidth(context) / 1.5,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: local.screenHeight(context) / 8),
                                      child: Text(title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(radioName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white70)),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() {
                                return IconButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    addHaptic();
                                    if (widget.channelsData.isFavourite.value) {
                                      homeCtrl.removeChannelFromFavourite(
                                          widget.channelsData);
                                    } else {
                                      homeCtrl.addChannelToFavourite(
                                          widget.channelsData);
                                    }
                                  },
                                  icon: Icon(
                                    widget.channelsData.isFavourite.value
                                        ? CupertinoIcons.heart_solid
                                        : CupertinoIcons.heart,
                                    size: 32,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const Spacer(),
                const LiveSlider(),
                const Spacer(),
                ControlButtons(player: _player),
                const Spacer(),
                StreamBuilder<double>(
                  stream: _player.volumeStream,
                  builder: (context, snapshot) =>
                      VolumeControl(player: _player),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
