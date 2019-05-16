import 'dart:async';
import 'package:meta/meta.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/register_bloc/register_events.dart';
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';
import 'package:petfeed/src/data/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterBloc extends Bloc {
  final UserRepository repository;
  final SharedPreferences preferences;

  RegisterBloc(this.repository, this.preferences) {
    init();
  }

  StreamController<RegisterEvents> _registerEventStreamController =
      StreamController<RegisterEvents>.broadcast();
  Stream<RegisterEvents> get registerEventStream =>
      _registerEventStreamController.stream;
  Sink<RegisterEvents> get _registerEventSink =>
      _registerEventStreamController.sink;

  void init() {
    _registerEventStreamController.stream.listen(_mapEventsToState);
  }

  void _mapEventsToState(RegisterEvents event) {
    if (event is InitializingRegistration) {
      _mapInitializingRegistration(event);
    } else if (event is SendVerificationEmail) {
      _mapSendVerificationEmail(event);
    }
  }

  void reSendVerificationEmail(
      {@required String email, @required String password}) {
    dispatch(SendVerificationEmail((b) => b
      ..email = email
      ..password = password));
  }

  void _mapSendVerificationEmail(SendVerificationEmail event) async {
    try {
      await repository.reSendVerificationEmail(
          email: event.email, password: event.password);
      dispatch(RegistrationSuccessful());
    } on NoInternetException catch (e) {
      dispatch(RegistrationError((b) => b..message = e.message));
    } on UserRegistrationException catch (e) {
      dispatch(RegistrationError((b) => b..message = e.message));
    } catch (_) {
      dispatch(RegistrationError((b) => b..message = _.toString()));
    }
  }

  void register({
    @required String name,
    @required String email,
    @required String password,
  }) {
    dispatch(InitializingRegistration((b) => b
      ..name = name
      ..email = email
      ..password = password));
  }

  void _mapInitializingRegistration(InitializingRegistration event) async {
    try {
      await repository.registerUser(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      dispatch(RegistrationSuccessful());
    } on NoInternetException catch (e) {
      dispatch(RegistrationError((b) => b..message = e.message));
    } on UserRegistrationException catch (e) {
      dispatch(RegistrationError((b) => b..message = e.message));
    } catch (_) {
      dispatch(RegistrationError((b) => b..message = _.toString()));
    }
  }

  void dispatch(RegisterEvents event) {
    _registerEventSink.add(event);
  }

  @override
  void dispose() {
    _registerEventStreamController.close();
  }
}
