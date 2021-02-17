import 'package:flutter/material.dart';
import 'package:laundry/utils/theme.dart';
import 'utils/colors.dart';
import 'package:provider/provider.dart';
import 'utils/themeNotifier.dart';
import 'utils/theme.dart';
import 'utils/string.dart';
import 'Screens/loginInPage.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(lightTheme), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: themeNotifier.getTheme(),
      home: LoginPage(title: appName),
    );
  }
}
