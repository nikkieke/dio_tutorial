import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/new_user.dart';
import '../../domain/usecase/provider.dart';

class NewUserProvider extends ChangeNotifier{
  final ChangeNotifierProviderRef ref;
  bool loading = false;
  late NewUser? newUser;
  final nameCtr = TextEditingController();
  final jobCtr = TextEditingController();


  NewUserProvider({required this.ref});

  Future<void>createNewUser()async{
    loading = true;
    notifyListeners();
    final response = await ref.watch(createUserProvider).createNewUser(nameCtr.text.toString(),
        jobCtr.text.toString());
    newUser = response;
    print(response.name);
    loading = false;
    notifyListeners();
  }
}

final createNewUserProvider = ChangeNotifierProvider<NewUserProvider>((ref) => NewUserProvider(ref:ref));