import 'package:dioclient_tutorial/features/user_list/presentation/screens/update_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/user_list_provider.dart';
import 'create_user.dart';
import 'delete_user.dart';


class UserList extends ConsumerStatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  late UserListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = ref.watch(getUsersProvider);
    provider.init();

    return Scaffold(
      drawer: Drawer(
          width: 200,
          backgroundColor: Colors.blue,
          child: Container(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                  children: [
                    ListTile(
                        leading: const Icon(Icons.new_label),
                        title: const Text("Get User List",style: TextStyle(
                            color: Colors.white,  fontSize: 15)),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> const UserList()));
                        }
                    ),
                    ListTile(
                        leading: const Icon(Icons.new_label),
                        title: const Text("Create new user",style: TextStyle(
                            color: Colors.white,  fontSize: 15)),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> const CreateUser()));
                        }
                    ),
                    ListTile(
                        leading: const Icon(Icons.new_label),
                        title: const Text("Update User",style: TextStyle(
                            color: Colors.white,  fontSize: 15)),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> const UpdateUser()));
                        }
                    ),
                    ListTile(
                        leading: const Icon(Icons.new_label),
                        title: const Text("Delete User",style: TextStyle(
                            color: Colors.white,  fontSize: 15)),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> const DeleteUser()));
                        }
                    ),
                  ]
              )
          )
      ),
      appBar: AppBar(title: const Text("Get User list"),),
      body: provider.haveData?
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.list.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading:  ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network("${provider.list[index].avatar}")
                        ),
                      title: Text('${provider.list[index].firstName}'),
                      subtitle: Text('${provider.list[index].lastName}'),
                    );
                  })
            ],
          ),
        ),
      ):
          const Center(child: CircularProgressIndicator())
    );
  }
}


