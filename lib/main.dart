import 'package:flutter/material.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/view/auth/login.dart';
import 'package:lika/view/auth/user.dart';
import 'package:lika/view/product/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        // Use a ChangeNotifierProvider instead of using a provider to serve a change notifier
        ChangeNotifierProvider(
          create: (_) => CProduct(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider.initialize(),
        )
      ],
      child: MaterialApp(
        title: 'TurnUp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.grey,
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
        home: ScreensController(),
      ),
    ),
  );
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context);
    switch (user.status) {
      // case Status.Uninitialized:
      //   return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}
