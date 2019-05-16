import 'dart:async';

import 'package:meta/meta.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/login_bloc/login_events.dart';
import 'package:petfeed/src/data/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';

class LoginBloc extends Bloc {
  final UserRepository repository;
  final SharedPreferences preferences;

  LoginBloc(this.repository, this.preferences) {
    init();
  }

  StreamController<LoginEvents> _loginEventsStreamController =
      StreamController<LoginEvents>.broadcast();
  Stream<LoginEvents> get loginEventStream =>
      _loginEventsStreamController.stream;
  Sink<LoginEvents> get _loginEventSink => _loginEventsStreamController.sink;

  void init() {
    _loginEventsStreamController.stream.listen(_mapEventsToState);
  }

  void _mapEventsToState(LoginEvents event) {
    if (event is InitializedLogin) {
      _mapInitializedLogin(event);
    } else if (event is ResendVerification) {
      _mapSendVerificationEmail(event);
    }
  }

  void sendVerificationEmail(
      {@required String email, @required String password}) {
    dispatch(
      ResendVerification((b) => b
        ..email = email
        ..password = password),
    );
  }

  void _mapSendVerificationEmail(ResendVerification event) async {
    try {
      await repository.reSendVerificationEmail(
          email: event.email, password: event.password);
      dispatch(VerificationSent());
    } on NoInternetException catch (e) {
      dispatch(LoginError((b) => b..message = e.message));
    } on LoginError catch (e) {
      dispatch(LoginError((b) => b..message = e.message));
    } catch (_) {
      dispatch(LoginError((b) => b..message = _.toString()));
    }
  }

  void login({@required String email, @required String password}) {
    dispatch(
      InitializedLogin((b) => b
        ..email = email
        ..password = password),
    );
  }

  void _mapInitializedLogin(InitializedLogin event) async {
    try {
      final response = await repository.loginUser(
          email: event.email, password: event.password);
      preferences.setString('email', response.email);
      preferences.setString('name', response.name);
      preferences.setString('token', response.token);
      dispatch(LoginSuccessful());
    } on NoInternetException catch (e) {
      dispatch(LoginError((b) => b..message = e.message));
    } on UnauthenticatedException catch (e) {
      dispatch(LoginError((b) => b..message = e.message));
    } on EmailVerificationException catch (e) {
      dispatch(VerificationError((b) => b..message = e.message));
    } catch (_) {
      dispatch(LoginError((b) => b..message = _.toString()));
    }
  }

  void dispatch(LoginEvents event) {
    _loginEventSink.add(event);
  }

  @override
  void dispose() {
    _loginEventsStreamController.close();
  }
}
