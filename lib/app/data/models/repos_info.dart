import 'package:flutter/foundation.dart';

class ReposInfo {
  String name, url;

  ReposInfo({
    @required this.name,
    @required this.url,
  });

  static ReposInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ReposInfo(
      name: map['name'],
      url: map['url'],
    );
  }

  ReposInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
