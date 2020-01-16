class GoodsParams {
  final int quantity;
  final double packing;
  final String coffeType;
  final String color;
  final String roast;
  final String brewingMethod;

  GoodsParams(
    this.quantity, {
    this.packing,
    this.coffeType,
    this.color,
    this.roast,
    this.brewingMethod,
  });

  GoodsParams copyWith({
    int quantity,
    double packing,
    String coffeType,
    String color,
    String roast,
    String brewingMethod,
  }) => 
  GoodsParams(
    quantity ?? this.quantity,
    packing: packing ?? this.packing,
    coffeType: coffeType ?? this.coffeType,
    color: color ?? this.color,
    roast: roast ?? this.roast,
    brewingMethod: brewingMethod ?? this.brewingMethod,
  );

  List<Object> get props => [
    quantity, packing, coffeType, color,
    roast, brewingMethod
  ];

  factory GoodsParams.fromJson(Map<String, dynamic> json) => GoodsParams(
      json["quantity"] as int,
      packing: json["packing"].toDouble(),
      coffeType: json["coffeType"],
      color: json["color"],
      roast: json["roast"],
      brewingMethod: json["brewingMethod"],
  );

  Map<String, dynamic> toJson() => {
      "quantity": quantity,
      "packing": packing,
      "coffeType": coffeType,
      "color": color,
      "roast": roast,
      "brewingMethod": brewingMethod,
  };
}