import 'package:get/get.dart';
import 'package:git_hub_users/app/data/model/github_users_model.dart';
import 'package:git_hub_users/app/data/repositories/github_users_repository.dart';

class UserDetailsController extends GetxController {
  final GithubUsersRepository repository;

  GithubUsersModel? _user;
  GithubUsersModel? get user => _user;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  UserDetailsController({required this.repository});

  getGitHubUser({required String username}) async {
    _isLoading.value = true;

    final result = await repository.getGitHubUser(username: username);

    _user = result;

    _isLoading.value = false;
  }
}
