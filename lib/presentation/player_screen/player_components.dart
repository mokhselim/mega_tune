import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../shared/shared.dart';
import '../../style/app_fonts.dart';

///Play Stop Controls
class ControlButtons extends StatelessWidget {
  const ControlButtons({
    required this.player,
    super.key,
  });

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 22),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: () {
                  player.play();
                  addHaptic();
                },
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.stop_rounded),
                iconSize: 64.0,
                onPressed: () {
                  player.stop();
                  addHaptic();
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

///Volume Control
class VolumeControl extends StatelessWidget {
  const VolumeControl({
    super.key,
    required this.player,
  });

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.volume_mute),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Slider(
              divisions: 100,
              min: 0.0,
              max: 1.0,
              value: player.volume,
              onChanged: (volume) {
                player.setVolume(volume);
                addHaptic();
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(CupertinoIcons.volume_up),
        ],
      ),
    );
  }
}

///Live Text Slider
class LiveSlider extends StatelessWidget {
  const LiveSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 5,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white70, Colors.transparent, Colors.white70],
                stops: [0.1, 0.5, 0.9],
              ),
              borderRadius: BorderRadius.all(Radius.circular(2))),
        ),
        Text(
          "LIVE",
          textAlign: TextAlign.center,
          style: dartTextTheme(context).bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        )
      ],
    );
  }
}
