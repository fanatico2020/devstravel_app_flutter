import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? hideSearch;
  final bool? showBack;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final BuildContext? context;
  const CustomAppBar({Key? key,this.title,this.hideSearch = false,this.showBack = false,this.scaffoldKey,this.context}) : super(key: key);



  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {

    void searchAction(){
      Navigator.pushReplacementNamed(context, '/search');
    }

    IconButton drawerIcon = IconButton(onPressed: (){
      scaffoldKey?.currentState?.openDrawer();
    }, icon: Icon(Icons.menu,color: Colors.black,size: 30,));
    IconButton backIcon = IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,));
    IconButton leadingButton = drawerIcon;

    if(showBack!){
      leadingButton = backIcon;
    }
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      title: Text(title!,
        style:TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue',
        ),
        ),
      leading: leadingButton,
      actions: [
        IconButton(
            onPressed: searchAction,
            icon: Icon(Icons.search,color: Colors.black,size: 30,))
      ],
    );
  }
}
