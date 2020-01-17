import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  final double widthFactor;
  final double heigthFactor;
  final String error;
  const NetworkError({
    Key key, @required this.widthFactor,
    @required this.heigthFactor, @required this.error
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        heightFactor: heigthFactor,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.amber,
              minRadius: 25,
              child: Icon(Icons.error),
            ),
            Text('Error: $error', softWrap: true, textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Colors.red)),
          ],
          mainAxisSize: MainAxisSize.max,
        )
    ));
  }
}