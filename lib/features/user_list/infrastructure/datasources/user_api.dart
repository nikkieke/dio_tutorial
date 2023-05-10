import 'package:dio/dio.dart';
import '../../../../core/internet_services/dio_client.dart';
import '../../../../core/internet_services/paths.dart';

// class UserApi {
//   final DioClient dioClient;
//
//   UserApi({required this.dioClient});
//
//   Future<Response> addUserApi(String name, String job) async {
//     try {
//       final Response response = await dioClient.post(
//         users,
//         data: {
//           'name': name,
//           'job': job,
//         },
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<Response> getUsersApi() async {
//     try {
//       final Response response = await dioClient.get(users);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<Response> updateUserApi(int id, String name, String job) async {
//     try {
//       final Response response = await dioClient.put(
//         '$users/$id',
//         data: {
//           'name': name,
//           'job': job,
//         },
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<void> deleteUserApi(int id) async {
//     try {
//       await dioClient.delete('$users/$id');
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
