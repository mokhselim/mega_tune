import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_tune/controllers/home_controller.dart';

import '../../models/channels_model.dart';
import '../../shared/components.dart';
import '../../shared/constants.dart';
import '../../shared/shared.dart';

class FavouriteComponents extends StatelessWidget {
  const FavouriteComponents({super.key, required this.homeCtrl});

  final HomeController homeCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Favourites ❤️",
          style: textTheme(context)
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: screenWidth(context) / 2.6 + 50,
          child: ListView.separated(
            itemCount: homeCtrl.favouriteChannels.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              ChannelsData channel = homeCtrl.favouriteChannels[index];
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  InkWell(
                    onTap: () => navigateToPlayerScreen(channel, context),
                    child: SizedBox(
                      width: screenWidth(context) / 2.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            height: screenWidth(context) / 2.6,
                            width: screenWidth(context) / 2.6,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child:
                                CachedImages(imageUrl: channel.logo?.original),
                          ),
                          const Spacer(),
                          Text(
                            channel.name ?? '',
                            style: textTheme(context).bodyLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            channel.slug ?? '',
                            style: textTheme(context)
                                .bodySmall
                                ?.copyWith(color: Colors.white70),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      addHaptic();
                      homeCtrl.removeChannelFromFavourite(channel);
                    },
                    icon: const Icon(
                      CupertinoIcons.heart_solid,
                      color: Colors.orange,
                      size: 24,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 12,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
