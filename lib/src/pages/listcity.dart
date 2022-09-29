import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ListCityPage extends StatelessWidget {
  //const ListCityPage({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  void cityBoxAction(cityData){

  }
  @override
  Widget build(BuildContext context) {
    final dynamic continentIndex = ModalRoute.of(context)!.settings.arguments;

    return Consumer<AppData>(

        builder: (ctx,appdata,child) {
          var cities = [];
          for (var country in appdata.data[continentIndex]['countries']){
            cities.addAll(country['cities']);
          }
          return Scaffold(
            key: _scaffoldKey,
            appBar:CustomAppBar(
              scaffoldKey:_scaffoldKey,
              title:'${appdata.data[continentIndex]['name']} (${cities.length} cidades)',
              context:context,
              showBack: true,
            ),
            drawer: CustomDrawer(
              context: context,
            ),
            backgroundColor: Colors.white,
            body: GridView.count(
                crossAxisCount: 3,
                children: List.generate(cities.length, (index) {
                  return CityBox(
                      data: cities[index],
                      onTap: cityBoxAction,
                  );
                })
            )
          );
        }
    );
  }
}
