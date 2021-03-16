import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:provider/provider.dart';

import '../../utilities/commons.dart';
import 'prefered-shop.dart';
import 'shop-list-widget.dart';
import 'shop.provider.dart';

class ShopListPage extends StatefulWidget {
  const ShopListPage({Key key}) : super(key: key);

  @override
  _ShopListPage createState() => _ShopListPage();
}

class _ShopListPage extends State<ShopListPage> {
  ShopProvider _shopProvider;

  @override
  void initState() {
    super.initState();
    _shopProvider = Provider.of<ShopProvider>(context, listen: false);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _shopProvider.loadCategories());
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _shopProvider.loadPreferredSalon());
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _shopProvider.loadSalonList());
  }

  @override
  Widget build(BuildContext context) {
    _shopProvider = Provider.of<ShopProvider>(context);
    return Scaffold(body: _homeView());
  }

  Widget _homeView() {
    return SafeArea(
      child: ListView(
        children: [
          //_categories(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              'Most Preferred',
              style: TextStyle(
                  color: Commons.bgColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
          SingleChildScrollView(
            child: Wrap(
              children: [
                PreferredShop(
                  preferredSalon: _shopProvider.preferredShop,
                ),
                if (_shopProvider.isShopListLoading)
                  Column(
                    children: <Widget>[
                      const ListTileShimmer(),
                      const ListTileShimmer(),
                      const ListTileShimmer(),
                    ],
                  )
                else if ((!_shopProvider.isShopListLoading) &&
                        _shopProvider.shopList.isEmpty ||
                    (!_shopProvider.isShopListLoading) &&
                        _shopProvider.shopList == null)
                  const Center(child: Text('No Shop Available in this Area'))
                else
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ShopListWidget(
                        salonList: _shopProvider.shopList, showScroll: false),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories() {
    return Column(
      children: [
        const Divider(
          height: 1,
          thickness: 0.2,
          indent: 8,
          endIndent: 8,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            alignment: Alignment.center,
            color: Commons.greyAccent1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _shopProvider.ambienceList.length,
                itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(5),
                    width: 80,
                    child: InkWell(
                        onTap: () {
                          _shopProvider.selectAmbience(index);
                        },
                        child: Column(children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: (_shopProvider.selectedAmbiences
                                        .contains(_shopProvider
                                            .ambienceList[index].id))
                                    ? Commons.bgColor
                                    : Colors.white,
                                border: Border.all(width: .1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                _shopProvider.ambienceList[index].icon,
                                color: (_shopProvider.selectedAmbiences
                                        .contains(_shopProvider
                                            .ambienceList[index].id))
                                    ? Colors.white
                                    : Commons.bgColor,
                                size: 40,
                              )),
                          Container(
                            height: 20,
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              _shopProvider.ambienceList[index].name,
                              style: TextStyle(
                                  color: Commons.greyAccent4, fontSize: 12),
                            ),
                          ),
                        ]))))),
        const Divider(
          color: Colors.grey,
          height: 0,
          thickness: 0.2,
          indent: 8,
          endIndent: 8,
        ),
      ],
    );
  }
}
