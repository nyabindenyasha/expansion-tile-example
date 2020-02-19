class MyTile {
  String title;
  List<SubTile> children;
  MyTile(this.title, [this.children = const <SubTile>[]]);
}

class SubTile {
  String title;
  List<SubSubTile> children;
  SubTile(this.title, [this.children = const <SubSubTile>[]]);
}


class SubSubTile {
  String title;
  SubSubTile(this.title);
}