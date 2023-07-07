import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info(
      {super.key,
      required this.title,
      required this.subtitle,
      this.c = CrossAxisAlignment.center});
  final String title;
  final String subtitle;
  final CrossAxisAlignment c;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: c,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
