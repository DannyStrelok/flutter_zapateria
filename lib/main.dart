import 'package:flutter/material.dart';
import 'package:flutter_zapateria/src/models/zapato_model.dart';
import 'package:flutter_zapateria/src/screens/zapato_screen.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ZapatoModel())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zapatería',
      home: ZapatoScreen(),
    );
  }
}
