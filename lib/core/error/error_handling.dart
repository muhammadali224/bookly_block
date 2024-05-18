import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "message");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "message");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "message");
      case DioExceptionType.badCertificate:
        return ServerFailure(message: "message");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data!);

      case DioExceptionType.cancel:
        return ServerFailure(message: "message");
      case DioExceptionType.connectionError:
        return ServerFailure(message: "message");
      case DioExceptionType.unknown:
        return ServerFailure(message: "message");
    }
  }

  factory ServerFailure.fromResponse(int responseCode, String message) {
    switch (responseCode) {
      // case 200:
      //   return ServerFailure(message: message);
      // case 201:
      //   return ServerFailure(message: message);
      case 400:
        return ServerFailure(message: message);
      case 401:
        return ServerFailure(message: message);
      case 403:
        return ServerFailure(message: message);
      case 404:
        return ServerFailure(message: message);
      case 500:
        return ServerFailure(message: message);
      default:
        return ServerFailure(message: message);
    }
  }
}

class ServerSuccess extends Failure {
  ServerSuccess({required super.message});
}

class ServerEmptyData extends Failure {
  ServerEmptyData({required super.message});
}
