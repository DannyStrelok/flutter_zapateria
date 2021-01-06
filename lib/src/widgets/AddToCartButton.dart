import 'package:flutter/material.dart';
import 'package:flutter_zapateria/src/widgets/BotonNaranja.dart';

class AddToCartButton extends StatelessWidget {

  final double precio;


  AddToCartButton({@required this.precio});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$precio', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              BotonNaranja(texto: 'Añadir'),
            ],
          ),
        ),
      ),
    );
  }
}
