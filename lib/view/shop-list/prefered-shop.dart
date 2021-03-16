import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/shop.dart';
import '../../utilities/commons.dart';

class PreferredShop extends StatelessWidget {
  List<PreferredSalon> preferredSalon;
  PreferredShop({Key key, this.preferredSalon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width,
      color: Commons.greyAccent1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemCount: preferredSalon != null ? preferredSalon.length : 0,
        itemBuilder: (BuildContext context, num index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/menu');
            },
            child: Card(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Colors.white),
                    ),
                    width: 175,
                    height: 233,
                    child: Stack(
                      children: [
                        Wrap(children: [
                          Container(
                            height: 120,
                            width: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/shop-bg.webp'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 233,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ]),
                        Positioned(
                          top: 90,
                          left: 15,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: (preferredSalon[index].imgUrl == null)
                                      ? const AssetImage(
                                          'assets/images/salon-logo.png')
                                      : NetworkImage(
                                          preferredSalon[index].imgUrl)),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(preferredSalon[index].salonName,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 5, bottom: 10),
                                child: Text(
                                  preferredSalon[index].address,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 15,
                              ),
                              Text(
                                preferredSalon[index]
                                    .rating
                                    .toString(), //rating,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))),
          );
        },
      ),
    );
  }
}
