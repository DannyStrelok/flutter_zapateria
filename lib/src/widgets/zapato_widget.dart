import 'package:flutter/material.dart';
import 'package:flutter_zapateria/src/models/zapato_model.dart';
import 'package:flutter_zapateria/src/screens/zapato_desc_screen.dart';
import 'package:provider/provider.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  ZapatoSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!this.fullScreen) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (this.fullScreen) ? 5 : 25,
            vertical: (this.fullScreen) ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
              color: Color(0xffffcf53),
              borderRadius: (this.fullScreen)
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))
                  : BorderRadius.circular(50)),
          child: Column(
            children: [
              // zapato con sombra
              _ZapatoConSombra(),
              //tallas
              if (!this.fullScreen) _Tallas()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          Positioned(bottom: 20, right: 0, child: _Sombra()),
          Image(image: AssetImage(zapatoModel.assetImage))
        ],
      ),
    );
  }
}

class _Sombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [BoxShadow(color: Color(0xffeaa14e), blurRadius: 40)]),
      ),
    );
  }
}

class _Tallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Talla(7),
          _Talla(7.5),
          _Talla(8),
          _Talla(8.5),
          _Talla(9),
          _Talla(9.5)
        ],
      ),
    );
  }
}

class _Talla extends StatelessWidget {
  final double numero;

  _Talla(this.numero);

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: (this.numero == zapatoModel.talla) ? Color(0xfff1a23a) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color(0xfff1a23a), blurRadius: 10, offset: Offset(0, 5))
            ]),
        alignment: Alignment.center,
        child: Text(
          '${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
              color: (this.numero == zapatoModel.talla) ? Colors.white : Color(0xfff1a23a),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
