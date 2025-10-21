abstract class Failure {
  String get message;
  Map<String, dynamic>? get errorData => <String, dynamic>{};
}

class RuntimeFailure implements Failure {
  final Object error;
  final String? errorMessage;

  RuntimeFailure({required this.error, this.errorMessage});

  @override
  String get message => errorMessage ?? 'RUNTIME ERROR: ${error.toString()}';

  @override
  Map<String, dynamic>? get errorData => null;
}
