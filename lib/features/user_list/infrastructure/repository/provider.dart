import 'package:dioclient_tutorial/features/user_list/domain/repository/user_repository.dart';
import 'package:dioclient_tutorial/features/user_list/infrastructure/repository/user_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final userListProvider = Provider<UserRepository>((ref){
  return UserRepositoryImpl();
});

final newUserProvider = Provider<UserRepository>((ref){
  return UserRepositoryImpl();
});

final updateUserProvider = Provider<UserRepository>((ref){
  return UserRepositoryImpl();
});

final deleteUserProvider = Provider<UserRepository>((ref){
  return UserRepositoryImpl();
});