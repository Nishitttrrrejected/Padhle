import 'package:padhle/screens/books/books.dart';
import 'package:padhle/screens/home_screen/home_screen.dart';
import 'package:padhle/screens/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:padhle/screens/splash_screen/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routename: (context) => SplashScreen(),
  LoginScreen.routename: (context) => LoginScreen(),
  HomeScreen.routename:(context)=>HomeScreen(),
  BooksScreen.routename: (context)=>BooksScreen(),
};