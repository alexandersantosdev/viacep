import 'package:flutter/material.dart';

class CepPage extends StatelessWidget {
  const CepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  const Center(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text("Projeto ViaCep"),
          ],
        ),
      ),
    );
  }
}
