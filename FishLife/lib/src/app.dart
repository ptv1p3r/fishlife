import 'package:flutter/material.dart';
import 'views/login.dart';
import 'views/home.dart';
import 'blocs/provider.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          // add initialization for page
          return const Home();
        }
    );
  }

}