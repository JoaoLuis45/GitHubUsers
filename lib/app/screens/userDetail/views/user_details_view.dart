import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:git_hub_users/app/data/model/github_users_model.dart';
import 'package:git_hub_users/app/screens/userDetail/binding/user_details_binding.dart';
import 'package:git_hub_users/app/screens/userDetail/controller/user_details_controller.dart';

class UserDetailsView extends StatefulWidget {
  final GithubUsersModel user;

  const UserDetailsView({super.key, required this.user});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  late final UserDetailsController _controller;

  @override
  void initState() {
    super.initState();
    bindingUserDetails();
    _controller = Get.find<UserDetailsController>();
    _controller.getGitHubUser(username: widget.user.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          'Detalhe do usuário',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Obx(() {
        return _controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : _controller.user == null
            ? Center(child: Text('Usuário não encontrado'))
            : _userBuildInfo();
      }),
    );
  }

  Widget _userBuildInfo() {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Image.network(
                  height: 275,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  _controller.user!.avatarUrl,
                ),
              ),
              SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.person, color: Colors.amber),
                title: Text(
                  'Nome',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _controller.user!.name ?? 'Sem nome',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.login, color: Colors.amber),
                title: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _controller.user!.login,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.public, color: Colors.amber),
                title: Text(
                  'Repositórios Públicos',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _controller.user!.publicRepos.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.people_alt, color: Colors.amber),
                title: Text(
                  'Seguidores',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _controller.user!.followers.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.flag, color: Colors.amber),
                title: Text(
                  'Local',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _controller.user!.location ?? 'Sem informações',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
