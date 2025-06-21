import 'package:dio/dio.dart';
import 'package:git_hub_users/app/data/model/github_users_model.dart';

class GithubUsersRepository {
  final Dio dio;

  GithubUsersRepository({required this.dio});

  Future<List<GithubUsersModel>> getGitHubUsers() async {
    final result = await dio.get('https://api.github.com/users');

    final List<GithubUsersModel> users = [];

    if (result.statusCode == 200) {
      result.data
          .map((item) => users.add(GithubUsersModel.fromMap(item)))
          .toList();
    }

    return users;
  }

  Future<GithubUsersModel> getGitHubUser({required String username}) async {
    final result = await dio.get('https://api.github.com/users/$username');

    late GithubUsersModel user;

    if (result.statusCode == 200) {
      user = GithubUsersModel.fromMap(result.data);
    }

    return user;
  }
}
