import 'package:flutter/material.dart';
import 'package:robot_tambak/page/home1_page.dart';
import 'package:robot_tambak/page/home2_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: PageView(
            children: const [
              Center(
                child: Home1Page(),
              ),
              Center(
                child: Home2Page(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
