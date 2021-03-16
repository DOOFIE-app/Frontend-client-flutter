import 'package:flutter/material.dart';

import '../../models/shop.dart';

class ShopProvider extends ChangeNotifier {
  List<Ambiences> _ambienceList = [];
  List<PreferredSalon> _preferredShop = [];
  List<SalonDetails> _shopList = [];
  bool _isShopListLoading = false;
  List<num> _selectedAmbiences = [];

  // LocationProvider locationProvider;
  // SalonsRepository _salonsRepository;
  //
  // HomeProvider({this.locationProvider}) : super() {
  //   _salonsRepository = SalonsRepository();
  // }

  //getter
  List<Ambiences> get ambienceList => _ambienceList;
  List<PreferredSalon> get preferredShop => _preferredShop;
  List<SalonDetails> get shopList => _shopList;
  bool get isShopListLoading => _isShopListLoading;
  List<num> get selectedAmbiences => _selectedAmbiences;

  Future<void> loadCategories() async {
    _ambienceList = [
      Ambiences(id: 1, name: 'music', icon: Icons.music_note_rounded),
      Ambiences(id: 2, name: 'A/c', icon: Icons.ac_unit_rounded),
      Ambiences(id: 3, name: 'Unisex', icon: Icons.pregnant_woman_rounded),
      Ambiences(id: 4, name: 'Spa', icon: Icons.spa_rounded),
      Ambiences(id: 5, name: 'Haircut', icon: Icons.cut_rounded),
      Ambiences(id: 6, name: 'Facial', icon: Icons.face_rounded),
    ];
    notifyListeners();
  }

  void loadPreferredSalon() {
    _preferredShop = [
      PreferredSalon(
          salonId: 1,
          salonName: 'Tony&Guy',
          imgUrl:
              'https://i.pinimg.com/280x280_RS/54/b2/0a/54b20aca9087b679ac58930702228569.jpg',
          address: 'Cross-cut Road',
          rating: 4),
      PreferredSalon(
          salonId: 2,
          salonName: 'Green Trends',
          imgUrl:
              'https://www.mygreentrends.in/wp-content/uploads/2020/08/logo.png',
          address: 'Gandhigramam',
          rating: 4),
      PreferredSalon(
          salonId: 3,
          salonName: 'Truck Cuts',
          imgUrl:
              'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/05/attachment_57184857-e1558020946793.png?auto=format&q=60&fit=max&w=930',
          address: 'Saravanampatti',
          rating: 4),
      PreferredSalon(
          salonId: 4,
          salonName: 'African Lady',
          imgUrl: null,
          address: 'R S Puram',
          rating: 4),
      PreferredSalon(
          salonId: 5,
          salonName: 'Beauty&Hair',
          imgUrl: null,
          address: 'ECR road',
          rating: 4),
    ];
    notifyListeners();
  }

  Future<void> loadSalonList() async {
    _shopList = [
      SalonDetails(
        salonId: 1,
        salonName: 'Tandoori shop',
        logoUrl:
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
        coverImageUrl:
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
        address: 'pallapatti',
        contactNumber: '9361144746',
        rating: 4,
        ambiance: [
          SalonAmbiances(id: 1, name: 'a/c'),
          SalonAmbiances(id: 2, name: 'A/c')
        ],
        openTime: {'hour': '07', 'minute': '30'},
        closeTime: {'hour': '13', 'minute': '30'},
      ),
      SalonDetails(
        salonId: 1,
        salonName: 'Tandoori shop',
        logoUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkW7L8Xo9sF5oR45e0B4wSlfoiOLCFF3g8hQ&usqp=CAU',
        coverImageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkW7L8Xo9sF5oR45e0B4wSlfoiOLCFF3g8hQ&usqp=CAU',
        address: 'pallapatti',
        contactNumber: '9361144746',
        rating: 4,
        ambiance: [
          SalonAmbiances(id: 1, name: 'a/c'),
          SalonAmbiances(id: 2, name: 'A/c')
        ],
        openTime: {'hour': '07', 'minute': '30'},
        closeTime: {'hour': '13', 'minute': '30'},
      ),
      SalonDetails(
        salonId: 1,
        salonName: 'Tandoori shop',
        logoUrl:
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
        coverImageUrl:
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
        address: 'pallapatti',
        contactNumber: '9361144746',
        rating: 4,
        ambiance: [
          SalonAmbiances(id: 1, name: 'a/c'),
          SalonAmbiances(id: 2, name: 'A/c')
        ],
        openTime: {'hour': '07', 'minute': '30'},
        closeTime: {'hour': '13', 'minute': '30'},
      ),
      SalonDetails(
        salonId: 1,
        salonName: 'Tandoori shop',
        logoUrl:
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
        coverImageUrl:
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
        address: 'pallapatti',
        contactNumber: '9361144746',
        rating: 4,
        ambiance: [
          SalonAmbiances(id: 1, name: 'a/c'),
          SalonAmbiances(id: 2, name: 'A/c')
        ],
        openTime: {'hour': '07', 'minute': '30'},
        closeTime: {'hour': '13', 'minute': '30'},
      ),
      SalonDetails(
        salonId: 1,
        salonName: 'Tandoori shop',
        logoUrl:
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
        coverImageUrl:
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
        address: 'pallapatti',
        contactNumber: '9361144746',
        rating: 4,
        ambiance: [
          SalonAmbiances(id: 1, name: 'a/c'),
          SalonAmbiances(id: 2, name: 'A/c')
        ],
        openTime: {'hour': '07', 'minute': '30'},
        closeTime: {'hour': '13', 'minute': '30'},
      ),
    ];
    notifyListeners();
  }

  Future<void> selectAmbience(num index) async {
    /*if (_selectedAmbiences.isEmpty) {
      _selectedAmbiences.add(ambienceList[index].id);
      notifyListeners();
    } else if (_selectedAmbiences.contains(ambienceList[index].id)) {
      _selectedAmbiences.remove(ambienceList[index].id);
      notifyListeners();
    } else {
      _selectedAmbiences.add(ambienceList[index].id);
      notifyListeners();
    }
    await loadSalonList();*/
  }

  List<SalonDetails> generateSalonListWithAmbience() {
    List<SalonDetails> salonsById = [];
    // salonsById.addAll(_salonList.where((element) {
    //   bool found = false;
    //   for (num i = 0; i < _selectedAmbiences.length; i++) {
    //     for (num j = 0; j < element.ambiance.length; j++) {
    //       if (element.ambiance[j].id == _selectedAmbiences[i]) {
    //         found = true;
    //         break;
    //       }
    //     }
    //   }
    //   return found;
    // }));
    return salonsById;
  }
}
