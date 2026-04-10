import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/bindings/general_bindings.dart';

import 'package:myapp/auth_gate.dart';
import 'package:myapp/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: MAppTheme.lightTheme,
      // darkTheme: MAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}
