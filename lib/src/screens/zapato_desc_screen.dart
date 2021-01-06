import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_zapateria/src/helpers/helpres.dart';
import 'package:flutter_zapateria/src/models/zapato_model.dart';
import 'package:flutter_zapateria/src/widgets/BotonNaranja.dart';
import 'package:flutter_zapateria/src/widgets/zapato_descripcion.dart';
import 'package:flutter_zapateria/src/widgets/zapato_widget.dart';
import 'package:provider/provider.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Hero(
              tag: 'zapato_1',
                child: ZapatoSizePreview(fullScreen: true)),
            Positioned(
              top: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left, size: 60,),
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                )
            )
          ]),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _ComprarAhora(),
                _ColorSelector(),
                _ShareButtons()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _ComprarAhora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('180.0€', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
          Bounce(child: BotonNaranja(texto: 'Comprar ahora', ancho: 30, alto: 5,), delay: Duration(seconds: 1), from: 15,)
        ],
      ),
    );
  }
}

class _ColorSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(child: _BotonColor(Color(0xff364d56), 4, 'assets/imgs/negro.png'),),
                Positioned(child: _BotonColor(Color(0xff2099f1), 3, 'assets/imgs/azul.png'), left: 30,),
                Positioned(child: _BotonColor(Color(0xffffad29), 2, 'assets/imgs/amarillo.png'), left: 60,),
                Positioned(child: _BotonColor(Color(0xffc6d642), 1, 'assets/imgs/verde.png'), left: 90,),
              ],
            ),
          ),
           //Spacer(),
          BotonNaranja(texto: 'Articulos relacionados', ancho: 20, alto: 5, color: Color(0xffffc675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final Color color;
  final int index;
  final String urlImagen;

  _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 300),
      duration: Duration(milliseconds: 500),
      child: InkWell(
        onTap: (){
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = this.urlImagen;
        },
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: this.color,
              shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _ShareButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25)),
          _BotonSombreado(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25)),
          _BotonSombreado(Icon(Icons.settings, color: Colors.grey.withOpacity(0.8), size: 25)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {

  final Icon icon;
  final Color color;
  final double size;

  _BotonSombreado(this.icon, {this.color = Colors.white, this.size = 25});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(100),
      child: Ink(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10)
            )
          ]
        ),
        child: this.icon,
      ),
    );
  }
}
