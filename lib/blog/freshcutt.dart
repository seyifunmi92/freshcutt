import 'package:cypress/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_shine/flutter_shine.dart';

class FreshCutt extends StatefulWidget {
  const FreshCutt({Key? key}) : super(key: key);

  @override
  _FreshCuttState createState() => _FreshCuttState();
}

class _FreshCuttState extends State<FreshCutt> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _height * .05,
        backgroundColor: Color(0xff000000),
      ),
      backgroundColor: Color(0xff000000),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * .04),
          child: Column(children: [
            SizedBox(
              height: _height * .047,
            ),
            Row(
              children: [
                GradientText(
                  "Trending Today",
                  style: TextStyle(
                    fontSize: _height * .04,
                    color: Color(0xffF2BC3D),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.0,
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xffF2BC3D),
                    Color(0xffD93636),
                  ]),
                ),
                Text(
                  " 🔥",
                  style: TextStyle(
                    fontSize: _height * .045,
                  ),
                ),
              ],
            ),
            // GradientText(
            //   "",
            //   style: GoogleFonts.poppins(),
            //   gradient: LinearGradient(colors: [
            //     Colors.amber,
            //     Colors.red,
            //   ]),
            // )

            SizedBox(height: _height * .04),
            Stack(
              children: [
                Container(
                  height: _height * .477,
                  width: _width * .92,
                  decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.amber,
                      //     blurStyle: BlurStyle.outer,
                      //     blurRadius: 0.1,
                      //     spreadRadius: 0,
                      //     //offset: Offset(1, 29),.1
                      //   ),
                      // ],
                      borderRadius: BorderRadius.circular(35),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(242, 188, 61, 0.2),
                            //Color.fromRGBO(40, 38, 44, 0.2),
                            Color.fromRGBO(255, 255, 255, 0.08),
                          ])),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(_width * .032, _height * .014,
                        _width * .032, _height * .02),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            width: _width,
                            height: _height * .341,
                            //color: Colors.black,
                            child: Image.asset(
                              "lib/assets/image.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: _height * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .03),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Smash StockPile",
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: _height * .0237,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: _height * .005),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "+10 New Videos",
                                      style: TextStyle(
                                        color: Color(0xfff2bc3d),
                                        fontSize: _height * .015,
                                        //fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: _height * .006,
                                            ),
                                            Icon(
                                              Icons.visibility_outlined,
                                              size: _height * .0138,
                                              color: Color(0xff8C8797),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: _width * .015,
                                        ),
                                        Text(
                                          "15/30",
                                          style: TextStyle(
                                            color: Color(0xff8C8797),
                                            fontSize: _height * .015,

                                            //fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: _height * .019,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: _height * .0047,
                                      width: _width * .792,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.1),
                                      ),
                                      child: Row(children: [
                                        Container(
                                          height: _height * .0047,
                                          width: _width * .396 + _width * .016,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xffF2BC3D),
                                                  Color(0xffF2BC3D),
                                                  Color(0xffF2BC3D),
                                                  Color(0xffF2BC3D),
                                                  Color(0xffF2BC3D),
                                                  Color(0xffF2BC3D),
                                                  Color(0xffF2BC3D),
                                                  Color(0xffffffff),

                                                  //Color.fromRGBO(168, 35, 234, 0.2),
                                                  //Color.fromRGBO(40, 38, 44, 0.2)
                                                  //Color.fromRGBO(242, 188, 61, 0.2),
                                                  //Color.fromRGBO(255, 255, 255, 0.08),
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            //color: Colors.red,
                                          ),
                                          //color: Colors.red,
                                        ),
                                        // FlutterShine(
                                        //   config: Config(
                                        //     shadowColor: Colors.white,
                                        //   ),
                                        //   light: Light(
                                        //     intensity: 1,
                                        //   ),
                                        //   builder: ((context, shineShadow) {
                                        //     return Container(
                                        //       height: _height * .0047,
                                        //       width: _width * .016,
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(3),
                                        //         color: Color(0xffffffff),

                                        //         //boxShadow: shineShadow?.shadows
                                        //       ),
                                        //     );
                                        //   }),
                                        // ),

                                        //   //color: Colors.red,
                                        // )
                                        // Container(
                                        //   //       height: _height * .0047,
                                        //   width: _width * .016,
                                        //   decoration: BoxDecoration(
                                        //     borderRadius:
                                        //         BorderRadius.circular(3),
                                        //     color: Color(0xffffffff),

                                        //     //boxShadow: shineShadow?.shadows
                                        //   ),
                                        // ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: _width * .62,
                  top: _height * .30,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: _height * .07,
                    child: Image.asset("lib/assets/playy.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height * .038,
            ),
            Stack(
              children: [
                Container(
                  height: _height * .477,
                  width: _width * .92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(168, 35, 234, 0.2),
                          //Color.fromRGBO(40, 38, 44, 0.2)

                          //Color.fromRGBO(242, 188, 61, 0.2),

                          Color.fromRGBO(255, 255, 255, 0.08),
                        ]),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(_width * .032, _height * .014,
                        _width * .032, _height * .02),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            width: _width,
                            height: _height * .341,
                            //color: Colors.black,
                            child: Image.asset(
                              "lib/assets/image2.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: _height * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .03),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "FGC Rumble",
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: _height * .0237,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: _height * .005),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "+18 New Videos",
                                      style: TextStyle(
                                        color: Color(0xfff2bc3d),
                                        fontSize: _height * .015,
                                        //fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: _height * .006,
                                            ),
                                            Icon(
                                              Icons.visibility_outlined,
                                              size: _height * .0138,
                                              color: Color(0xfff2bc3d),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: _width * .015,
                                        ),
                                        Text(
                                          "0/18",
                                          style: TextStyle(
                                            color: Color(0xfff2bc3d),
                                            fontSize: _height * .015,

                                            //fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: _height * .019,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: _height * .0047,
                                      width: _width * .792,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.1),
                                      ),
                                      child: Row(children: [
                                        // Container(
                                        //   height: _height * .0047,
                                        //   width: _width * .396,
                                        //   decoration: BoxDecoration(
                                        //     borderRadius:
                                        //         BorderRadius.circular(3),
                                        //     color: Colors.red,
                                        //   ),
                                        //   //color: Colors.red,
                                        // ),
                                        // FlutterShine(
                                        //   config: Config(
                                        //     shadowColor: Colors.white,
                                        //   ),
                                        //   light: Light(
                                        //     intensity: 1,
                                        //   ),
                                        //   builder: ((context, shineShadow) {
                                        //     return Container(
                                        //       height: _height * .0047,
                                        //       width: _width * .016,
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(3),
                                        //         color: Color(0xffffffff),

                                        //         //boxShadow: shineShadow?.shadows
                                        //       ),
                                        //     );
                                        //   }),
                                        // ),

                                        //   //color: Colors.red,
                                        // )
                                        // Container(
                                        //   //       height: _height * .0047,
                                        //   width: _width * .016,
                                        //   decoration: BoxDecoration(
                                        //     borderRadius:
                                        //         BorderRadius.circular(3),
                                        //     color: Color(0xffffffff),

                                        //     //boxShadow: shineShadow?.shadows
                                        //   ),
                                        // ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: _width * .62,
                  top: _height * .30,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: _height * .07,
                    child: Image.asset("lib/assets/playy.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height * .038,
            ),
            Stack(
              children: [
                Container(
                  height: _height * .477,
                  width: _width * .92,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(242, 188, 61, 0.2),
                            //Color.fromRGBO(40, 38, 44, 0.2),
                            Color.fromRGBO(255, 255, 255, 0.08),
                          ])),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(_width * .032, _height * .014,
                        _width * .032, _height * .02),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            width: _width,
                            height: _height * .341,
                            //color: Colors.black,
                            child: Image.asset(
                              "lib/assets/image3.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: _height * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: _width * .03),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Valorant Volume",
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: _height * .0237,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: _height * .005),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "+21 New Videos",
                                      style: TextStyle(
                                        color: Color(0xff645f6d),
                                        fontSize: _height * .015,
                                        //fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: _height * .006,
                                            ),
                                            Icon(
                                              Icons.visibility_outlined,
                                              size: _height * .0138,
                                              color: Color(0xff8C8797),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: _width * .015,
                                        ),
                                        Text(
                                          "21/21",
                                          style: TextStyle(
                                            color: Color(0xff8C8797),
                                            fontSize: _height * .015,

                                            //fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: _height * .019,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: _height * .0047,
                                      width: _width * .792,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Color(0xfff2bc3d),
                                      ),
                                      // child: Row(children: [
                                      //   Container(
                                      //     height: _height * .0047,
                                      //     width: _width * .396,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(3),
                                      //       color: Colors.red,
                                      //     ),
                                      //     //color: Colors.red,
                                      //   ),
                                      // FlutterShine(
                                      //   config: Config(
                                      //     shadowColor: Colors.white,
                                      //   ),
                                      //   light: Light(
                                      //     intensity: 1,
                                      //   ),
                                      //   builder: ((context, shineShadow) {
                                      //     return Container(
                                      //       height: _height * .0047,
                                      //       width: _width * .016,
                                      //       decoration: BoxDecoration(
                                      //         borderRadius:
                                      //             BorderRadius.circular(3),
                                      //         color: Color(0xffffffff),

                                      //         //boxShadow: shineShadow?.shadows
                                      //       ),
                                      //     );
                                      //   }),
                                      // ),

                                      //   //color: Colors.red,
                                      // )
                                      // Container(
                                      //   //       height: _height * .0047,
                                      //   width: _width * .016,
                                      //   decoration: BoxDecoration(
                                      //     borderRadius:
                                      //         BorderRadius.circular(3),
                                      //     color: Color(0xffffffff),

                                      //boxShadow: shineShadow?.shadows
                                      // ),
                                      //),
                                      //]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: _width * .62,
                  top: _height * .30,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: _height * .07,
                    child: Image.asset("lib/assets/playy.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _height * .030,
            ),
            Container(
              height: _height * .32,
              //width: _width * .72,
              child: Image.asset("lib/assets/demogif.gif"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Check back soon for new clips",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: _height * .026,
                        fontWeight: FontWeight.w700,

                        //fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "and creator content.",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: _height * .026,
                            fontWeight: FontWeight.w700,
                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height * .0095,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "In the meantime join our discord.",
                          style: TextStyle(
                            color: Color(0xffa19daa),
                            fontSize: _height * .016,
                            fontWeight: FontWeight.w400,
                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height * .0474,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: _height * .0664,
              width: _width * .92,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        //Color(0xffF2BC3D),
                        //Color(0xff392904),
                        Color.fromRGBO(242, 188, 61, 1).withOpacity(0.9),
                        Color.fromRGBO(57, 41, 4, 1).withOpacity(0.5),
                        //Color.fromRGBO(255, 255, 255, 0.08),
                      ])),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("lib/assets/icony.png"),
                  Text(
                    "  Join Metaview Discord",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _height * .02,
                      fontWeight: FontWeight.w500,
                      //fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: _height * .1,
            ),
          ]),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: Container(
        height: _height * .104,
        width: _width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          //color: Colors.transparent,
          color: Color(0x00ffffff).withOpacity(0.045),
        ),
        //color: Color.fromRGBO(0, 0, 0, 0.9),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              _width * .005, _height * .005, _width * .005, _height * .001),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _height * .02,
                  ),
                  Text(
                    "🔥",
                    style: TextStyle(
                      fontSize: _height * .024,
                      //color: Colors.amber
                    ),
                  ),
                  SizedBox(
                    height: _height * .001,
                  ),
                  Text(
                    " Hot",
                    style: TextStyle(
                      color: Color(0xfff2bc3d),
                      fontSize: _height * .0118,
                    ),
                  ),
                ],
              ),
              Container(
                height: _height * .024,
                width: _width * .053,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff504C57)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset("lib/assets/int.png"),
                ),
              ),
              Container(
                child: Image.asset("lib/assets/vecc.png"),
                height: _height * .0249,
              ),

              // Icon(
              //   Icons.home_outlined,
              //   color: Color(0xff504C57),
              // ),
              Container(
                child: Image.asset("lib/assets/dem.png"),
                height: _height * .021,
                //width: _width * .53,
              ),
              CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Image.asset("lib/assets/avatar.png")),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
