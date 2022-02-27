import 'package:flutter/material.dart';

import 'Contifigirations/page_route_name.dart';
import 'Contifigirations/route.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlapKap',
        theme: ThemeData(
          primaryColor: const Color(0xff167A5D),
          hintColor: const Color(0xff484947),
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Color(0xff484947),
              fontSize: 30,
              fontWeight: FontWeight.w900,
              fontFamily: 'Sans Serif',
            ),
            button: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Sans Serif',
            ),
            bodyText1: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            bodyText2: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
                color: Color(0xff484947)),
            subtitle1: TextStyle(
              fontSize: 14,
              letterSpacing: 0,
              color: Color(0xff839374),
            ),
            caption: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Sans Serif',
            ),
            headline2: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff4D8B58),
            ),
            //appbar
            headline3: TextStyle(
              fontSize: 20,
              color: Color(0xff484947),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        initialRoute: PageRouteName.initial,
        onGenerateRoute: Routes.generateRoute,
        builder: EasyLoading.init(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
        ));
  }
}
