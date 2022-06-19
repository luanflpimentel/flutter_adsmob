// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_adsmob/models/city.dart';

class CityList extends StatelessWidget {
  final City? city;

  const CityList(
    this.city, {
    Key? key,
  }) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
        ),
        Text(
          city!.name,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          city!.state,
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
        ),
        SizedBox(
          child: Image.network(city!.cityUrl),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.deepOrange,
                width: 5.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
