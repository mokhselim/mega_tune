import 'package:mega_tune/models/channels_model.dart';
import 'dio_helper.dart';

class RadioChannels {
  Future<ChannelsModel> getAllCountries({
    int? page,
  }) async {
    final response = await DioHelper.apiGet(
      endPoint: 'countries',
    );
    return ChannelsModel.fromJson(response.data);
  }

  Future<ChannelsModel> getChannels({
    String? keyword,
    int? countryId,
    int? cityId,
    int? genreId,
    int? page,
  }) async {
    Map<String, dynamic> query = {};

    if (countryId != null) {
      query.addAll({"country_id": countryId});
    }

    if (cityId != null) {
      query.addAll({"city_id": cityId});
    }

    if (keyword != null) {
      query.addAll({"keyword": keyword});
    }
    if (genreId != null) {
      query.addAll({"genre_id": genreId});
    }

    if (page != null) {
      query.addAll({"page": genreId});
    }

    final response =
        await DioHelper.apiGet(endPoint: 'get/channels', query: query);

    return ChannelsModel.fromJson(response.data);
  }
}
