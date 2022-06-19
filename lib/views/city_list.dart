// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_adsmob/components/city_tile_crud.dart';
import 'package:flutter_adsmob/models/city.dart';
import 'package:flutter_adsmob/provider/citys.dart';
import 'package:flutter_adsmob/routes/app_routes.dart';
import 'package:provider/provider.dart';

class CityList extends StatelessWidget {
  const CityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Citys citys = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Municípios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.cityForm,
                arguments: const City(
                  id: '',
                  name: '',
                  state: '',
                  cityUrl: '',
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: citys.count,
        itemBuilder: (ctx, i) => CityTile(citys.byIndex(i)),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/city-page');
          },
          child: Text('Municípios Cadastrados')),
          ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          child: Text('Sair')),
      ],
    );
  }
}
