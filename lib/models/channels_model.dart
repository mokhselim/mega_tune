import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

ChannelsModel channelsModelFromJson(String str) =>
    ChannelsModel.fromJson(json.decode(str));
String channelsModelToJson(ChannelsModel data) => json.encode(data.toJson());

class ChannelsModel {
  bool? _success;
  bool? _hasNext;
  num? _total;
  List<ChannelsData> _data = [];

  ChannelsModel({
    bool? success,
    bool? hasNext,
    num? total,
    List<ChannelsData>? data,
  }) {
    _success = success;
    _hasNext = hasNext;
    _total = total;
    _data = data ?? [];
  }

  ChannelsModel.fromJson(dynamic json) {
    _success = json['success'];
    _hasNext = json['has_next'];
    _total = json['total'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(ChannelsData.fromJson(v));
      });
    }
  }

  bool? get success => _success;
  bool? get hasNext => _hasNext;
  num? get total => _total;
  List<ChannelsData> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['has_next'] = _hasNext;
    map['total'] = _total;
    if (_data.isNotEmpty) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 45
/// slug : "AZZABBEL_RADIO"
/// name : "AZZABBEL RADIO"
/// city_id : 33
/// country_id : 11
/// logo : {"size_600x600":"https://static-media.streema.com/media/cache/22/38/2238a0744655834e8610b332fe085ea2.jpg","size_150x150":"https://static-media.streema.com/media/cache/5d/8b/5d8b99f05b619317da92b84bd2f34598.jpg","size_88x88":"https://static-media.streema.com/media/cache/3d/e5/3de5b0154e0eb93d8e8e83ae108b3e9e.jpg","size_75x75":"https://static-media.streema.com/media/cache/82/00/8200eaa2a3a440f5e08b68d9913616d5.jpg","size_48x48":"https://static-media.streema.com/media/cache/da/3a/da3a27e8b12f70e2dd60049a16efb20a.jpg","original":"https://static-media.streema.com/media/object-images/4519b094a0b60b4df6fd27a8d62281a9.JPG"}
/// genre : [{"id":52,"name":"80s"},{"id":53,"name":"90s"},{"id":54,"name":"Active Rock"},{"id":23,"name":"Dance"}]
/// streams_url : []
/// https_url : [{"content_type":"audio/mpeg","isfile":0,"codec":"mp3","url":"https://stream.zeno.fm/uhh8am7rhxhvv"}]

ChannelsData dataFromJson(String str) =>
    ChannelsData.fromJson(json.decode(str));
String dataToJson(ChannelsData data) => json.encode(data.toJson());

class ChannelsData {
  num? _id;
  RxBool isFavourite = false.obs;
  String? _slug;
  String? _name;
  num? _cityId;
  num? _countryId;
  Logo? _logo;
  List<Genre>? _genre;
  List<HttpsUrl>? _httpsUrl;

  ChannelsData({
    num? id,
    String? slug,
    String? name,
    num? cityId,
    num? countryId,
    Logo? logo,
    List<Genre>? genre,
    List<dynamic>? streamsUrl,
    List<HttpsUrl>? httpsUrl,
  }) {
    _id = id;
    _slug = slug;
    _name = name;
    _cityId = cityId;
    _countryId = countryId;
    _logo = logo;
    _genre = genre;
    _httpsUrl = httpsUrl;
  }

  ChannelsData.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _name = json['name'];
    _cityId = json['city_id'];
    _countryId = json['country_id'];
    _logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    if (json['genre'] != null) {
      _genre = [];
      json['genre'].forEach((v) {
        _genre?.add(Genre.fromJson(v));
      });
    }

