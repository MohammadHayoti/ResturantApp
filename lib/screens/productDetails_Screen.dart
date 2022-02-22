import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:resturent_app/models/productItem.dart';
import 'package:resturent_app/screens/cart_screen.dart';
import 'package:resturent_app/shared/custem_appbar.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  List<ProductListModel> productOfList;
  ProductListModel product;
  int selectedIndex;

  ProductDetails(this.product, this.productOfList, this.selectedIndex);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var selctedTitle = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCoustomm(context,
          title: selctedTitle == "" ? widget.product.name : selctedTitle,
          backButtom: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              height: 490,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                onPageChanged: (index) {
                  selctedTitle = widget.productOfList[index].name;
                  setState(() {});
                },
                controller: PageController(
                    initialPage: widget.selectedIndex, viewportFraction: 0.8),
                itemCount: widget.productOfList.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: widget.productOfList[index].color)),
                            child: Column(
                              children: [
                                const SizedBox(height: 50),
                                Image.asset(
                                  "assets/images/ProductImg" +
                                      widget.productOfList[index].image +
                                      ".png",
                                  scale: 0.5,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  widget.productOfList[index].name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "200ml, 1x " +
                                          widget.productOfList[index].price
                                              .toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: Divider(color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30, left: 17),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {});

                                            if (widget
                                                    .productOfList[index].qty >=
                                                1) {
                                              widget.productOfList[index].qty--;
                                            } else {
                                              return;
                                            }
                                          },
                                          icon: const Icon(Icons
                                              .remove_circle_outline_rounded)),
                                      Text(
                                        widget.productOfList[index].qty
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {});

                                            widget.productOfList[index].qty++;
                                          },
                                          icon: const Icon(Icons
                                              .add_circle_outline_rounded)),
                                      Expanded(child: Container()),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          "\$" +
                                              (widget.productOfList[index]
                                                          .price *
                                                      widget
                                                          .productOfList[index]
                                                          .qty)
                                                  .toStringAsFixed(2),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 27,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RatingBar.builder(
                            initialRating: widget.productOfList[index].rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              widget.productOfList[index].rating = rating;
                              setState(() {});
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "You Have Rate " +
                                widget.productOfList[index].rating.toString() +
                                " Stars",
                            style: const TextStyle(
                                color: Color(0xff959595),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  gradient: const LinearGradient(
                      colors: [Color(0xffEC90E9), Color(0xffF45D7E)]),
                ),
                height: 50,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    final List<ProductListModel> newList = [];

                    for (ProductListModel model in widget.productOfList) {
                      if (model.qty > 0) {
                        newList.add(model);
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          productCart: newList,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
