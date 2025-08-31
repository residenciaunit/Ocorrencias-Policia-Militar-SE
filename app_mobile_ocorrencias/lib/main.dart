import 'package:flutter/material.dart';
import 'pages/cadastro_page.dart'; // ajusta se sua pasta for diferente

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Ocorrências PMSE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const CadastroPage(),
    );
  }
}
