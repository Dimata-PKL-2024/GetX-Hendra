import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';
import '../controllers/users_controller.dart';

class HomePage extends StatelessWidget {
  final usersController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(20),
            child: usersController.users.isEmpty
                ? _buildEmptyState()
                : _buildUserList(),
          ),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "PESERTA LOMBA EPEP",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.teal,
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(RouteName.add),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildUserList() {
    return ListView.builder(
      itemCount: usersController.users.length,
      itemBuilder: (context, i) => UserCard(
        id: usersController.users[i].id,
        name: usersController.users[i].name!,
        email: usersController.users[i].email!,
  
        onDelete: () => usersController.delete(usersController.users[i].id),
        onTap: () => Get.toNamed(
          RouteName.profile,
          arguments: usersController.users[i].id,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        "Belum ada data",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.teal,
      child: Icon(
        Icons.get_app_rounded,
        color: Colors.white,
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String id;
  final String name;
  final String email;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  UserCard({
    required this.id,
    required this.name,
    required this.email,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage("https://via.placeholder.com/150"),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          email,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        trailing: IconButton(
          onPressed: onDelete,
          icon: Icon(
            Icons.delete_forever,
            color: Colors.red[900],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}