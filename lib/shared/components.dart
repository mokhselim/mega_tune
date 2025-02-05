import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_tune/models/channels_model.dart';
import 'package:mega_tune/shared/shared.dart';
import 'package:mega_tune/style/app_fonts.dart';

import '../presentation/player_screen/player_screen.dart';
import '../style/app_colors.dart';

class CachedImages extends StatelessWidget {
  const CachedImages({
    super.key,
    required this.imageUrl,
    this.fit,
    this.height,
    this.width,
  });

  final String? imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? double.infinity,
      height: height ?? MediaQuery.sizeOf(context).height / 2.5,
      imageUrl: imageUrl ?? "",
      fit: fit ?? BoxFit.cover,
      errorWidget: (context, string, object) {
        return const Icon(
          Icons.error,
          color: Colors.black,
        );
      },
    );
  }
}

class DropBlur extends StatelessWidget {
  const DropBlur({
    super.key,
    required this.child,
    this.sigmaX,
    this.sigmaY,
  });

  final Widget child;
  final double? sigmaX;
  final double? sigmaY;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX ?? 150,
          sigmaY: sigmaY ?? 150,
        ),
        child: child);
  }
}

class CoolShadowWidget extends StatelessWidget {
  final Widget child;
  final double elevation;
  final Color shadowColor;

  const CoolShadowWidget({
    super.key,
    required this.child,
    this.elevation = 10.0,
    this.shadowColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.2),
            blurRadius: elevation * 0.7,
            spreadRadius: 0.1,
            offset: Offset(elevation, elevation),
          ),
        ],
      ),
      child: child,
    );
  }
}

Future<void> navigateToPlayerScreen(
    ChannelsData channel, BuildContext context) async {
  addHaptic();
  if (channel.httpsUrl != null && channel.httpsUrl!.isNotEmpty) {
    showModalBottomSheet(
        isScrollControlled: true,
        barrierColor: Colors.black12,
        context: context,
        builder: (builder) {
          return PlayerScreen(
            channelsData: channel,
          );
        });
  } else {
    await channelNotAvailableAction(context);
  }
}

Future<void> channelNotAvailableAction(BuildContext context) async {
  Get.showSnackbar(
    GetSnackBar(
      isDismissible: false,
      titleText: Text(
        "Channel Not Available",
        style: dartTextTheme(context).bodyLarge,
      ),
      messageText: const Text(
        "Whoops, Channel Not Available. Please try another time",
      ),
      borderColor: Colors.orange,
      borderRadius: 16,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 40,
            maxWidth: 40,
            minWidth: 40,
            minHeight: 40,
          ),
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(
              left: 16,
              right: 12,
            ),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: AppColors.createClose,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: const Icon(
              Icons.warning_rounded,
              color: Colors.amber,
            ),
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
      barBlur: 16,
      backgroundColor: AppColors.darkBlue.withValues(alpha: 0.4),
      duration: const Duration(milliseconds: 2800),
    ),
  );
}
