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
        title: _addItemButton(),
        // Text('Menu'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
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
                                      Icon(Icons.center_focus_strong_sharp,color: Colors.green,size: 20,),
                                      Text(
                                          ' ${_menuProvider.foodList[itemIndex].name}',
                                          style: TextStyle(
                                            color: Commons.bgColor,
                                            fontSize: 15,                                    
                                          ),
                                        ),
                                    ],
                                  ),),    
                                  Positioned(top: 55,
                                  left: 45,
                                    child: Text(
                                          '₹${_menuProvider.foodList[itemIndex].amount}',
                                          style: TextStyle(
                                            color: Commons.bgColor,
                                            fontSize: 13, 
                                            fontWeight: FontWeight.bold                                   
                                          ),
                                        ),),
                                        Positioned(
                                          right: 20,
                                          child: Image.network(_menuProvider.foodList[itemIndex].image,width: 100,height: 100,fit: BoxFit.cover,)),                          
                                  Positioned(
                                    bottom: 0,
                                    right: 10,
                                    left: 10,
                                    child: Divider(thickness: 1,)),                                
                              ],
                            )
                          : Container()),
                ],
              );
            }),
      ),
    );
  }

  Widget _addItemButton() {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(context, '/menu-form');
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Commons.greyAccent3, width: .7),
            borderRadius: BorderRadius.circular(4)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              size: 35,
              color: Colors.green,
            ),
            Text(
              'Add food to menu',
              style: TextStyle(
                color: Commons.bgColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
