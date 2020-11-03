import 'package:get/get.dart';
import 'package:getxusing/models/product.dart';

class CartController extends GetxController {
  var cartItem = List<Product>().obs;
  int get count => cartItem.length;
  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItem.add(product);
  }
}
