import 'package:appmovieuplabs/src/Widget/FondoWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Fondo(),
          Positioned(
            top: 30,
            left: 110,
            child: _logo(),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 300,
                  ),
                  _usuario(),
                  _password(),
                  SizedBox(
                    height: 50,
                  ),
                  _botonLogin(context),
                  SizedBox(
                    height: 20,
                  ),
                  _botonSignup(),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Login With',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _botonFacebook(), 
                      SizedBox(width: 20,),
                      _botonGoogle()
                      ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _botonFacebook() {
    return Container(
       width: 110,
       height: 30,
      child: RaisedButton(
        onPressed: (){},
        child: Icon(FontAwesomeIcons.facebookF, color: Color.fromRGBO(88, 46, 75, 1),),
      ),
    );
  }

  Widget _botonGoogle() {
    return Container(
      width: 110,
             height: 30,
      child: RaisedButton(
        onPressed: (){},
        child: Icon(FontAwesomeIcons.googlePlusG, color: Color.fromRGBO(88, 46, 75, 1),),
      ),
    );  }

  Widget _botonLogin(BuildContext context) {
    return Container(
      width: 250,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'noticias');
        },
        child: Text('LOG IN'),
      ),
    );
  }

  Widget _botonSignup() {
    return Container(
      width: 250,
      child: RaisedButton(
        onPressed: () {},
        child: Text('SIGN UP'),
      ),
    );
  }

  Widget _usuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(241, 210, 140, 1.0))),
            hintText: 'Username',
            prefixIcon: Icon(
              Icons.person,
              color: Color.fromRGBO(242, 210, 140, 1.0),
            ),
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(241, 210, 140, 1.0))),
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.lock_open,
              color: Color.fromRGBO(242, 210, 140, 1.0),
            ),
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: 200,
      height: 300,
      child: Image(
        image: AssetImage('assets/img/logo.png'),
        fit: BoxFit.contain,
      ),
    );
  }


}
