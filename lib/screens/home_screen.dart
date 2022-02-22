import 'package:flutter/material.dart';
import 'package:resturent_app/models/productItem.dart';
import 'package:resturent_app/screens/productDetails_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductListModel> productList = [
    ProductListModel(
        name: "waterMelon",
        price: 55.00,
        image: "2",
        color: [const Color(0xffA076E8), const Color(0xffFCB5F9)]),
    ProductListModel(
        name: "Orange",
        price: 45.00,
        image: "1",
        color: [const Color(0xffFD9B8D), const Color(0xffD3D8E0)]),
    ProductListModel(
        name: "blueburry",
        price: 35.00,
        image: "4",
        color: [const Color(0xffF46186), const Color(0xffFCB5F9)]),
    ProductListModel(
        name: "mango",
        price: 51.00,
        image: "2",
        color: [const Color(0xff97DEB4), const Color(0xffA86FDA)]),
    ProductListModel(
        name: "Avokado",
        price: 50.00,
        image: "3",
        color: [const Color(0xffA86FDA), const Color(0xffD3D8E0)]),
    ProductListModel(
        name: "grape",
        price: 55.00,
        image: "1",
        color: [const Color(0xff5CCD92), const Color(0xffFD9B8D)]),
    ProductListModel(
        name: "blueburry",
        price: 35.00,
        image: "2",
        color: [const Color(0xffA076E8), const Color(0xffFD9B8D)]),
    ProductListModel(
        name: "waterMelon",
        price: 51.00,
        image: "3",
        color: [const Color(0xffF46186), const Color(0xffA86FDA)]),
    ProductListModel(
        name: "Orange",
        price: 55.00,
        image: "4",
        color: [const Color(0xffA076E8), const Color(0xffFD9B8D)]),
    ProductListModel(
        name: "blueburry",
        price: 35.00,
        image: "4",
        color: [const Color(0xffFD9B8D), const Color(0xffA86FDA)]),
    ProductListModel(
        name: "Avokado",
        price: 50.00,
        image: "3",
        color: [const Color(0xffA86FDA), const Color(0xffFD9B8D)]),
    ProductListModel(
        name: "mango",
        price: 51.00,
        image: "2",
        color: [const Color(0xffF46186), const Color(0xffA86FDA)]),
    ProductListModel(
        name: "waterMelon",
        price: 55.00,
        image: "2",
        color: [const Color(0xffFD9B8D), const Color(0xffA86FDA)]),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (cdx, index) {
              return prodctCell(
                  product: productList[index], ctx: context, inx: index);
            }));
  }

  Widget prodctCell(
      {required ProductListModel product,
      required BuildContext ctx,
      context,
      required int inx}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            ctx,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetails(product, productList, inx)));
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: product.color),
                    borderRadius: BorderRadius.circular(37.5),
                  ),
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "\$" + product.price.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Image.asset(
                "assets/images/ProductImg" + product.image + ".png",
                height: 75,
                width: 75,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
