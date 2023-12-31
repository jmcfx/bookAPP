import 'package:bookapp/base/base_view.dart';
import 'package:bookapp/bookpage/book_url.dart';
import 'package:bookapp/homepage.dart/homepage_screen.dart';
import 'package:bookapp/pageView/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'constants/page_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const OnboardingPage(),
      routes: {
        homepageRoutes: (context) => const BaseView(),
        bookPageRoutes :(context) => const BookPage(),
      },
    );
  }
}
