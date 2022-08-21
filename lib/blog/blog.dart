import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cypress/blocs/blocevents.dart';
import 'package:cypress/constants/constants.dart';
import 'package:cypress/models/models.dart';
import 'package:cypress/services/service.dart';
import 'package:cypress/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);
  @override
  _BlogState createState() => _BlogState();
}

class myBlocEvents {
  void setfuture() {
    late Future<List<Album>> customerPictures;
    customerPictures = ServiceClass().getPhotos(2);
  }

  final _controller = ScrollController();
  final blocState = StreamController();
  StreamSink get _count => blocState.sink;
  Stream get counter => blocState.stream;
  final blocEvents = StreamController<BlocEvents>();
  Sink<BlocEvents> get BlocEventSink => blocEvents.sink;

  void myBloc(BlocEvents events) {
    if (events is increaseItems) {
      _controller.addListener(() {
        if (_controller.position.maxScrollExtent == _controller.offset) {
          setfuture();
        }
      });
    } else
      return myBloc(events);
  }

  void dispose() {
    blocState.close();
    blocEvents.close();
  }
}

class _BlogState extends State<Blog> {
  Future<List<Album>> getListData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var myListyy = sharedPreferences.getStringList("listData");
    //var bodyT = jsonDecode(myListyy);
    print("my gee - $myListyy");
    print("gooood");
    var myDD = List<dynamic>.from(myListyy!);
    print(myDD.runtimeType);
    List<Album> _finalList = [];
    for (var x in myDD) {
      _finalList.add(Album.fromJson(x));
    }

    print(_finalList.toList());
    return _finalList;
    // List<Album> mine = [];
    // for (var u in myList) {}
  }

  final _bloc = myBlocEvents();
  final _controller = ScrollController();
  bool darkMode = false;
  bool lightMode = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<CustomerData>> customerData;
  List<Album> customer = [];
  List<CustomerData> myd = [];
  bool lastPage = false;
  int currentIndex = 0;
  bool loading = true;
  bool error = false;
  int postsPerRequest = 20;
  int totalRows = 5;
  bool savedData = false;
  bool snapError = false;
  late Future<List<Album>> customerPictures;
  void setFuture2() {
    customerPictures2 = getListData();
  }

  late Future<List<Album>> customerPictures2;

  void setfuture() {
    customerPictures = ServiceClass().getPhotos(2);
  }

  void setNewData() {
    myBlocEvents();
  }

  @override
  void initState() {
    myBlocEvents();
    // StreamBuilder(
    //   stream: _bloc.counter,
    //   initialData: 0,
    //   builder: (BuildContext context, AsyncSnapshot) {
    //     var newData = AsyncSnapshot.data;
    //     return myBlocEvents();
    //   },
    // );
    setfuture();
    setFuture2();
    //mycustomerData();
    //mytList();
    getListData();
    setNewData();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        setState(() {
          setfuture();
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: CypressAppBar(
        context,
        "",
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Album>>(
                future: snapError ? customerPictures2 : customerPictures,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: _height * .4,
                          ),
                          const CircularProgressIndicator(
                            strokeWidth: 10,
                            semanticsLabel: ("Please Wait"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 20,
                              fontFamily: "OpenSans",
                              letterSpacing: 0,
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    snapError = true;
                    return FutureBuilder<List<Album>>(
                      future: customerPictures2,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print("There is data o");
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title:
                                    Text(snapshot.data![index].id.toString()),
                              );
                            },
                          );
                        } else
                          return Text(snapshot.error.toString());
                      },
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      controller: _controller,
                      itemCount: postsPerRequest + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < postsPerRequest) {
                          return Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].thumbnailUrl
                                                  .toString(),
                                              height: 100,
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].thumbnailUrl
                                                  .toString(),
                                              height: 100,
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].thumbnailUrl
                                                  .toString(),
                                              height: 100,
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].thumbnailUrl
                                                  .toString(),
                                              height: 100,
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].thumbnailUrl
                                                  .toString(),
                                              height: 100,
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].thumbnailUrl
                                                  .toString(),
                                              height: 100,
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].thumbnailUrl
                                                  .toString(),
                                              height: 100,
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].thumbnailUrl
                                                  .toString(),
                                              height: 100,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                height: 50,
                                color: Colors.grey[400],
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              SizedBox(
                                height: _height * .4,
                              ),
                              const CircularProgressIndicator(
                                strokeWidth: 10,
                                semanticsLabel: ("Please Wait"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Please Wait...",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                  fontFamily: "OpenSans",
                                  letterSpacing: 0,
                                ),
                              )
                            ],
                          );
                        }
                      },
                    );
                  } else {
                    return Text(snapshot.error.toString());
                  }
                }),
          ),
        ],
      ),
    );
  }

  customerPhotos(int albumId) {
    ServiceClass serviceClass = ServiceClass();
    serviceClass.getPhotos(albumId).then((value) => null);
  }

  mycustomerData() async {
    ServiceClass serviceClass = ServiceClass();
    serviceClass.getData().then((value) => null);
  }

  void mytList() {
    print("Lets do this");
    ServiceClass serviceClass = ServiceClass();
    serviceClass.getDataListy().then((value) => outputY(value));
  }

  void outputY(String body) async {
    print("Lets convert list to map now");
    print(body);
    if (body.isNotEmpty) {
      var bodyT = jsonDecode(body);
      dynamic value = bodyT;
      print("valueeee $value");
      setState(() {
        savedData = true;
        myd = value.map<CustomerData>((e) => CustomerData.fromJson(e)).toList();
      });
      print(myd[2].id);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      print("woow");
      print(myd[2].id);
      if (bodyT != null) {
        sharedPreferences.setString(
          "data",
          [bodyT][myd[5].id],
        );
      } else
        return null;
      var myuser = sharedPreferences.getString("data");
      print("awesomeee");
    }
  }

  void output(String body) {
    print("lets do this");
    if (body.isEmpty) {
      print("errorr");
      return null;
    } else if (body.isNotEmpty) {
      print("great");
      var bodyT = jsonDecode(body);
      setState(() {
        List<Album> _list = [];
        for (var u in bodyT) {
          _list.add(Album.fromJson(u));
        }
      });
      print("all good bro");
      print(bodyT);
    }
  }
}