    if (json['https_url'] != null) {
      _httpsUrl = [];
      json['https_url'].forEach((v) {
        _httpsUrl?.add(HttpsUrl.fromJson(v));
      });
    }
  }

  num? get id => _id;
  String? get slug => _slug;
  String? get name => _name;
  num? get cityId => _cityId;
  num? get countryId => _countryId;
  Logo? get logo => _logo;
  List<Genre>? get genre => _genre;
  List<HttpsUrl>? get httpsUrl => _httpsUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    map['name'] = _name;
    map['city_id'] = _cityId;
    map['country_id'] = _countryId;
    if (_logo != null) {
      map['logo'] = _logo?.toJson();
    }
    if (_genre != null) {
      map['genre'] = _genre?.map((v) => v.toJson()).toList();
    }

    if (_httpsUrl != null) {
      map['https_url'] = _httpsUrl?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// content_type : "audio/mpeg"
/// isfile : 0
/// codec : "mp3"
/// url : "https://stream.zeno.fm/uhh8am7rhxhvv"

HttpsUrl httpsUrlFromJson(String str) => HttpsUrl.fromJson(json.decode(str));
String httpsUrlToJson(HttpsUrl data) => json.encode(data.toJson());

class HttpsUrl {
  String? _contentType;
  num? _isFile;
  String? _codec;
  String? _url;

  HttpsUrl({
    String? contentType,
    num? isFile,
    String? codec,
    String? url,
  }) {
    _contentType = contentType;
    _isFile = isFile;
    _codec = codec;
    _url = url;
  }

  HttpsUrl.fromJson(dynamic json) {
    _contentType = json['content_type'];
    _isFile = json['isfile'];
    _codec = json['codec'];
    _url = json['url'];
  }

  String? get contentType => _contentType;
  num? get isFile => _isFile;
  String? get codec => _codec;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content_type'] = _contentType;
    map['isfile'] = _isFile;
    map['codec'] = _codec;
    map['url'] = _url;
    return map;
  }
}

/// id : 52
/// name : "80s"

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));
String genreToJson(Genre data) => json.encode(data.toJson());

class Genre {
  num? _id;
  String? _name;

  Genre({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Genre.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}

/// size_600x600 : "https://static-media.streema.com/media/cache/22/38/2238a0744655834e8610b332fe085ea2.jpg"
/// size_150x150 : "https://static-media.streema.com/media/cache/5d/8b/5d8b99f05b619317da92b84bd2f34598.jpg"
/// size_88x88 : "https://static-media.streema.com/media/cache/3d/e5/3de5b0154e0eb93d8e8e83ae108b3e9e.jpg"
/// size_75x75 : "https://static-media.streema.com/media/cache/82/00/8200eaa2a3a440f5e08b68d9913616d5.jpg"
/// size_48x48 : "https://static-media.streema.com/media/cache/da/3a/da3a27e8b12f70e2dd60049a16efb20a.jpg"
/// original : "https://static-media.streema.com/media/object-images/4519b094a0b60b4df6fd27a8d62281a9.JPG"

Logo logoFromJson(String str) => Logo.fromJson(json.decode(str));
String logoToJson(Logo data) => json.encode(data.toJson());

class Logo {
  String? _size600x600;
  String? _size150x150;
  String? _size88x88;
  String? _size75x75;
  String? _size48x48;
  String? _original;

  Logo({
    String? size600x600,
    String? size150x150,
    String? size88x88,
    String? size75x75,
    String? size48x48,
    String? original,
  }) {
    _size600x600 = size600x600;
    _size150x150 = size150x150;
    _size88x88 = size88x88;
    _size75x75 = size75x75;
    _size48x48 = size48x48;
    _original = original;
  }

  Logo.fromJson(dynamic json) {
    _size600x600 = json['size_600x600'];
    _size150x150 = json['size_150x150'];
    _size88x88 = json['size_88x88'];
    _size75x75 = json['size_75x75'];
    _size48x48 = json['size_48x48'];
    _original = json['original'];
  }

  String? get size600x600 => _size600x600;
  String? get size150x150 => _size150x150;
  String? get size88x88 => _size88x88;
  String? get size75x75 => _size75x75;
  String? get size48x48 => _size48x48;
  String? get original => _original;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['size_600x600'] = _size600x600;
    map['size_150x150'] = _size150x150;
    map['size_88x88'] = _size88x88;
    map['size_75x75'] = _size75x75;
    map['size_48x48'] = _size48x48;
    map['original'] = _original;
    return map;
  }
}
