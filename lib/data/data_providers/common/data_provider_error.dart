abstract class DataProviderError implements Exception {
  final int code;
  final String message;

  DataProviderError({required this.code, required this.message});
}
