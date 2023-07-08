import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:robot_tambak/page/intro_page.dart';
import 'package:robot_tambak/page/pilihan_page.dart';
import 'package:robot_tambak/page/signin_page.dart';

import 'config/app_color.dart';
import 'firebase_options.dart';
import 'helper/notification_helper.dart';
import 'page/home_page.dart';
import 'page/register_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting('id_ID');
  await NotificationHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            primaryColor: AppColor.primary,
            colorScheme: const ColorScheme.light(
                primary: AppColor.primary, secondary: AppColor.secondary)),
        routes: {
          // '/': (context) {
          //   return FutureBuilder(
          //       future: Session.getUser(),
          //       builder: (context, AsyncSnapshot<User> snapshot) {
          //         if (snapshot.data == null || snapshot.data!.id == null) {
          //           return const IntroPage();
          //         } else {
          //           return SigninPage();
          //         }
          //       });
          //   // return IntroPage();
          // },
          '/register': (context) => RegisterPage(),
          '/home': (context) => const HomePage(),
          '/pilihan': (context) => const PilihanPage(),
          '/signin': (context) => SigninPage(),
        });
  }
}
