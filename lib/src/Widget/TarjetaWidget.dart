import 'package:appmovieuplabs/src/Models/PeliculaModel.dart';
import 'package:appmovieuplabs/src/Providers/PeliculasProvider.dart';
import 'package:flutter/material.dart';

class TarjetaWidget extends StatelessWidget {
  PeliculasProvider p = new PeliculasProvider();
  List<Peliculas> lp = new List();
  bool mostrar = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 616,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: p.getEncines(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
               if(snapshot.hasData){
                 return Column(
                   children: ciclado(context,snapshot.data)
                 );
               }else{
                 return CircularProgressIndicator();
               }
              },
            ),
            
          ],
        ),
      ),
    );
  }

  List<Widget> ciclado(BuildContext context,data){
    final List<Widget> peliculas = List();
    data.forEach( (pelicula){
      final widGetTemp = _tarjeta(context,pelicula);
      peliculas.add(widGetTemp);
    });
    return peliculas;
  }

  Widget _tarjeta(BuildContext context,Pelicula p) {

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'video', arguments: p);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            _imagen(p.getBackGroundImg()),
            SizedBox(
              height: 20,
            ),
            _titulo(p.title),
            _texto(p.overview),
            SizedBox(height: 10,),
            _subtexto(p.originalTitle,p.releaseDate),
            SizedBox(
              height: 30,
            ),
            Divider(color: Color.fromRGBO(233, 233, 233, 1.0),)
          ],
        ),
      ),
    );
  }

  
  Widget _imagen(String ruta) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage(
          height: 180,
          width: 400,
          image: NetworkImage(ruta),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _titulo(String titulo) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Color.fromRGBO(108, 54, 80, 1.0),
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Icon(Icons.add_box,color: Colors.white,),
          ),
          SizedBox(width: 10,),
          Text(titulo),
        ],
      ),
    );
  }

  Widget _texto(String resumen){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text(resumen,  maxLines: mostrar ? 8 : 2,textAlign: TextAlign.justify),
    );
  }

    Widget _subtexto(String subtexto,String fecha){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text('${subtexto}, fue lanzada la fecha del ${fecha}',textAlign: TextAlign.start, style: TextStyle(color: Color.fromRGBO(143, 143, 143, 1.0)),),
    );
  }
}
