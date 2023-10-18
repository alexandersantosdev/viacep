import 'package:flutter/material.dart';
import 'package:viacep/pages/cep_page.dart';
import 'package:viacep/pages/home_page.dart';

class Constants {
  static List<Map<dynamic, dynamic>> menuItems = [
    {"title": "Home", "icon": Icons.home, "route": const HomePage()},
    {"title": "Ceps", "icon": Icons.location_on, "route": const CepPage()},
  ];
}
