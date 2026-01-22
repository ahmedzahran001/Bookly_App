import 'package:dio/dio.dart';

abstract class Failures {
  final String? errMessage;

  const Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');

      case DioErrorType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );

      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioErrorType.connectionError:
        return ServerFailure('Connection Error with ApiServer');

      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Opps Unexpected Error, Please again!');
        }
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statuscode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Opps There was an Error, Please try later!');
    }
  }
}
