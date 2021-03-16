import 'package:flutter/material.dart';

class Ambiences {
  final num id;
  final String name;
  final IconData icon;

  Ambiences({this.id, this.name, this.icon});
}

class PreferredSalon {
  final num salonId;
  final String salonName;
  final String imgUrl;
  final String address;
  final num rating;

  PreferredSalon(
      {this.salonId, this.salonName, this.imgUrl, this.address, this.rating});
}

class SalonDetails {
  final num salonId;
  final String salonName;
  final String logoUrl;
  final String coverImageUrl;
  final String address;
  final String contactNumber;
  final num rating;
  final List<SalonAmbiances> ambiance;
  final Map openTime; //{'hour':'13','minute':'30'}
  final Map closeTime; //{'hour':'13','minute':'30'}

  SalonDetails({
    this.salonId,
    this.salonName,
    this.logoUrl,
    this.coverImageUrl,
    this.address,
    this.contactNumber,
    this.rating,
    this.ambiance,
    this.openTime,
    this.closeTime,
  });

  factory SalonDetails.fromJson(Map<String, dynamic> json) {
    return SalonDetails(
        salonId: json['id'] ?? '',
        salonName: json['name'] ?? '',
        contactNumber: json['contact_number'] ?? '',
        logoUrl: json['logoUrl'] ?? '',
        coverImageUrl: json['coverImgUrl'] ?? '',
        address: json['addressContent'] ?? '',
        ambiance: json['ambiences']
                ?.map((_ambience) => SalonAmbiances.fromJson(_ambience))
                .cast<SalonAmbiances>()
                .toList() ??
            [],
        rating: 5,
        openTime: {'hour': '09', 'minute': '30'},
        closeTime: {'hour': '13', 'minute': '30'});
  }
}

class SalonList {
  List<SalonDetails> salonList;

  SalonList({this.salonList});

  static List<SalonDetails> fromJson(List json) {
    return json
        .map((element) => SalonDetails.fromJson(element))
        .cast<SalonDetails>()
        .toList();
  }
}

class SalonAmbiances {
  final num id;
  final String name;

  SalonAmbiances({this.id, this.name});

  factory SalonAmbiances.fromJson(Map<String, dynamic> json) {
    return SalonAmbiances(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class SearchList {
  final num id;
  final String name;
  final String category;

  SearchList({this.id, this.name, this.category});
}

class UserLocation {
  final String address;
  final String locality;
  final num latitude;
  final num longitude;

  UserLocation({this.address, this.locality, this.latitude, this.longitude});
}
