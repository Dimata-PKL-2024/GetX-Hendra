import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_controller.dart';
import '../controllers/users_controller.dart';

class AddPage extends StatelessWidget {
  final addController = Get.find<AddController>();
  final usersController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADD USER",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.teal, 
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                "Masukkan data yang benar:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: addController.nameController,
                labelText: "Full Name",
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: addController.emailController,
                labelText: "Email Address",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: addController.phoneController,
                labelText: "Phone Number",
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                onEditingComplete: () => _submitUser(),
              ),
              SizedBox(height: 40),
              _buildSubmitButton(), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputAction textInputAction = TextInputAction.done,
    TextInputType keyboardType = TextInputType.text,
    void Function()? onEditingComplete,
  }) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
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

  Widget _buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        backgroundColor: Colors.teal, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () => _submitUser(),
      child: Text(
        "ADD USER",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  void _submitUser() {
    usersController.add(
      addController.nameController.text,
      addController.emailController.text,
      addController.phoneController.text,
    );
  }
}
