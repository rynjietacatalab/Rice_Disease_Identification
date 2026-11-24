
import 'package:flutter/material.dart';

// Import your separate screens
import 'screens/home_screen.dart';
import 'screens/scan_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RiceStressApp());
}

class RiceStressApp extends StatelessWidget {
  const RiceStressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rynjie Tacata',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F9F4),
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
        '/scan': (context) => const ScanScreen(),
      },
    );
  }
}
