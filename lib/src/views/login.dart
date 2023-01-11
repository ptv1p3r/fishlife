import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(context) {
    final bloc = Provider.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(margin: const EdgeInsets.only(top:25.0)),
              email(bloc),
              password(bloc),
              Container(margin: const EdgeInsets.only(top:25.0)),
              loginButton(bloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget email(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: bloc.updateEmail,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'EMail Address',
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
          );
        },
    );
  }

  Widget password(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.updatePassword,
            // obscureText: true,
            decoration: InputDecoration(
              hintText: 'password',
              labelText: 'Password',
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
          );
        }
    );
  }

  Widget loginButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.loginValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              minimumSize: const Size(200, 40),
            ),
            onPressed: snapshot.hasData ? bloc.login : null,
            child: const Text('Login'),
          );
        },
    );
  }

}