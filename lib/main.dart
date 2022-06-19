import 'package:flutter/material.dart';
import 'package:flutter_adsmob/provider/citys.dart';
import 'package:flutter_adsmob/routes/app_routes.dart';
import 'package:flutter_adsmob/views/login_page.dart';
import 'package:flutter_adsmob/views/city_form.dart';
import 'package:flutter_adsmob/views/city_list.dart';
import 'package:flutter_adsmob/views/city_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Citys(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter GeoLibras',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.home: (_) => const LoginPage(),
          AppRoutes.cityList: (_) => const CityList(),
          AppRoutes.cityForm: (_) => const CityForm(),
          AppRoutes.cityPage: (_) => const CityPage(),
        },
      debugShowCheckedModeBanner: false,
      ),
    );
    
  }
}
