import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/shop.dart';
import '../../utilities/commons.dart';

class ShopListWidget extends StatelessWidget {
  final List<SalonDetails> salonList;
  final bool showScroll;

  const ShopListWidget(
      {Key key, @required this.salonList, this.showScroll = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: showScroll ? null : const NeverScrollableScrollPhysics(),
        itemCount: salonList.isNotEmpty ? salonList.length : 0,
        itemBuilder: (context, index) =>
            SalonCard(shopDetails: salonList[index]));
  }
}

class SalonCard extends StatelessWidget {
  final SalonDetails shopDetails;

  const SalonCard({Key key, @required this.shopDetails}) : super(key: key);

  Future<void> onclick(BuildContext context) async {
    Navigator.pushNamed(context, '/menu');
  }

  static Container _salonLogoPlaceHolder() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        image: const DecorationImage(
          image: AssetImage('assets/images/salon-logo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await onclick(context);
      },
      child: Stack(
        children: [
          Container(
            height: 170,
          ),
          Positioned(
            top: 5,
            right: 10,
            left: 10,
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Commons.greyAccent2)),
            ),
          ),
          Positioned(
            top: 5.5,
            right: 10.5,
            left: 10.5,
            child: CachedNetworkImage(
              imageUrl: shopDetails.logoUrl,
              imageBuilder: (context, imageProvider) => Container(
                height: 89.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => _salonLogoPlaceHolder(),
              errorWidget: (context, url, error) => _salonLogoPlaceHolder(),
            ),
          ),
          Positioned(
              top: 100,
              left: 20,
              child: Text(
                shopDetails.salonName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Commons.bgColor),
              )),
          Positioned(
            top: 100,
            right: 20,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 15,
                ),
                Text(
                  '${shopDetails.rating.toString()}/5', //rating,
                  style: TextStyle(
                      fontSize: 11, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          Positioned(
              top: 120,
              left: 20,
              right: 20,
              child: Text(
                shopDetails.address,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                ),
              )),

          // Positioned(
          //   bottom: 5.5,
          //   right: 10.5,
          //   left: 10.5,
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 15,
          //       ),
          //       Container(
          //         height: 70,
          //         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          //         width: MediaQuery.of(context).size.width - 150,
          //         child: Column(
          //           children: [
          //             Container(
          //                 height: 30,
          //                 width: MediaQuery.of(context).size.width - 130,
          //                 alignment: Alignment.centerLeft,
          //                 child: Text(
          //                   salonDetails.salonName,
          //                   overflow: TextOverflow.ellipsis,
          //                   style: const TextStyle(
          //                       fontSize: 16, fontWeight: FontWeight.bold),
          //                 )),
          //             Container(
          //               height: 16,
          //               width: MediaQuery.of(context).size.width - 130,
          //               alignment: Alignment.topLeft,
          //               child: Text(
          //                 salonDetails.address,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(
          //                     fontSize: 14,
          //                     color: Colors.black.withOpacity(0.6)),
          //               ),
          //             ),
          //             Container(
          //               height: 20,
          //               width: MediaQuery.of(context).size.width - 130,
          //               alignment: Alignment.bottomLeft,
          //               child: Container(
          //                 height: 20,
          //                 width: 50,
          //                 alignment: Alignment.center,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   border: Border.all(color: Commons.greyAccent1),
          //                 ),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Icon(
          //                       Icons.star,
          //                       color: Colors.orange,
          //                       size: 15,
          //                     ),
          //                     Text(
          //                       salonDetails.rating.toString(), //rating,
          //                       style: TextStyle(
          //                           fontSize: 14,
          //                           color: Colors.black.withOpacity(0.6)),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //           width: 50,
          //           alignment: Alignment.center,
          //           child: Text(
          //             'Open', //rating,
          //             style: TextStyle(
          //                 fontSize: 14, color: Colors.green.withOpacity(0.6)),
          //           )),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
