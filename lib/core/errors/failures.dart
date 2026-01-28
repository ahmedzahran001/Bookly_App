import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  const Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('Opps, an incorrect Certificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Opps Unexpected Error, Please try again!');
        }
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    switch (statuscode) {
      case 400:
        return ServerFailure('Bad request, please check your input');

      case 401:
        return ServerFailure('Unauthorized, please login again');

      case 403:
        return ServerFailure("You don't have permission to access this");

      case 404:
        return ServerFailure('Requested resource not found');

      case 408:
        return ServerFailure('Request timeout, please try again');

      case 409:
        return ServerFailure('Conflict occurred, please try again');

      case 422:
        return ServerFailure('Invalid data, please check your input');

      case 429:
        return ServerFailure(
          'Too many requests 😅\nPlease wait a minute and try again',
        );

      case 500:
        return ServerFailure('Internal server error, please try later');

      case 502:
        return ServerFailure('Bad gateway, server is unreachable');

      case 503:
        return ServerFailure('Service unavailable, try again later');

      case 504:
        return ServerFailure('Server timeout, please try again later');

      default:
        return ServerFailure('Opps There was an Error, Please try later!');
    }
  }
}
