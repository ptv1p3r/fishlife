import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators{
  // final _emailController = StreamController<String>.broadcast();
  final _emailController = BehaviorSubject<String>();
  // final _passwordController = StreamController<String>.broadcast();
  final _passwordController = BehaviorSubject<String>();

  // add data to stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get loginValid => Rx.combineLatest2(email, password, (e, p) => true);

  // update data
  Function(String) get updateEmail => _emailController.sink.add;
  Function(String) get updatePassword => _passwordController.sink.add;

  login() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('email ${validEmail}');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }

}