import 'package:flutter/material.dart';
import 'models/phone.dart';

class TileAppMyn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: Text('ExpansionTile App'),
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
  final Phone myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(Phone t) {
    if (t.series.isEmpty)
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
          title: new Text(t.phoneName));

    return new ExpansionTile(
      key: new PageStorageKey<Phone>(t),
      leading: Icon(Icons.arrow_right),
      title: new Text(t.index.toString() + " " + t.phoneName),
     children: t.series.map(_buildTiles2).toList(),
    );
  }

    Widget _buildTiles2(Series s) {
    if (s.models.isEmpty)
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
          title: new Text(s.index.toString() + " " +  s.seriesName));

    return new ExpansionTile(
      key: new PageStorageKey<Series>(s),
      title: new Text(s.index.toString() + " " +  s.seriesName),
     children: s.models.map(_buildTiles3).toList(),
    );
  }

    Widget _buildTiles3(Models m) {
    if (m.modelName.isEmpty)
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
          title: new Text("no data"));

      return new ExpansionTile(
        title: new Text(m.index.toString() + " " +  m.modelName));
  }
}


List<Phone> listOfTiles = <Phone>[
  new Phone(1, "Samsung", [

    new Series(1, "J series", "2013", [
      new Models(1, "J1"),
      new Models(2, "J2"),
      new Models(3, "J3"),
      new Models(4, "J5"),
      new Models(5, "J7")
        ]     
      ),

    new Series(1, "S series", "2015", [
      new Models(1, "S4"),
      new Models(2, "S5"),
      new Models(3, "S6"),
      new Models(4, "S7"),
      new Models(5, "S8")
        ]     
      ),

    new Series(3, "A series", "2019", [
      new Models(1, "A10"),
      new Models(2, "A20"),
      new Models(3, "A40"),
      new Models(4, "A60"),
        ]     
      ),
      ], 
     ),

  new Phone(2, "Huawei", [

    new Series(1, "Y series", "2015", [
      new Models(1, "Y1"),
      new Models(2, "Y2"),
      new Models(3, "Y3"),
      new Models(4, "Y5"),
      new Models(5, "Y7")
        ]     
      ),

    new Series(2, "Honor series", "2015", [
      new Models(1, "Honor 5"),
      new Models(2, "Honor 7")
        ]     
      ),

    new Series(3, "P series", "2018", [
      new Models(1, "P8"),
      new Models(2, "P10"),
      new Models(3, "P20"),
      new Models(4, "P30"),
        ]     
      ),
      ], 
     ),

];

