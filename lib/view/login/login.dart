import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/commons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Commons.bgColor, BlendMode.dstATop),
              )),
            ),
            Container(
              height: 400,
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  _mobileNumberField(),
                  _loginButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _mobileNumberField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: 40,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Commons.bgColor, width: .5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextField(
          textAlign: TextAlign.start,
          cursorHeight: 20,
          cursorWidth: .5,
          cursorColor: Commons.bgColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Mobile Number',
              hintStyle: TextStyle(color: Commons.greyColor2)),
          onChanged: null,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return GestureDetector(
      onTap: () async {
        Navigator.pushNamed(context, '/shops');
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.green,
          ),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
