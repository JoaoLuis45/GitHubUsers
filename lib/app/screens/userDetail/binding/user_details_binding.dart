import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:git_hub_users/app/data/repositories/github_users_repository.dart';
import 'package:git_hub_users/app/screens/userDetail/controller/user_details_controller.dart';

bindingUserDetails() {
  Get.put<UserDetailsController>(
    UserDetailsController(repository: GithubUsersRepository(dio: Dio())),
  );
}
