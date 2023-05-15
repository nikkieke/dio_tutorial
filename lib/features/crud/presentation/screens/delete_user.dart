import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/delete_user_provider.dart';

class DeleteUser extends ConsumerStatefulWidget {
  const DeleteUser({Key? key}) : super(key: key);

  @override
  ConsumerState<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends ConsumerState<DeleteUser> {

  late DeleteUserProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = ref.watch(deleteUserInfoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("User Info"),),
      body: Center(
          child: provider.loading?
          const CircularProgressIndicator():
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children:  [
                  const Text("Delete", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Enter Id'),
                    controller: provider.idCtr,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(onPressed: ()async{
                    await provider.deleteUser();
                    const snackBar = SnackBar(
                      content: Text(
                        'User deleted!',
                      ),
                    );
                    if(mounted){
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        color: Colors.blue,
                        child: const Text("Delete User", style: TextStyle(color: Colors.white, fontSize: 16),),
                      )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

