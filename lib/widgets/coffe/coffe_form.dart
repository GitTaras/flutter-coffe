import 'package:coffe/models/cart_item.dart';
import 'package:coffe/models/coffe.dart';
import 'package:coffe/models/good.dart';
import 'package:coffe/models/goods_params.dart';
import 'package:coffe/widgets/dialogs/not_available_alert.dart';
import 'package:flutter/material.dart';
import 'package:coffe/widgets/cart_with_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe/blocs/blocs.dart';

class Index {
  int index;
  Index(int index) {
    this.index = index;
  }
}

class CoffeForm extends StatefulWidget {

  final Coffe coffe;
  const CoffeForm({Key key, @required this.coffe}) : super(key: key);

  @override
  _CoffeFormState createState() => _CoffeFormState();
}

class _CoffeFormState extends State<CoffeForm> {

  final TextEditingController _quantityController = TextEditingController.fromValue(TextEditingValue(text: "1"));
  Index colorIndex = Index(0);
  Index coffeTypeIndex = Index(0);
  Index roastIndex = Index(0);
  Index weightIndex = Index(0);
  
  List<bool> isSelectedColor = <bool>[true, false];
  List<bool> isSelectedCoffeType = <bool>[true, false];
  List<bool> isSelectedRoast = <bool>[true, false];
  List<bool> isSelectedWeight = <bool>[true, false, false];
  Map <int, String> _mapSelectedColor = <int, String>{0: 'White', 1:'Black'};
  Map <int, double> _mapSelectedWeight = <int, double>{0: 1, 1: 0.5, 2: 0.25};
  Map <int, String> _mapSelectedCoffeType = <int, String>{0: 'grain', 1:'ground'};
  Map <int, String> _mapSelectedRoast = <int, String>{0: 'Medium', 1:'For filter'};
 
  String _brewingMethod = "v60";
  int step = 1;

  void incCount() {
    int value = int.tryParse(_quantityController.text);
    if (value != null && value >= 0) {
      if (value == 50) {
        _quantityController.text = value.toString();
        return;
      }  
      _quantityController.text = (++value).toString(); 
    }
  }

  void decCount() {
    int value = int.tryParse(_quantityController.text);
    if (value != null && value > 0) {
      if (value == 1) {
        _quantityController.text = value.toString();
        return;
      } 
      _quantityController.text = (--value).toString(); 
    }
  }

  void _addToCart(BuildContext context) {
    String color = _mapSelectedColor[colorIndex.index];
    double weight = _mapSelectedWeight[weightIndex.index];
    String coffeType = _mapSelectedCoffeType[coffeTypeIndex.index];
    String roast = _mapSelectedRoast[roastIndex.index];
    int quantity = int.tryParse(_quantityController.text);
    GoodsParams params = GoodsParams(
      quantity, packing: weight,
      coffeType: coffeType, color: color,
      roast: roast, brewingMethod: _brewingMethod
    );

    //TODO make one model
    //don't do this sheet newer again)) Good.fromJson(widget.coffe.toJson())  
    CartItem cartItem = CartItem(Good.fromJson(widget.coffe.toJson()), params);
    print("added $cartItem.toString()");
    
    BlocProvider.of<GoodsBloc>(context).add(AddGood(cartItem));
  }

  @override
  void dispose() { 
    print("dispose form");
    _quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() { 
    _quantityController.addListener(() {
      final text = _quantityController.text.toLowerCase();
      int value = int.tryParse(text) ?? 0; 
      print("parse $value");
      if (value == 0) {
        _quantityController.value = _quantityController.value.copyWith(
          text: "1"
        );
        setState(() {});
        return;
      } else if(value > 0) {
        setState(() {});
        return;
      } else if(value < 0) {
        _quantityController.value = _quantityController.value.copyWith(
          text: "1"
        );
        return;
      }
    });
    print("init form");
    super.initState();
  }

  void _nextStep() {
    setState(() {
      step = 2;
    });
  }

  //Dart don't support passing primitive type by reference,
  //so i wrap primitive value in object i think it's not best practice but ...
  void _setSelected(List<bool> isSelected, int index, Index selectedIndex) {
    setState(() {
      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
        if (buttonIndex == index) {
          isSelected[buttonIndex] = true;
          selectedIndex.index = index;
        } else {
          isSelected[buttonIndex] = false;
        }
      }
    });
  }

  void _setBrewingMethod(String method) {
    setState(() {
      _brewingMethod = method;
    });
  }

  double _getSum() {
    int quantity = int.tryParse(_quantityController.text);
    double weight = _mapSelectedWeight[weightIndex.index];
    double price = double.tryParse(widget.coffe.price.replaceAll("\$", ""));
    print("${price}");

    return price * quantity * weight + _getRoastCoast(weight * quantity);
  }

  double _getRoastCoast(double weight) {
    print("roast coast weight $weight");
    if (weight < 1) {
      print("weight <1  * 60");
      return weight * 60;
    } else if(weight >= 1 && weight < 10) {
      print("weight <10 * 40");
      return weight * 40;
    } else if(weight > 10) {
      print("weight > 10 * 30");
      return weight * 30;
    }
  }

