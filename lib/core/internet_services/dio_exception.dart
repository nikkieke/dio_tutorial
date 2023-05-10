
import 'package:dio/dio.dart';

class DioException implements Exception{
  late String errorMessage;

  DioException.fromDioError(DioError dioError){
    switch(dioError.type){
      case DioErrorType.cancel:
        errorMessage = "Request to the server was cancelled.";
        break;
      case DioErrorType.connectionTimeout:
        errorMessage = "Connection timed out.";
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = "Receiving timeout occurred.";
        break;
      case DioErrorType.sendTimeout:
        errorMessage = "Request send timeout.";
        break;
      case DioErrorType.badResponse:
        errorMessage = _handleStatusCode(dioError.response?.statusCode);
        break;
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          errorMessage = 'No Internet.';
          break;
        }
        errorMessage = 'Unexpected error occurred.';
        break;
      default:
        errorMessage = 'Something went wrong';
        break;
    }
    }
  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'User already exist ';
      case 401:
        return 'Authentication failed.';
      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return 'The requested resource does not exist.';
      case 500:
        return 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString()=> errorMessage;
  }

