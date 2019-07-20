import 'package:appmovieuplabs/src/Widget/FondoWidget.dart';
import 'package:appmovieuplabs/src/Widget/TarjetaWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsPage extends StatelessWidget {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final pagina1 = Scaffold(
      body: Stack(
        children: <Widget>[
          Fondo(),
          SafeArea(
            child: Column(
              children: <Widget>[
                _appbar(),
                _segundoMenu(),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: <Widget>[
                    _contenedorBlanco(),
                    Container(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Text(
                          'New Releases',
                          style: TextStyle(
                              color: Color.fromRGBO(86, 86, 86, 1.0),
                              fontSize: 15),
                                    )
                              ),
                    
                    TarjetaWidget()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

    return PageView(
      controller: controller,
      children: <Widget>[pagina1, pagina1],
    );
  }

  Widget _contenedorBlanco() {
    return Container(
      width: double.infinity,
      height: 613,
      color: Colors.white,
    );
  }

  Widget _segundoMenu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(FontAwesomeIcons.home, color: Colors.yellow),
          Icon(Icons.star, color: Colors.white),
          Icon(Icons.folder_special, color: Colors.white),
          Icon(Icons.find_in_page, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white)
        ],
      ),
    );
  }

  Widget _appbar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.tape,
            color: Colors.white,
          ),
          Text(
            'Movies',
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
          ),
          SizedBox(
            width: 150,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white),
          )
        ],
      ),
    );
  }
}
