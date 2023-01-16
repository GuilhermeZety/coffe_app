import 'package:coffe_app/core/constants/app_theme.dart';
import 'package:coffe_app/features/home/presenter/ui/home_presenter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const HomePresenter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
