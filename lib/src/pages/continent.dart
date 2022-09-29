import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ContinentPage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );
  void seeCityAction(context,continentIndex){
    Navigator.pushNamed(context, '/listcity',arguments: continentIndex);
  }
  void cityBoxAction(cityData){

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(

        builder: (ctx,appdata,child) => Scaffold(
          key: _scaffoldKey,
          appBar:CustomAppBar(
            scaffoldKey:_scaffoldKey,
            title: 'Escolhe um continente',
            context:context,
          ),
          drawer: CustomDrawer(
            context: context,
          ),
          body: ListView.builder(
            itemCount: appdata.data.length,
            itemBuilder: (context,index){
              //return Text(appdata.data[index]['name']);

              var cities = [];

              for(var country in appdata.data[index]['countries']){
                cities.addAll(country['cities']);
              }

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('${appdata.data[index]['name']} (${appdata.data[index]['countries'].length})',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica Neue',
                          ),),
                      ),
                      FlatButton(onPressed: (){
                        seeCityAction(context,index);
                      }, child:
                      const Text('Ver Cidades',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica Neue',
                          color: Colors.grey,
                        )),
                      )
                    ],
                  ),
                  Container(
                    height: 130,
                    margin: EdgeInsets.only(bottom: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cities.length,
                      itemBuilder: (cityContext,cityIndex){
                        return CityBox(
                          data:cities[cityIndex],
                          onTap:(){
                            cityBoxAction(cityIndex);
                          }
                        );
                      },
                    ),
                  )
                ],
              );
            },
          )
        )
    );
  }
}
