import 'package:autoservice_app/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:autoservice_app/themes/autoservice_theme.dart';

import 'package:autoservice_app/views/screens/screens.dart';

import 'di/Locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDI();
  runApp(const AutoserviceApp());
}

class AutoserviceApp extends StatelessWidget {
  const AutoserviceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // aplication theme
    final autoserviceTheme = AutoserviceTheme.light();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
      ],
      child: MaterialApp(
        title: 'autoservice app',
        theme: autoserviceTheme,
        initialRoute: "purchase_screen",
        routes: {
          "init_screen": (context) => const InitScreen(),
          "purchase_screen": (context) => const PurchaseScreen(),
        },
      ),
    );
  }
}