  List<Widget> _withListTile({
    List<Widget> children, int step,
    String title, Widget trailing
  }) {
    return <Widget>[
      ListTile(
        trailing: trailing ?? null,
        title: Text(title),
        leading: Stack(
          children: <Widget>[
            Icon(Icons.lens),
            Positioned(
              top: 5,
              left: 8,
              child: Text("$step", textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
      ...children,
    ];
  }

  Future<void> _notAvailable(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
        NotAvailableAlert(),
    );
  }
  

  Widget _buildRadioListTile(
    String itemTitle, String itemValue, String currentValue,
    ValueChanged<String> onChanged, {
    bool enabled: true
  }) {
    return RadioListTile(
      title: Text(itemTitle),
      value: itemValue,
      groupValue: currentValue,
      onChanged: enabled ? onChanged : null,
      secondary: !enabled ? IconButton(
        icon: Icon(Icons.info),
        onPressed: () {
          _notAvailable(context);
        }
      ) : null
    );
  }

  List<Widget> _secondPart() {
    return <Widget>[
      Column(
        children: [
          ..._withListTile(
            children: <Widget>[ToggleButtons(
              isSelected: isSelectedRoast,
              children: <Widget>[
                Text("Medium"),
                Text("For filter"),
              ],
              onPressed: (int index) {
                _setSelected(isSelectedRoast, index, roastIndex);
              }
            )],
            step: 6,
            title: "roasting",
          ),
          ..._withListTile(
            children: <Widget>[
              _buildRadioListTile(
                "v60", "v60", 
                _brewingMethod, _setBrewingMethod,
              ),
              _buildRadioListTile(
                "Aeropress", "Aeropress", 
                _brewingMethod, _setBrewingMethod,
              ),
              _buildRadioListTile(
                "Cup", "Cup", 
                _brewingMethod, _setBrewingMethod,
                enabled: false
              ),
              _buildRadioListTile(
                "Сezve", "Сezve", 
                _brewingMethod, _setBrewingMethod,
              ),
              _buildRadioListTile(
                "Chemex", "Chemex", 
                _brewingMethod, _setBrewingMethod,
                enabled: false
              ),
              _buildRadioListTile(
                "French press", "French press", 
                _brewingMethod, _setBrewingMethod,
              )
            ],
            step: 7,
            title: "Brewing method",
          ),
        ]
      )
    ];
  }

  List<Widget> _firstPart() {
    return <Widget>[
      Column(
        children: <Widget>[
          ..._withListTile(
            children: <Widget>[ToggleButtons(
              isSelected: isSelectedWeight,
              children: <Widget>[
                Text("1 kg"),
                Text("500 g"),
                Text("250 g"),
                ],
                onPressed: (int index) {
                  _setSelected(isSelectedWeight, index, weightIndex);
                },
            )],
            step: 1,
            title: "packing",
          ),
          ..._withListTile(
            children: <Widget>[
              IconButton(
                onPressed: () {incCount();},
                icon: Icon(Icons.add)),
              Container(
                margin: const EdgeInsets.only(left: 4, right:4),
                width: 50,
                //height: 100,
                child: TextField(
                  controller: _quantityController,
                  keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                  maxLength: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {decCount();},
                icon: Icon(Icons.remove)
              ),
            ],
            step: 2,
            title: "Quantity",
          ),
          ..._withListTile(
            children: <Widget>[ToggleButtons(
              isSelected: isSelectedColor,
              children: <Widget>[
                Text("White"),
                Text("Black"),
                ],
                onPressed: (int index) {
                  _setSelected(isSelectedColor, index, colorIndex);
                },
            )],
            step: 3,
            title: "Packing color",
          ),
          ..._withListTile(
            children: <Widget>[ToggleButtons(
              isSelected: isSelectedCoffeType,
              children: <Widget>[
                Text("grain"),
                Text("ground"),
                ],
                onPressed: (int index) {
                  _setSelected(isSelectedCoffeType, index, coffeTypeIndex);
                },
            )],
            step: 4,
            title: "Coffe type",
          ),
          ..._withListTile(
            children: <Widget>[
              Text("Coast from weight. less 1kg - 20\$, more 1kg - 18\$", softWrap: true),
            ],
            trailing: Text(_getRoastCoast(_mapSelectedWeight[weightIndex.index] * int.tryParse(_quantityController.text)).toString()),
            step: 5,
            title: "roasting",
          ),
        ]
      )
    ];
  }

  Widget _formBuilder() {
    return ListView(children: step == 1 ? _firstPart() : _secondPart());
  }

  Widget _myBackButton() {
    if(step == 1) {
      if(Navigator.of(context).canPop()) {
        return BackButton();
      }
    }
    return IconButton(
      icon: const BackButtonIcon(),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        setState(() {
          step = 1;
        });
      },
    );
  } 

  @override
  Widget build(BuildContext context) {
    print("Building form");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: _myBackButton(),
        centerTitle: true,
        title: Text(widget.coffe.name, overflow: TextOverflow.ellipsis, maxLines: 1),
        actions: <Widget>[
          CartWithBadge(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            Expanded(child: _formBuilder()),
            Container(
              //deleting height will breaks layout  
              height: size.height * 0.15,
              child: Column(
              mainAxisSize: MainAxisSize.min,  
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Summary price",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(" ${_getSum()} \$",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        step ==1 ? _nextStep() : _addToCart(context);
                      }, 
                      child: Text("${step == 1 ? "Continue" : "Add to cart"}"),
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
