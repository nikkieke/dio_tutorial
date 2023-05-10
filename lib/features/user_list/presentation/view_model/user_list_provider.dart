import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/user.dart';
import '../../domain/usecase/provider.dart';

class UserListProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;
  List<User>list = [];
  bool haveData = false;

  UserListProvider({required this.ref});

  Future<void>init()async{
    list = await ref.watch(usersListProvider).getAllUsers();
    haveData = true;
    notifyListeners();
  }
}

final getUsersProvider = ChangeNotifierProvider<UserListProvider>((ref) => UserListProvider(ref: ref));