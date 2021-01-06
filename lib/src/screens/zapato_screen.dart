import 'package:flutter/material.dart';
import 'package:flutter_zapateria/src/helpers/helpres.dart';
import 'package:flutter_zapateria/src/widgets/AddToCartButton.dart';
import 'package:flutter_zapateria/src/widgets/custom_appbar.dart';
import 'package:flutter_zapateria/src/widgets/zapato_descripcion.dart';
import 'package:flutter_zapateria/src/widgets/zapato_widget.dart';

class ZapatoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      // body: ZapatoSizePreview()
      body: Column(
        children: [
          CustomAppBar(text: 'Recomendado'),
          SizedBox(height: 20,),
          Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Hero(
                      tag: 'zapato_1',
                        child: ZapatoSizePreview()
                    ),
                    ZapatoDescripcion(
                      titulo: 'Nike Air Max 720',
                      descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                  ],
                ),
              )
          ),
          AddToCartButton(precio: 180.0)
        ],
      ),
    );
  }
}
