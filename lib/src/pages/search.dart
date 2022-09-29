import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';


class SearchPage extends StatelessWidget {
  //const SearchPage({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(

        builder: (ctx,appdata,child) => Scaffold(
          key: _scaffoldKey,
          appBar:CustomAppBar(
            scaffoldKey:_scaffoldKey,
            title: 'Busque uma cidade',
            hideSearch: true,
            context:context,
          ),
          drawer: CustomDrawer(
            context: context,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Página de buscar...'),
              ],
            ),
          ),
        )
    );
  }
}
