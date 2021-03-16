import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utilities/commons.dart';
import 'address.provider.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key key}) : super(key: key);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  AddressProvider _addressProvider;
  @override
  Widget build(BuildContext context) {
    _addressProvider = Provider.of<AddressProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
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
            Positioned(
              top: 20,
              child: Container(
                width: 300,
                height: 100,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      'Your Address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  _doorNumField(),
                  _areaField(),
                  _nearByAddressField(),
                ],
              ),
            ),
            Positioned(bottom: 20, child: _submitButton()),
          ],
        ),
      ),
    );
  }

  Widget _doorNumField() {
    return ListTile(
      title: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: .5)),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Door number',
            labelStyle: TextStyle(color: Commons.greyAccent2),
          ),
          onChanged: (String value) {
            _addressProvider.changeDoorNum(value);
          },
        ),
      ),
    );
  }

  Widget _nearByAddressField() {
    return ListTile(
      title: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: .5)),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Near by',
            labelStyle: TextStyle(color: Commons.greyAccent2),
          ),
          onChanged: (String value) {
            _addressProvider.changeNearByAddress(value);
          },
        ),
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        if (_addressProvider.valid) {
          Navigator.pushNamed(context, '/shops');
        }
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
            'Order food',
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

  Widget _areaField() {
    return ListTile(
      title: DropdownButton<String>(
        value: _addressProvider.area,
        style: TextStyle(color: Colors.white, fontSize: 16),
        onChanged: (String value) => _addressProvider.changeArea(value),
        hint: Text(
          'Category',
          textAlign: TextAlign.center,
          style: TextStyle(color: Commons.greyAccent2),
        ),
        items: _addressProvider.streets.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              '$item',
              style: TextStyle(color: Commons.greyAccent3),
            ),
          );
        }).toList(),
      ),
    );
  }
}


