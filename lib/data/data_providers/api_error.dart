import 'package:flutter_pokedex/data/data_providers/data_provider_error.dart';

class ApiError extends DataProviderError {
  ApiError({required int code, required String message})
      : super(code: code, message: message);
}
