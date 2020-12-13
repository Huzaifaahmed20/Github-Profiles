import 'package:flutter/foundation.dart';

class ReposInfo {
  String name, html_url;

  ReposInfo({
    @required this.name,
    @required this.html_url,
  });

  static ReposInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ReposInfo(
      name: map['name'],
      html_url: map['html_url'],
    );
  }

  ReposInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    html_url = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['html_url'] = this.html_url;
    return data;
  }
}
