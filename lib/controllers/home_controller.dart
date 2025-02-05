import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mega_tune/models/channels_model.dart';
import '../helpers/api_helper.dart';
import '../helpers/cache_helper.dart';

class HomeController extends GetxController {
  Rx<ChannelsModel> radioChannels = ChannelsModel().obs;
  RxList<ChannelsData> favouriteChannels = <ChannelsData>[].obs;

  @override
  onInit() {
    super.onInit();
    getFavouriteChannels();
    getChannelsList();
  }

  Future<void> getChannelsList() async {
    try {
      radioChannels.value = await RadioChannels().getChannels(countryId: 11);
      // markNetworkChannelsToFavourite();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void markNetworkChannelsToFavourite() {
    if (radioChannels.value.data.isNotEmpty && favouriteChannels.isNotEmpty) {
      for (ChannelsData item in radioChannels.value.data) {
        if (favouriteChannels
            .any((ChannelsData element) => item.id == element.id)) {
          item.isFavourite.value = true;
        }
      }
    }
  }

  void getFavouriteChannels() {
    var channelsList = CacheHelper.getData(key: "favourite_channels");
    if (channelsList != null && channelsList is List<dynamic>) {
      try {
        for (var item in channelsList) {
          favouriteChannels.add(ChannelsData.fromJson(jsonDecode(item)));
        }
      } catch (error) {
        debugPrint(error.toString());
      }
    }
  }

  void setFavouriteChannels() {
    if (favouriteChannels.isNotEmpty) {
      List<String> channelsList = [];
      for (var item in favouriteChannels) {
        channelsList.add(jsonEncode(item.toJson()));
      }

      CacheHelper.setData(key: "favourite_channels", value: channelsList);
    }
  }

  void addChannelToFavourite(ChannelsData channel) {
    if (!favouriteChannels.contains(channel)) {
      favouriteChannels.add(channel);
      isChannelInFavourite(channel);
      setFavouriteChannels();
    }
  }

  void removeChannelFromFavourite(ChannelsData channel) {
    if (favouriteChannels.contains(channel)) {
      favouriteChannels.removeWhere((item) => item.id == channel.id);
      isChannelInFavourite(channel);
      setFavouriteChannels();
    }
  }

  void isChannelInFavourite(
    ChannelsData channel,
  ) {
    if (favouriteChannels.any((item) => item.id == channel.id)) {
      channel.isFavourite.value = true;
    } else {
      channel.isFavourite.value = false;
    }
  }
}
