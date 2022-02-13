// ignore_for_file: must_be_immutable

import 'package:contact/presentation/app/contact_list_screen.dart';
import 'package:contact/presentation/app/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  List<Widget> tabs = [
    const HomePage(),
    const ContactList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: tabs),
    );
  }
}
