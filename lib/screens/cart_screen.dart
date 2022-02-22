import 'package:flutter/material.dart';
import 'package:resturent_app/models/productItem.dart';
import 'package:resturent_app/screens/payment_screen.dart';
import 'package:resturent_app/shared/custem_appbar.dart';

class CartScreen extends StatefulWidget {
  final List<ProductListModel> productCart;
  const CartScreen({required this.productCart, Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCoustomm(context, title: "My Cart", backButtom: true),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              color: const Color(0xffEDEDED),
              child: ListView.builder(
                itemCount: widget.productCart.length,
                itemBuilder: (context, index) {
                  return productTile(widget.productCart[index], index);
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 272),
                      child: Text(
                        "Your Order",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Bill Total",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff585858)),
                        ),
                        Expanded(child: Container()),
                        Text(
                          " ₹" + totalPrice(),
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xff585858)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Discount",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff585858)),
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "30%",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff585858)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Grand Total",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Expanded(child: Container()),
                        Text(
                          " ₹" + grandTotal(),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const PaymentScreen()),
                              ));
                        },
                        child: const Text("Proceed to pay"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget productTile(ProductListModel model, int index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        height: 135,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/ProductImg" + model.image + ".png",
                    height: 50,
                    width: 50,
                  ),
                  Column(
                    children: [
                      Text(model.name),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, left: 7),
                        child: Text("200ml, 1x " + (model.price).toString()),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  IconButton(
                      onPressed: () {
                        widget.productCart.removeAt(index);
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (model.qty == 1) {
                          widget.productCart.removeAt(index);
                        }
                        model.qty--;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline_outlined,
                        color: Colors.grey,
                      )),
                  Text(model.qty.toString()),
                  IconButton(
                      onPressed: () {
                        model.qty++;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        color: Colors.grey,
                      )),
                  Expanded(child: Container()),
                  Text(
                    "\$ " + (model.qty * model.price).toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String totalPrice() {
    double total = 0;
    for (ProductListModel model in widget.productCart) {
      total = total + (model.qty * model.price);
    }
    return total.toStringAsFixed(2);
  }

  String grandTotal() {
    double totalAfterDis = 0;

    for (ProductListModel model in widget.productCart) {
      totalAfterDis = totalAfterDis + (model.qty + model.price * 0.7);
    }
    return totalAfterDis.toStringAsFixed(2);
  }
}
