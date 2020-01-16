import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/models/models.dart';
import 'package:flutter/services.dart';

typedef OnRegisterCallback = Function(User user);

class RegisterScreen extends StatefulWidget {
  
  final OnRegisterCallback onRegister;

  RegisterScreen({
    Key key,
    @required this.onRegister,
  }) : super(key: key ?? CoffeAppKeys.registerScreen);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _registerText = '''Enter all fields and press Save. All fields are required''';
  String _termOfUseText = '''By using our Services, you are agreeing to these terms.''';
  String _email;
  String _phone;
  String _password;
  String _passwordRepeat;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create a new account'
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text('$_registerText', textAlign: TextAlign.start, softWrap: true, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 14)),
          Container(
                  margin: EdgeInsets.only(top: 10),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  initialValue: '',
                  key: CoffeAppKeys.emailField,
                  autofocus: false,
                  maxLines: 1,
                  style: textTheme.subhead,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                  validator: (val) {
                    return val.trim().isEmpty
                        ? 'empty email'
                        : null;
                  },
                  onSaved: (value) => _email = value,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                TextFormField(
                  initialValue: '+380',
                  key: CoffeAppKeys.phoneField,
                  maxLines: 1,
                  style: textTheme.subhead,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Phone number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    return val.length == 12 ? 'wrong number': null;
                  },
                  onSaved: (value) => _phone = value,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                TextFormField(
                  initialValue: '',
                  obscureText: true,
                  key: CoffeAppKeys.registerPasswordField,
                  maxLines: 1,
                  style: textTheme.subhead,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password 5 or more symbols',
                  ),
                  validator: (val) {
                    return val.length >= 5 ? 'Password must be 5 or more symbols': null;
                  },
                  onSaved: (value) => _password = value,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                TextFormField(
                  initialValue: '',
                  obscureText: true,
                  key: CoffeAppKeys.repeatPasswordField,
                  maxLines: 1,
                  style: textTheme.subhead,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Repeat Password',
                  ),
                  validator: (val) {
                    return val == _password ? 'Passwords must be equals': null;
                  },
                  onSaved: (value) => _passwordRepeat = value,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                Text(_termOfUseText),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                RaisedButton(
                  key: CoffeAppKeys.registerSreenButton,
                  child: Text('Register'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      widget.onRegister(new User(_email, _phone, _password));
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}