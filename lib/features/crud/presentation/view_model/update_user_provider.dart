import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/new_user.dart';
import '../../domain/usecase/provider.dart';

class UpdateUserProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;
  bool loading = false;
  late NewUser? newUser;
  final idCtr = TextEditingController();
  final nameCtr = TextEditingController();
  final jobCtr = TextEditingController();


  UpdateUserProvider({required this.ref});

  Future<void>updateUser()async{
    loading = true;
    notifyListeners();
    final response = await ref.watch(updateUserDataProvider).updateUserInfo(idCtr.text,
        nameCtr.text.toString(), jobCtr.text.toString());
    newUser = response;
    print(response.name);
    loading = false;
    notifyListeners();
  }
}

final updateUserInfoProvider = ChangeNotifierProvider<UpdateUserProvider>((ref) => UpdateUserProvider(ref:ref));