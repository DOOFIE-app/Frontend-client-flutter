import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utilities/app-theme.dart';

//screens
import 'view/menu/menu.dart';

//providers
import 'view/menu/menu.provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuProvider()),
      ],
      child: MaterialApp(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: MenuPage(),
          routes: <String, WidgetBuilder>{
            '/menu': (BuildContext context) => MenuPage(),
          }),
    );
  }
}