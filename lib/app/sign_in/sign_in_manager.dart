import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:onlinecrimereportingsystem/services/auth.dart';

class SignInManager {
  SignInManager({@required this.auth, @required this.isLoading});
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<User> signInAnoymously() async => await _signIn(auth.signInAnoymously);

  Future<User> signInwithGoogle() async => await _signIn(auth.signInwithGoogle);

  Future<User> singInWithFacebook() async =>
      await _signIn(auth.singInWithFacebook);
}
