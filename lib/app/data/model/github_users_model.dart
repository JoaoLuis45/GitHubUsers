// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GithubUsersModel {
  final String login;
  final String avatarUrl;
  final String? location;
  final String? name;
  final int? followers;
  final int? publicRepos;

  GithubUsersModel({
    required this.login,
    required this.avatarUrl,
    required this.location,
    required this.name,
    required this.followers,
    required this.publicRepos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatar_url': avatarUrl,
      'location': location,
      'name': name,
      'followers': followers,
      'public_repos': publicRepos,
    };
  }

  factory GithubUsersModel.fromMap(Map<String, dynamic> map) {
    return GithubUsersModel(
      login: map['login'],
      avatarUrl: map['avatar_url'],
      location: map['location'],
      name: map['name'] ,
      followers: map['followers'],
      publicRepos: map['public_repos'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubUsersModel.fromJson(String source) => GithubUsersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
