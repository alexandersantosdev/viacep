import 'package:flutter/material.dart';
import 'package:viacep/shared/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'ViaCepAPP',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Column(),
    );
  }
}
