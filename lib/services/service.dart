import 'dart:convert';
import 'dart:io';

import 'package:cypress/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceClass extends ChangeNotifier {
  String BaseUrl = "https://jsonplaceholder.typicode.com";
  int currentIndex = 0;

  Future<List<Album>> getPhotos(int albumId) async {
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "",
      "Content-Type": "",
    };

    var mydata = Uri.parse(BaseUrl + "/photos?albumId=$albumId");
    final response = await http.get(mydata);
    print("Hello bro..Here is the response - ${response.body}");
    if (response.statusCode == 200) {
      print("This is successful bro");
      print("album");
      print(response.statusCode);
      var myresponse = jsonDecode(response.body);
      List<Album> _list = [];
      for (var u in myresponse) {
        _list.add(Album.fromJson(u));
      }
      return _list;
    } else {
      print("This is not successful");
      throw Exception("Not successful");
    }
  }

  Future<String> getPhotosList(int albumId) async {
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "",
      "Content-Type": "",
    };
    try {
      var mydata = Uri.parse(BaseUrl + "/photos?albumId=$albumId");
      final response = await http.get(mydata);
      print("Hello bro..Here is the response - ${response.body}");
      if (response.statusCode == 200) {
        print("This is successful bro");

        return response.body;
      } else {
        return response.body;
      }
    } on SocketException catch (e) {
      print("error oo");
      return "Network Error";
    }
  }

  Future<List<CustomerData>> getData() async {
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "",
      "Content-Type": "",
    };

    var mydata = Uri.parse(BaseUrl + "/albums");
    final response = await http.get(mydata);
    print("Hello bro..Here is the response - ${response.body}");
    if (response.statusCode == 200) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await SharedPreferences.getInstance();
      print("This is successful bro");
      var myresponse = jsonDecode(response.body);
      List<CustomerData> mylist = [];
      for (var u in myresponse) {
        mylist.add(CustomerData.fromJson(u));
      }
      return mylist;
    } else {
      print("This is not successful");
      throw Exception("Not successful");
    }
  }

  Future<String> getDataListy() async {
    var headers = <String, String>{
      HttpHeaders.authorizationHeader: "",
      "Content-Type": "",
    };
    try {
      var mydata = Uri.parse(BaseUrl + "/albums");
      final response = await http.get(mydata);
      print("Hello bro..Here is the response - ${response.body}");
      if (response.statusCode == 200) {
        print("This is successful bro");

        return response.body;
      } else {
        return response.body;
      }
    } on SocketException catch (e) {
      print("error oo");
      return "Network Error";
    }
  }
}
