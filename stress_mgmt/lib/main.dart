import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stress_mgmt/loading_screen.dart';
import 'package:stress_mgmt/user_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Get.put(() => UserController().init());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF093637),
          textTheme: GoogleFonts.montserratTextTheme(
            TextTheme(
              headline6: GoogleFonts.montserrat(color: Colors.white),
              headline5: GoogleFonts.montserrat(color: Colors.white),
              headline4: GoogleFonts.montserrat(color: Colors.white),
              headline3: GoogleFonts.montserrat(color: Colors.white),
              headline2: GoogleFonts.montserrat(color: Colors.white),
              headline1: GoogleFonts.montserrat(color: Colors.white),
              subtitle1: GoogleFonts.montserrat(color: Colors.white),
              subtitle2: GoogleFonts.montserrat(color: Colors.white),
              caption: GoogleFonts.montserrat(color: Colors.white),
              bodyText1: GoogleFonts.montserrat(color: Colors.white),
              bodyText2: GoogleFonts.montserrat(color: Colors.white),
              button: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
          buttonColor: Color(0xFF0575E6),
          accentColor: Color(0xFF00F260),
          appBarTheme: AppBarTheme(
            color: Color(0xFF44A08D),
            textTheme: TextTheme(
              headline5: GoogleFonts.poppins(),
              headline6: GoogleFonts.poppins(),
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
        home: LoadingScreen());
  }
}
