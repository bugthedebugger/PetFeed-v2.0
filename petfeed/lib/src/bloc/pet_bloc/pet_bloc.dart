import 'dart:async';

import 'package:meta/meta.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/pet_bloc/pet_bloc_export.dart';
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';
import 'package:petfeed/src/data/repository/pet_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetBloc extends Bloc {
  final PetRepository repository;
  final SharedPreferences preferences;

  PetBloc(this.repository, this.preferences) {
    init();
  }

  StreamController<PetEvents> _eventStreamController =
      StreamController<PetEvents>.broadcast();
  Stream<PetEvents> get eventStream => _eventStreamController.stream;
  Sink<PetEvents> get _eventSink => _eventStreamController.sink;

  void init() {
    _eventStreamController.stream.listen(_mapEventsToState);
  }

  void _mapEventsToState(PetEvents event) {
    if (event is PetRegisterInitiated) {
      _mapPetRegisterInitiated(event);
    }
  }

  void registerPet(
      {@required String name,
      @required String type,
      double age,
      double weight}) {
    String token = preferences.get('token');
    dispatch(
      PetRegisterInitiated((b) => b
        ..token = token
        ..name = name
        ..type = type
        ..age = age
        ..weight = weight),
    );
  }

  void _mapPetRegisterInitiated(PetRegisterInitiated event) async {
    try {
      final response = await repository.registerPet(
        token: event.token,
        name: event.name,
        type: event.type,
        weight: event.weight,
        age: event.age,
      );
      if (response != null) {
        preferences.setString('pet', response.name);
        preferences.setInt('petID', response.id);
        preferences.setDouble('weight', response.weight);
        preferences.setDouble('age', response.age);
        preferences.setBool('setup', true);
        preferences.setString('petType', event.type);
        dispatch(PetRegisterSuccessful());
      } else {
        dispatch(
          PetRegisterError((b) => b..message = 'Something wen\'t wrong'),
        );
      }
    } on NoInternetException catch (_) {
      dispatch(PetRegisterError((b) => b..message = _.message));
    } on UnauthenticatedException catch (_) {
      dispatch(PetRegisterError((b) => b..message = _.message));
    } on PetException catch (_) {
      dispatch(PetRegisterError((b) => b..message = _.message));
    } catch (_) {
      dispatch(PetRegisterError((b) => b..message = _.toString()));
    }
  }

  void dispatch(PetEvents event) {
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _eventStreamController.close();
  }
}
