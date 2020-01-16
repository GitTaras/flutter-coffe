import 'package:equatable/equatable.dart';

//Todo try this to reduce boilerplate code
// https://www.oleksandrkirichenko.com/blog/dart-extensions/

class Good extends Equatable {
  final String id;
  final bool isActive;
  final String price;
  final String picture;
  final String company;
  final String email;
  final String about;
  final String name;
  final String cornType;
  final String taste;
  final String originGeography;
  final String region;


  Good(this.id, this.isActive, 
    this.price, this.picture, {
    this.company, this.email, 
    this. about, this.name,
    this.cornType, this.taste, 
    this.originGeography,
    this.region
  });

  @override
  List<Object> get props => [
    id, isActive, price, picture,
    company, email,  about, name,
    cornType, taste, originGeography,
    region
  ];


  Good copyWith({
    String id, bool isActive, String price,
    String picture, String company, 
    String email, String about, String name,
    String cornType, String taste,
    String originGeography, String region
  }) {
    return Good(
      id ?? this.id, isActive ?? this.isActive, 
      price ?? this.price, picture ?? this.picture, 
      company: company ?? this.company, email: email ?? this.email, 
      about: about ?? this.about, name: name ?? this.name,
      cornType: cornType ?? this.cornType, taste: taste ?? this.taste, 
      originGeography: originGeography ?? this.originGeography,
      region: region ?? this.region
    );
  }

  @override
  String toString() {
    return '''Good{
      _id: $id, isActive: $isActive,
      price: $price, picture: $picture,
      company: $company, email: $email, about: $about
      name: $name, cornType: $cornType, taste: $taste,
      originGeography: $originGeography, region: $region
    }''';
  }


  Map<String, Object> toJson() {
    return {
      "_id" : id, 
      "isActive" : isActive,
      "price" : price,
      "picture" : picture,
      "company" : company,
      "email" : email,
      "about" : about,
      "name" : name,  
      "cornType": cornType,
      "taste": taste,
      "originGeography": originGeography,
      "region": region,
    };
  }

  static Good fromJson(Map<String, Object> json) {
    return Good(
      json["_id"] as String,
      json["isActive"] as bool,
      json["price"] as String,
      json["picture"] as String, 
      company: json["company"] as String,
      email: json["email"] as String,
      about: json["about"] as String,
      name : json["name"] as String,  
      cornType : json["cornType"] as String,
      taste : json["taste"] as String,
      originGeography : json["originGeography"] as String,
      region : json["region"] as String,
    );
  }
}