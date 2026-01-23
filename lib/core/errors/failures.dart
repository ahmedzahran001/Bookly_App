import 'package:dio/dio.dart';

abstract class Failures {
  final String? errMessage;

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
        return ServerFailure('Connection Error with ApiServer');

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Opps Unexpected Error, Please try again!');
        }
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure(
        'Error 404, Your request not found, Please try later!',
      );
    } else if (statuscode == 500) {
      return ServerFailure(
        'Error 500, Internal Server error, Please try later!',
      );
    } else {
      return ServerFailure('Opps There was an Error, Please try later!');
    }
  }
}
