import 'package:flutter/material.dart';
import 'views/login.dart';
import 'views/home.dart';
import 'blocs/provider.dart';


class App extends StatelessWidget {
  const App({super.key});
  final loggedIn = false;

  @override
  build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login',
        initialRoute: loggedIn == false ? '/login' : '/home',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {

    print('current page identifier-> ${settings.name}');

    switch(settings.name) {
      case '/home': {
        return MaterialPageRoute(
            builder: (context) {
              // add initialization for page
              return const Home();
            }
        );
      }

      case '/login': {
        return MaterialPageRoute(
            builder: (context) {
              // add initialization for page
              return const LoginScreen();
            }
        );
      }

      default: {
        return MaterialPageRoute(
            builder: (context) {
              // add initialization for page
              return const Home();
            }
        );
      }

    }
  }

}