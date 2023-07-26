import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:robot_tambak/config/app_asset.dart';
import 'package:robot_tambak/config/app_color.dart';

class PilihanPage extends StatelessWidget {
  const PilihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Column(
        children: [
          Image.asset(AppAsset.login1),
          const Padding(
            padding: EdgeInsets.only(top: 70),
            child: Text(
              'Facilitate The Work of Cultivating Fish\n and Shrimp in Ponds',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(300, 50)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColor.primary)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 24),
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(300, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.secondary)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 24),
                    )),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
