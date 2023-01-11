import 'package:flutter/material.dart';
import 'views/login.dart';
import 'blocs/provider.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  build(BuildContext context) {
    return Provider(
        child: const MaterialApp(
          title: 'Login',
          home: Scaffold(
            body: LoginScreen(),
          ),
        ),
    );
  }
}