import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final Color color;

  BotonNaranja({@required this.texto, this.alto = 15, this.ancho = 50, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: this.color,
            textStyle: TextStyle(color: Colors.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.symmetric(horizontal: this.ancho, vertical: this.alto)),
        child: Text(
          '$texto',
        ));
  }
}
