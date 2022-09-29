

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';
import 'src/pages/home.dart';
import 'src/pages/preload.dart';
import 'src/pages/search.dart';
import 'src/pages/continent.dart';
import 'src/pages/listcity.dart';


void main() async{

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) =>AppData(),)
        ],
        child: MyApp(),
      )
  );
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/preload':(context) => PreloadPage(),
        '/home':(context) => HomePage(),
        '/search':(context) => SearchPage(),
        '/continent':(context) => ContinentPage(),
        '/listcity':(context) => ListCityPage(),
      },
      initialRoute: '/preload',
    );
  }
}
