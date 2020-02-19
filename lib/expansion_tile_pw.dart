import 'package:flutter/material.dart';
import 'models/my_tile.dart';

class TileAppPW extends StatelessWidget {
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
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    print(listOfTiles);
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
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
          title: new Text(t.title));

    return new ExpansionTile(
      key: new PageStorageKey<int>(3),
      title: new Text(t.title),
      children: t.children.map(_buildTiles2).toList(),
    );
  }

  Widget _buildTiles2(SubTile st) {
    if (st.children.isEmpty)
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
          title: new Text(st.title));

    return new ExpansionTile(
 //     key: new PageStorageKey<int>(4),
      title: new Text(st.title),
      children: st.children.map(_buildTiles3).toList(),
    );
  }

    Widget _buildTiles3(SubSubTile sst) {
    return new ExpansionTile(
     // key: new PageStorageKey<int>(5),
      title: new Text(sst.title),
    );
  }
}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    'Animals',
    <SubTile>[
      new SubTile(
        'Dogs',
        <SubSubTile>[
          new SubSubTile('Coton de Tulear'),
          new SubSubTile('German Shepherd'),
          new SubSubTile('Poodle'),
        ],
      ),
      new SubTile('Cats'),
      new SubTile('Birds'),
    ],
  ),
  new MyTile(
    'Cars',
    <SubTile>[
      new SubTile('Tesla'),
      new SubTile('Toyota'),
    ],
  ),
  new MyTile(
    'Phones',
    <SubTile>[
      new SubTile('Google'),
      new SubTile('Samsung'),
      new SubTile(
        'OnePlus',
        <SubSubTile>[
          new SubSubTile('1'),
          new SubSubTile('2'),
          new SubSubTile('3'),
          new SubSubTile('4'),
          new SubSubTile('5'),
          new SubSubTile('6'),
          new SubSubTile('7'),
          new SubSubTile('8'),
          new SubSubTile('9'),
          new SubSubTile('10'),
          new SubSubTile('11'),
          new SubSubTile('12'),
        ],
      ),
    ],
  ),
];