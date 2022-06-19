import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_adsmob/data/dummy_citys.dart';
import 'package:flutter_adsmob/models/city.dart';

class Citys with ChangeNotifier {
  final Map<String, City> _items = {...dummyCitys};

  List<City> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  City byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(City city) {
    if (city.id != null &&
        city.id!.trim().isNotEmpty &&
        _items.containsKey(city.id)) {
      _items.update(
        city.id!,
        (_) => City(
          id: city.id,
          name: city.name,
          state: city.state,
          cityUrl: city.cityUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => City(
          id: id,
          name: city.name,
          state: city.state,
          cityUrl: city.cityUrl,
        ),
      );
    }
    notifyListeners();
  }

  void remove(City city) {
    if (city.id != null) {
      _items.remove(city.id);
      notifyListeners();
    }
  }
}
