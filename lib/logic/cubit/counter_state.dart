import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool? wasIncremented;

  CounterState({required this.counterValue, this.wasIncremented});

  // Is to compare attributes from class and check if two classes are the same with equatable
  @override
  // TODO: implement props
  List<Object?> get props => [this.counterValue, this.wasIncremented];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented:
          map['wasIncremented'] != null ? map['wasIncremented'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
