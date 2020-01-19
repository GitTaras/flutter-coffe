import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coffe/keys.dart';
import 'package:coffe/models/models.dart';
import 'package:flutter/services.dart';

typedef OnLoginCallback = Function(User user);

class LoginScreen extends StatefulWidget {
  
  final OnLoginCallback onLogin;

  LoginScreen({
    Key key,
    @required this.onLogin,
  }) : super(key: key ?? CoffeAppKeys.loginScreen);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _loginText = '''Enter email adress or mobile phone number with password, witch you chosed for Coffe and press Login''';
  String _password;
  String _phoneOrEmail;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login to Coffe'
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text('$_loginText', textAlign: TextAlign.start, softWrap: true, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 14)),
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
                  key: CoffeAppKeys.phoneOrEmailField,
                  autofocus: false,
                  maxLines: 1,
                  style: textTheme.subhead,
                  decoration: InputDecoration(
                    hintText: 'Phone number or Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    return val.trim().isEmpty
                        ? 'empty phone number or Email'
                        : null;
                  },
                  onSaved: (value) => _phoneOrEmail = value,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                TextFormField(
                  obscureText: true,
                  initialValue: '',
                  key: CoffeAppKeys.passwordField,
                  maxLines: 1,
                  style: textTheme.subhead,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password 5 or more symbols',
                  ),
                  validator: (val) {
                    return val.length <= 5 ? 'less then 5 symbols' : null;
                  },
                  onSaved: (value) => _password = value,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                RaisedButton(
                  key: CoffeAppKeys.loginSreenButton,
                  child: Text('Login'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      //TODO FIX USER PARAMETERS - PHONE OR EMAIL 
                      widget.onLogin(new User(_phoneOrEmail, '', _password));
                      Navigator.pop(context);
                    }
                  },
                ),
                RaisedButton(
                  key: CoffeAppKeys.loginSreenLoginWithFbButton,
                  child: Text('Login with Facebook'),
                  onPressed: () {
                    print('login with Facebook:\n');
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
          ),
          Text("Can't login? Reset password"),
          RaisedButton(
                  child: Text('Register'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
        ],
      ),
    );
  }
}