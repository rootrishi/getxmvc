import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxusing/controler/cart_controller.dart';
import 'package:getxusing/controler/shopingcontroler.dart';

class ShopingPage extends StatelessWidget {
  final shoppingControler =
      Get.put(ShoppingControler()); //Dependency Inj. by Get.put
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingControler>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to Cart'),
                              ),
                            //   Obx(() => IconButton(
                            //         icon: controller
                            //                 .products[index].isFavorite.value
                            //             ? Icon(Icons.check_box_rounded)
                            //             : Icon(Icons
                            //                 .check_box_outline_blank_outlined),
                            //         onPressed: () {
                            //           controller.products[index].isFavorite
                            //               .toggle();
                            //         },
                            //       ))
                            // ],
                            ]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(
              //init: CartController),
              //   initState: (_) {},
              builder: (controller) {
                return Text(
                  'Total Amount: \$ ${controller.totalPrice}',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                );
              },
            ),
            SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          label: GetX<CartController>(
            // init: MyController(),
            //   initState: (_) {},
            builder: (controller) {
              return Text(
                controller.count.toString(),
                style: TextStyle(color: Colors.black, fontSize: 25),
              );
            },
          )),
    );
  }
}
