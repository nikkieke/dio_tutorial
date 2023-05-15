import '../model/new_user.dart';
import '../model/user.dart';


abstract class UserRepository{
  Future<List<User>>getUserList();
  Future<NewUser>addNewUser(String name, String job);
  Future<NewUser>updateUser(String id, String name, String job);
  Future<void>deleteUser(String id);
}