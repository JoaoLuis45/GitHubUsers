import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_hub_users/app/screens/home/binding/home_page_binding.dart';
import 'package:git_hub_users/app/screens/home/controller/home_page_controller.dart';
import 'package:git_hub_users/app/screens/userDetail/views/user_details_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController _controller;

  @override
  void initState() {
    bindingHomePage();
    _controller = Get.find<HomePageController>();

    _controller.getGitHubUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 8,
        title: Text(
          'GitHub Users',
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
            : _controller.users.isEmpty
            ? Center(child: Text('Nenhum usuário encontrado'))
            : ListView.separated(
                itemCount: _controller.users.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final user = _controller.users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.amber,
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(2),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(user.avatarUrl),
                        ),
                      ),
                    ),
                    title: Text(
                      'Usuário',
                      style: TextStyle(color: Colors.black54),
                    ),
                    subtitle: Text(
                      user.login,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Get.to(UserDetailsView(user: user));
                    },
                  );
                },
              );
      }),
    );
  }
}
