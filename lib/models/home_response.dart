import 'Slider.dart';
import 'categories.dart';
import 'products.dart';

class HomeResponse {
  late List<Slider> slider;
  late List<Categories> categories;
  late List<Product> latestProducts;
  late List<Product> famousProducts;

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider.add(Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }

    if (json['latest_products'] != null) {
      latestProducts = <Product>[];
      json['latest_products'].forEach((v) {
        latestProducts.add(Product.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <Product>[];
      json['famous_products'].forEach((v) {
        famousProducts.add(Product.fromJson(v));
      });
    }
  }
}
