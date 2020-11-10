
import 'package:dzemaat/provider/my_provider.dart';
import 'package:dzemaat/screens/forgot_screen.dart';
import 'package:dzemaat/screens/home_screen.dart';
import 'package:dzemaat/screens/login_screen.dart';
import 'package:dzemaat/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: MaterialApp(
        routes: {
          "/login": (ctx) => LoginScreen(),
          "/home": (ctx) => HomeScreen(),
          "/forgot": (ctx) => ForgotScreen(),
          "/register": (ctx) => RegisterScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff19ba19),
          snackBarTheme: SnackBarThemeData(
            actionTextColor: Colors.white,
            backgroundColor: Color(0xff19ba19),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return LoginScreen();
          },
        ),
 
      ),
    );
  }
}
