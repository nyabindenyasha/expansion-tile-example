import 'package:slider_app/models/shop.dart';

class ProductCommodity {

    int id;
    String name;
    String description;
    int shopId;
    Shops shopName;
    int categoryId;
    String categoryName;
    double price; 
    // cartMork?: CartMock;

    ProductCommodity(this.id, this.name, this.description, this.shopId, this.categoryId, this.price);
  }