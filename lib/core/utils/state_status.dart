import 'package:tafeel_task/core/utils/app_enums.dart';

class StateStatus<T> {
  final Status status;
  final T? data;
  final String? error;
  final Map<String, dynamic>? errorData;

  const StateStatus._({
    required this.status,
    this.data,
    this.error,
    this.errorData,
  });

  const StateStatus.initial() : this._(status: Status.initial);
  const StateStatus.loading() : this._(status: Status.loading);
  const StateStatus.success(T data)
    : this._(status: Status.success, data: data);
  const StateStatus.failure(String error, {Map<String, dynamic>? errorData})
    : this._(status: Status.failure, error: error, errorData: errorData);

  bool get isInitial => status == Status.initial;
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isFailure => status == Status.failure;

  StateStatus<T> copyWith({
    Status? status,
    T? data,
    String? error,
    Map<String, dynamic>? errorData,
  }) {
    return StateStatus._(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
      errorData: errorData ?? this.errorData,
    );
  }
}
