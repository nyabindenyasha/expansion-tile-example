import 'package:flutter/material.dart';
import 'package:slider_app/models/commodity-category.dart';
import 'package:slider_app/models/product-commodity.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'models/commodity-category2.dart';

class TileAppTengaWithCallV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // _getCommodityCategory();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            // child: Text('ExpansionTile App'),
            child: Text('Thenga Tenga Categories'),
          ),
        ),
        // body: new ListView.builder(
        //   itemBuilder: (BuildContext context, int index) {
        //     return new StuffInTiles(listOfTiles[index]);
        //   },
        //    itemCount: listOfTiles == null ? 0 : listOfTiles.length,
        // ),
        body: Container(
           child: FutureBuilder(
          future: getListOfTiles(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // if (snapshot.data == null) {
            //   return Container(
            //     child: Center(child: Text("Loading....")),
            //   );
            // } else {

              return ListView.builder(
                 itemBuilder: (BuildContext context, int index) {
                return new StuffInTiles(listOfTiles[index]);
                },
                 itemCount: listOfTiles == null ? 0 : listOfTiles.length,
                //  itemCount: snapshot.data.length,
              );
          //  }
          },
        )
        ),
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final CommodityCategory2 myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(CommodityCategory2 t) {
    if (t.productsCommoditiesList.isEmpty)
      return new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => print("tap"),
          subtitle: new Text("Subtitle"),
          leading: new Text("Leading"),
          selected: true,
          trailing: new Text("trailing"),
          title: new Text(t.name));

    return new ExpansionTile(
      key: new PageStorageKey<CommodityCategory2>(t),
      leading: Icon(Icons.arrow_right),
      title: new Text(
        t.id.toString() + " " + t.name,
        style: TextStyle(
            color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
      subtitle: new Text(t.description),
      children: t.productsCommoditiesList.map(_buildTiles2).toList(),
    );
  }

  Widget _buildTiles2(ProductCommodity s) {
    return Padding(
        padding: EdgeInsets.only(left: 40.0),
        child: new ExpansionTile(
          key: new PageStorageKey<ProductCommodity>(s),
          title: new Text(s.id.toString() + " " + s.name),
          subtitle: new Text(s.description),
        ));
  }
}

List<CommodityCategory2> listOfTiles = [];
// List<CommodityCategory2> listOfTiles = getListOfTiles();

//  getListOfTiles() async {
//   List<CommodityCategory2> listOfTiles2 = await _getCommodityCategory();
//  return listOfTiles2;
// }

 getListOfTiles()  {
 Future<List<CommodityCategory2>> listOfTiles2 =  _getCommodityCategory();
  listOfTiles2.then((onValue){
    listOfTiles = onValue;
  }) ;
}


Future<List<CommodityCategory2>> _getCommodityCategory() async {
  String url = "http://192.168.137.1:8004/commodityCategory";
  var data = await http.get(url);
  var jsonData = json.decode(data.body);
  List<CommodityCategory2> pcList = []; 

  for (var u in jsonData) {
    CommodityCategory2 user =
        CommodityCategory2(u["id"], u["name"], u["description"]);
    print(user);
    pcList.add(user);
  }

  print(pcList);
  return pcList;
}



