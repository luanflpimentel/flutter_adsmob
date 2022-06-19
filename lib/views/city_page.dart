import 'package:flutter/material.dart';
import 'package:flutter_adsmob/components/city_tile.dart';
import 'package:flutter_adsmob/provider/citys.dart';
import 'package:provider/provider.dart';

class CityPage extends StatelessWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Citys citys = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Municípios'),
      ),
      body: ListView.builder(
        itemCount: citys.count,
        itemBuilder: (ctx, i) => CityList(citys.byIndex(i)),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/city-list');
          },
          // ignore: prefer_const_constructors
          child: Text('Voltar')),
      ],
    );
  }
}
