import 'package:flutter/material.dart';
import 'models/app_colors.dart';
import 'pages/login.dart';

void main() {
  runApp(const PawsNTailsApp());
}

class PawsNTailsApp extends StatelessWidget {
  const PawsNTailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paws n Tails',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
      ),
      home: const LoginPage(), // ← START DARI LOGIN
    );
  }
}
