import 'package:flutter/material.dart';
import 'package:slider_app/exp_tile_tenga_with_call.dart';
import 'package:slider_app/exp_tile_tenga_with_call_v2.dart';
import 'package:slider_app/expansion_tile_pw.dart';
import 'package:slider_app/thenga_tenga_screens/user_list_view.dart';
import 'exp_tile.dart';
import 'exp_tile_tenga.dart';
import 'expansion_tile.dart';
import 'homepage.dart';
import 'moneyslider.dart';
import 'starfeedback.dart';
import 'package:slider_app/homepage.dart' as homepage;
import 'package:slider_app/feedbackcomment.dart' as fb;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slider',
      theme: ThemeData(
        primaryColor: Color(0xffff520d),
        //primaryColor: Color(0xff512ea8),
         //primaryColor: Color(0xff662d8c),
      ),
        // home: fb.HomePage(),
        // home: MoneySlider(),
        //home: StarFeedback(),
        // home: TileAppMyn()
        // home: TileAppPW(),
        home: TileAppTengaWithCallV2(),
    );
  }
}