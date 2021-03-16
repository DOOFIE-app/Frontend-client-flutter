import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../utilities/commons.dart';
import 'menu.provider.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);
  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<MenuPage> {
  MenuProvider _menuProvider;

  int value = 0;

  @override
  void initState() {
    super.initState();
    MenuProvider menuProvider =
        Provider.of<MenuProvider>(context, listen: false);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => menuProvider.getFoodList());
  }

  @override
  Widget build(BuildContext context) {
    _menuProvider = Provider.of<MenuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: _pageTitle(),
        // Text('Menu'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Commons.bgColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _menuProvider.categoryList.length,
            itemBuilder: (context, index) {
              String category = _menuProvider.categoryList[index];
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      category.toUpperCase(),
                      style: TextStyle(
                        color: Commons.bgColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _menuProvider.foodList.length,
                      itemBuilder: (context, itemIndex) => (_menuProvider
                                  .foodList[itemIndex].categoryName ==
                              category)
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 140,
                                ),
                                Positioned(
                                  top: 35,
                                  left: 20,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.center_focus_strong_sharp,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                      Text(
                                        ' ${_menuProvider.foodList[itemIndex].name}',
                                        style: TextStyle(
                                          color: Commons.bgColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 55,
                                  left: 45,
                                  child: Text(
                                    '₹${_menuProvider.foodList[itemIndex].amount}',
                                    style: TextStyle(
                                        color: Commons.bgColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                    right: 20,
                                    child: Image.network(
                                      _menuProvider.foodList[itemIndex].image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )),
                                Positioned(
                                    left: 20, bottom: 20, child: _cartButton()),
                                Positioned(
                                    bottom: 0,
                                    right: 10,
                                    left: 10,
                                    child: Divider(
                                      thickness: 1,
                                    )),
                              ],
                            )
                          : Container()),
                ],
              );
            }),
      ),
    );
  }

  Widget _pageTitle() {
    return Text(
      'Menu',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _cartButton() {
    if ((value > 0)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                if (value != 0) {
                  _decrementCounter();
                }
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Commons.greyAccent2),
                    borderRadius: BorderRadius.circular(2),
                    color: Commons.greyAccent1),
                alignment: Alignment.center,
                child: Icon(
                  Icons.remove,
                  color: Commons.greyAccent4,
                  size: 25,
                ),
              )),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Commons.greyAccent2),
                bottom: BorderSide(color: Commons.greyAccent2),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              value.toString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
          InkWell(
              onTap: () {
                _incrementCounter();
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Commons.greyAccent2),
                    borderRadius: BorderRadius.circular(2),
                    color: Commons.greyAccent1),
                alignment: Alignment.center,
                child: Icon(
                  Icons.add,
                  color: Colors.green,
                  size: 25,
                ),
              )),
        ],
      );
    } else {
      return InkWell(
        onTap: () {
          _incrementCounter();
        },
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              border: Border.all(color: Commons.greyAccent2),
              borderRadius: BorderRadius.circular(2),
              color: Commons.greyAccent1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add to cart',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                ),
              ),
              Icon(
                Icons.add,
                color: Colors.green,
                size: 25,
              ),
            ],
          ),
        ),
      );
    }
  }

  void _incrementCounter() {
    setState(() {
      value = value + 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      value = value - 1;
    });
  }
}
