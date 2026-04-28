import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const LojaVestuarioApp());
}

class LojaVestuarioApp extends StatelessWidget {
  const LojaVestuarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja de Vestuario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define a Tela 1 como a página inicial
      home: const LoginPage(),
    );
  }
}