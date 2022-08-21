import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';

class Album {
  Album({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}

class CustomerData {
  CustomerData({
    required this.userId,
    required this.id,
    required this.title,
  });

  int userId;
  int id;
  String title;

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
