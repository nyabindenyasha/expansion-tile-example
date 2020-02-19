import 'package:flutter/material.dart';
import 'package:slider_app/models/commodity-category.dart';
import 'package:slider_app/models/product-commodity.dart';

class TileAppTenga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
  debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            // child: Text('ExpansionTile App'),
               child: Text('Thenga Tenga Categories'),
          ),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new StuffInTiles(listOfTiles[index]);
          },
          itemCount: listOfTiles.length,
        ),
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final CommodityCategory myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
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
      title: new Text(t.id.toString() + " " + t.name,
       style: TextStyle(color: Colors.black, fontSize: 22.0,fontWeight:FontWeight.bold),),
      subtitle: new Text(t.description),
     children: t.productsCommoditiesList.map(_buildTiles2).toList(),
    );
  }

    Widget _buildTiles2(ProductCommodity s) {

    return Padding(
      padding: EdgeInsets.only(left: 40.0),
      child: new ExpansionTile(
      key: new PageStorageKey<ProductCommodity>(s),
      title: new Text(s.id.toString() + " " +  s.name),
      subtitle: new Text(s.description),
    ));
  }

}


List<CommodityCategory> listOfTiles = [
  new CommodityCategory(1, "Beer", "clear beer brown and green bootle", [
    new ProductCommodity(1, "Amstel Larger 400ml", "Amstel Larger 400ml", 1, 1, 21.49),
    new ProductCommodity(4, "Castle lite 440ml", "Castle lite 440ml", 1, 1, 31.49),
  ]),
  new CommodityCategory(2, "Biscuits", "biscuits", [
    new ProductCommodity(1, "Lobels Loose Biscuits 500g", "Lobels Loose Biscuits 500g", 1, 2, 19.49),
    new ProductCommodity(55, "Lobels Loose Biscuits 2kg", "Lobels Loose Biscuits 2kg", 1, 2, 55.49),
  ]),
  new CommodityCategory(10, "Liqour", "Whiskey Gin Brandy Strong stuff hot", [
    new ProductCommodity(5, "Goldblend Whiskey", "Goldblend Whiskey", 1, 10, 79.49),  
    new ProductCommodity(28, "Amarula", "Amarula", 1, 10, 156.99),
    new ProductCommodity(34, "Royal Brandy", "Royal Brandy", 1, 10, 199.99),
    new ProductCommodity(35, "Two Keys Whiskey", "Two Keys Whiskey", 1, 10, 79.99),
    new ProductCommodity(36, "Viceroy Brandy", "Viceroy Brandy", 1, 10, 179.99),
    new ProductCommodity(50, "Goldblend Whiskey", "Goldblend Whiskey", 1, 10, 79.49),
    new ProductCommodity(51, "Goldblend Whiskey", "Goldblend Whiskey", 1, 10, 79.49),
  ]),
  new CommodityCategory(11, "Rice", "white rice paboiled long grain", [
    new ProductCommodity(22, "Mega rice 2kg", "Mega rice 2kg", 1, 11, 39.99),
  ]),
  new CommodityCategory(12, "Wines", "red wine rose", [
    new ProductCommodity(27, "Four Cousins Red Rose", "Four Cousins Red Rose", 1, 12, 136.99),
  ]),
  new CommodityCategory(13, "Ciders", "ciders 6packs cans", [
    new ProductCommodity(37, "6pack Smirnoff Storm", "6pack Smirnoff Storm", 1, 13, 199.99),
    new ProductCommodity(38, "6pack Smirnoff Storm Can", "6pack Smirnoff Storm Can", 1, 13, 189.99),
  ])
];