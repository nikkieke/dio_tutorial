import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/provider.dart';

class DeleteUserProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;
  bool loading = false;
  final idCtr = TextEditingController();

  DeleteUserProvider({required this.ref});

  Future<void>deleteUser()async{
    loading = true;
    notifyListeners();
    await ref.watch(deleteUserDataProvider).deleteUserInfo(idCtr.text.toString());
    loading = false;
    notifyListeners();
  }
}

final deleteUserInfoProvider = ChangeNotifierProvider<DeleteUserProvider>((ref) => DeleteUserProvider(ref:ref));