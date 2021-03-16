import 'package:doofieclient/view/shop-list/shop-list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utilities/app-theme.dart';
import 'view/login/login.dart';
//screens
import 'view/menu/menu.dart';
//providers
import 'view/menu/menu.provider.dart';
import 'view/shop-list/shop.provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuProvider()),
        ChangeNotifierProvider(create: (context) => ShopProvider()),
      ],
      child: MaterialApp(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
          routes: <String, WidgetBuilder>{
            '/shops': (BuildContext context) => ShopListPage(),
            '/menu': (BuildContext context) => MenuPage(),
          }),
    );
  }
}
