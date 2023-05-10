import 'package:dioclient_tutorial/features/user_list/domain/usecase/user_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/repository/provider.dart';


final usersListProvider = Provider<UserUseCase>((ref){
  return UserUseCaseImpl(ref.read(userListProvider));
});

final createUserProvider = Provider<UserUseCase>((ref){
  return UserUseCaseImpl(ref.read(newUserProvider));
});

final updateUserDataProvider = Provider<UserUseCase>((ref){
  return UserUseCaseImpl(ref.read(updateUserProvider));
});

final deleteUserDataProvider = Provider<UserUseCase>((ref){
  return UserUseCaseImpl(ref.read(deleteUserProvider));
});
