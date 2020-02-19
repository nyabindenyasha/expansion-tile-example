class Phone {
  
  final int index;
  final String phoneName;
  final List<Series> series;

  Phone(this.index, this.phoneName, this.series);
}

class Series{
  int index;
  String seriesName;
  String year;
  List<Models> models;

  Series(this.index, this.seriesName, this.year, this.models);
 }

class Models{
  int index;
  String modelName;

  Models(this.index, this.modelName);
}