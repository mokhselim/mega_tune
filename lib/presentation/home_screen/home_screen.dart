import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mega_tune/controllers/home_controller.dart';
import 'package:mega_tune/presentation/home_screen/home_components.dart';

import '../../models/channels_model.dart';
import '../../shared/components.dart';
import '../../shared/constants.dart';
import '../../style/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if (homeCtrl.favouriteChannels.isEmpty) {
                  return const SizedBox.shrink();
                }
                return FavouriteComponents(homeCtrl: homeCtrl);
              }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Radio Stations 📻🔥",
                style: textTheme(context)
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),
              Obx(
                () {
                  if (homeCtrl.radioChannels.value.data.isEmpty) {
                    return Expanded(
                        child: Lottie.asset("assets/lottie/musicLoading.json"));
                  }
                  return Expanded(
                    child: GridView.builder(
                      itemCount: homeCtrl.radioChannels.value.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.7,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        ChannelsData channel =
                            homeCtrl.radioChannels.value.data[index];
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            InkWell(
                              onTap: () =>
                                  navigateToPlayerScreen(channel, context),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height / 3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CachedImages(
                                      imageUrl: channel.logo?.original,
                                      fit: BoxFit.fill,
                                    ),
                                    Container(
                                      height: 70,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              AppColors.backgroundBlack,
                                              AppColors.backgroundBlack
                                                  .withValues(alpha: 0.9),
                                              AppColors.backgroundBlack
                                                  .withValues(alpha: 0.5),
                                              Colors.transparent
                                            ]),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 2,
                                        children: [
                                          Text(
                                            channel.slug ?? "",
                                            style:
                                                textTheme(context).bodyMedium,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            channel.name ?? "",
                                            style: textTheme(context).bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (channel.httpsUrl?.isNotEmpty ?? false)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    height: 40,
                                    child: Lottie.asset(
                                        "assets/lottie/live.json")),
                              ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
