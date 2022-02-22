import 'package:flutter/material.dart';

AppBar appBarCoustomm(
  BuildContext context, {
  String title = "Jusber",
  bool backButtom = false,
}) {
  return AppBar(
      leading: backButtom
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.grey,
            )
          : Container(),
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: const Color(0xffD3D8E0),
            iconSize: 30)
      ],
      backgroundColor: const Color(0xffFCFCFC),
      centerTitle: true,
      title: Text(title,
          style: const TextStyle(
              fontSize: 14,
              color: Color(0xffA4A4A4),
              fontWeight: FontWeight.bold)));
}
