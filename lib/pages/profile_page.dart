import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../controllers/users_controller.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final profileController = Get.find<ProfileController>();
  final usersController = Get.find<UsersController>();
  final String uid = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final User user = usersController.userById(uid);
    profileController.nameController.text = user.name!;
    profileController.emailController.text = user.email!;
    profileController.phoneController.text = user.phone!;

    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              _buildTitle(),
              SizedBox(height: 20),
              ProfileTextField(
                controller: profileController.nameController,
                label: "Full Name",
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20),
              ProfileTextField(
                controller: profileController.emailController,
                label: "Email Address",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20),
              ProfileTextField(
                controller: profileController.phoneController,
                label: "Phone Number",
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => _updateUser(),
              ),
              SizedBox(height: 40),
              _buildUpdateButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "PROFILE",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.teal,
      actions: [
        IconButton(
          onPressed: () => usersController.delete(uid).then(
            (deleted) {
              if (deleted) Get.back();
            },
          ),
          icon: Icon(Icons.delete_forever),
          color: Colors.red[900],
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      "Edit User Information:",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildUpdateButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () => _updateUser(),
      child: Text(
        "UPDATE",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  void _updateUser() {
    usersController.edit(
      uid,
      profileController.nameController.text,
      profileController.emailController.text,
      profileController.phoneController.text,
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final VoidCallback? onEditingComplete;

  ProfileTextField({
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onEditingComplete: onEditingComplete,
    );
  }
}