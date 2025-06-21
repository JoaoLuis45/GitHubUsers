import 'package:get/get.dart';
import 'package:git_hub_users/app/data/model/github_users_model.dart';
import 'package:git_hub_users/app/data/repositories/github_users_repository.dart';

class HomePageController extends GetxController {
  final GithubUsersRepository repository;

  final List<GithubUsersModel> _users = <GithubUsersModel>[].obs;
  List<GithubUsersModel> get users => _users;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  HomePageController({required this.repository});

  getGitHubUsers() async {
    _isLoading.value = true;

    final response = await repository.getGitHubUsers();

    _users.addAll(response);

    _isLoading.value = false;
  }
}
