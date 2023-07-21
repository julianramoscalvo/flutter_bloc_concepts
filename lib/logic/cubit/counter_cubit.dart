import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  // hydrated methods are called for every state and emit.
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    // recoge valor como json/map
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    //addError(Exception("Couldn't write to storage!"), StackTrace.current);
    // guarda como map/json
    return state.toMap();
  }

/*
  @override
  void onChange(Change<CounterState> change) {
    // every emit call this function
    // it is called before emit, next is the future current.
    //print( "current: ${change.currentState.counterValue} next: ${change.nextState.counterValue}");
    if (kDebugMode) {
      print(change);
    }

    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('error: $error, stackTrace: $stackTrace');
    }
    super.onError(error, stackTrace);
  }
  */
}
