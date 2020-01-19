class Coffe {
  final String _id;
  final bool isActive;
  final String price;
  final String picture;
  final String name;
  final String cornType;
  final String taste;
  final String originGeography;
  final String region;

  Coffe(this._id, this.isActive, this.price, this.picture, this.name, this.cornType, this.taste, this.originGeography, this.region);

  @override
  int get hashCode =>
      _id.hashCode ^ isActive.hashCode ^ price.hashCode ^ picture.hashCode ^ name.hashCode ^ cornType.hashCode ^ taste.hashCode ^ originGeography.hashCode ^ region.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Coffe &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          isActive == other.isActive &&
          price == other.price &&
          picture == other.picture &&
          name == other.name &&
          cornType == other.cornType &&
          taste == other.taste &&
          originGeography == other.originGeography &&
          region == other.region;

  Map<String, Object> toJson() {
    return {
      "_id" : _id, 
      "isActive" : isActive,
      "price" : price,
      "picture" : picture,
      "name" : name,
      "taste": taste, 
      "cornType" : cornType,
      "originGeography" : originGeography,
      "region" : region,
    };
  }

  Coffe copy(String _id, bool isActive, String price, String picture, String name, String taste, String cornType, String originGeography, String region) {
    return Coffe(
      _id, 
      isActive,
      price,
      picture,
      name,
      taste,
      cornType,
      originGeography,
      region,
    );
  }

  @override
  String toString() {
    return '''Coffe{_id: $_id, isActive: $isActive, price: $price,
     picture: $picture, name: $name, taste: $taste, cornType: $cornType,
     originGeography: $originGeography, region: $region}''';
  }

  static Coffe fromJson(Map<String, Object> json) {
    return Coffe(
      json["_id"] as String,
      json["isActive"] as bool,
      json["price"] as String,
      json["picture"] as String,
      json["name"] as String,
      json["taste"] as String,
      json["cornType"] as String,
      json["originGeography"] as String,
      json["region"] as String,
    );
  }
}