import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:git_hub_users/app/data/repositories/github_users_repository.dart';
import 'package:git_hub_users/app/screens/home/controller/home_page_controller.dart';

bindingHomePage() {
  Get.put<HomePageController>(HomePageController(repository: GithubUsersRepository(dio: Dio())));
}
