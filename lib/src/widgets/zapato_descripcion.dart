import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {

  final String titulo;
  final String descripcion;


  ZapatoDescripcion({@required this.titulo, @required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.titulo, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
          SizedBox(height: 20,),
          Text(this.descripcion, style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54, height: 1.6),),
        ],
      ),
    );
  }
}
