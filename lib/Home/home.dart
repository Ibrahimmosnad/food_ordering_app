import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Sections/Header_section.dart';
import 'Sections/body_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Header(),
            BodySection()
          ],
        ),
    );
  }
}
