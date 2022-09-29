import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final BuildContext? context;
  const CustomDrawer({Key? key,this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('DevsTravel',style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue'
                ),),
                Text('Versão 1.0',style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue'
                ),),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.blue
            ),
          ),
          ListTile(
            leading: Icon(Icons.home,color: Colors.black,),
            title: Text('Home'),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.public,color: Colors.black,),
            title: Text('Escolher Continente'),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/continent');
            },
          ),
          ListTile(
            leading: Icon(Icons.search,color: Colors.black,),
            title: Text('Buscar Cidade'),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/search');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite,color: Colors.black,),
            title: Text('Cidades Salvas'),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/favorites');
            },
          ),
        ],
      ),
    );
  }
}

