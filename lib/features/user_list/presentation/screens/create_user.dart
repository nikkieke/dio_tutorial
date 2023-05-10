import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/new_user_provider.dart';

class CreateUser extends ConsumerStatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends ConsumerState<CreateUser> {

  late NewUserProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = ref.watch(createNewUserProvider);

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
                  const Text("POST", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
                  const SizedBox(
                    height: 20,
                  ),
                   TextField(
                    decoration: const InputDecoration(hintText: 'Enter name'),
                    controller: provider.nameCtr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   TextField(
                    decoration: const InputDecoration(hintText: 'Enter job'),
                     controller: provider.jobCtr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(onPressed: ()async{
                    await provider.createNewUser();
                    if(mounted){
                      showDialog(
                          context: context,
                          builder: (context) => NewUserDialog(provider: provider,));
                    }
                    },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        color: Colors.blue,
                        child: const Text("Create User", style: TextStyle(color: Colors.white, fontSize: 16),),
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

class NewUserDialog extends StatelessWidget {
  const NewUserDialog({
    super.key, required this.provider,
  });
  final NewUserProvider provider;

  @override
  Widget build(BuildContext context) {
    return Dialog(
            child: Container(
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                ),
                    child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          Text('ID: ${provider.newUser?.id}'),
                          Text('Name: ${provider.newUser?.name}'),
                          Text('Job: ${provider.newUser?.job}'),
                          Text(
                          'Created at: ${provider.newUser?.createdAt}',
                          )
                      ]
                    )
                    )
            )
    );
  }
}


