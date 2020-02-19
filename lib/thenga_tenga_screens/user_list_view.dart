import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:slider_app/models/commodity-category.dart';
import 'package:slider_app/models/product-commodity.dart';

class UsersListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage(title: 'Users'), debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CommodityCategory> listOfTiles; 

  Future<List<CommodityCategory>> _getUsers() async {
    String url = "http://192.168.10.133:8004/commodityCategory";
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    print(jsonData);

    // List<CommodityCategory> listOfTiles = jsonData;

    // for (var u in jsonData) {
    //   print(u);

    //       List<ProductCommodity> pcList = [];
    //     for(var x in jsonData.productsCommoditiesList){
    //       ProductCommodity p = new ProductCommodity(u[x]["id"], u[x]["name"], u[x]["description"], u[x]["shopId"], u[x]["categoryId"], u[x]["price"]);
    //       pcList.add(p);
    //     }

    //   CommodityCategory user = CommodityCategory(u["id"], u["name"], u["description"], pcList);
    //   print(user);
    //   listOfTiles.add(user);
    // }

    print(listOfTiles);
    return listOfTiles;
  }

  @override
  Widget build(BuildContext context) {
    _getUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Shop Screen"),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new StuffInTiles(listOfTiles[index]);
        },
        itemCount: listOfTiles.length,
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final CommodityCategory myTile;
  List<CommodityCategory> listOfTiles;
  StuffInTiles(this.myTile);
  String url = "http://192.168.10.133:8004/commodityCategory";

  @override
  Widget build(BuildContext context) {
    // List<CommodityCategory> listOfTiles = getProductCategory();
  //  return _buildTiles(myTile);
  return null;
  }

  Future<List<CommodityCategory>> getProductCategory() async {

    var data = await http.get(url);
    var jsonData = json.decode(data.body);
    List<CommodityCategory> listOfTiles = jsonData;
    return listOfTiles;
  }

  Widget _buildTiles(CommodityCategory t) {
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
      key: new PageStorageKey<CommodityCategory>(t),
      leading: Icon(Icons.arrow_right),
      title: new Text(t.id.toString() + " " + t.name),
      subtitle: new Text(t.description),
      children: t.productsCommoditiesList.map(_buildTiles2).toList(),
    );
  }

  Widget _buildTiles2(ProductCommodity s) {
    if (s.name.isEmpty)
      return new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => print("tap"),
          // subtitle: new Text("Subtitle"),
          // leading: new Text("Leading"),
          selected: true,
          // trailing: new Text("trailing"),
          title: new Text("No data"));

    return new ExpansionTile(
      key: new PageStorageKey<ProductCommodity>(s),
      title: new Text(s.id.toString() + " " + s.name + " " + s.price.toString()),
      // children: s.models.map(_buildTiles3).toList(),
    );
  }

}

