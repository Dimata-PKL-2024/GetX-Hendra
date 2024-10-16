import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../controllers/usersC.dart';
import '../controllers/profileC.dart';

class ProfilePage extends StatelessWidget {
  final profileC = Get.find<ProfileC>();
  final userC = Get.find<UsersC>();
  final String uid = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final User user = userC.userById(uid);
    profileC.nameC.text = user.name!;
    profileC.emailC.text = user.email!;
    profileC.phoneC.text = user.phone!;

    return Scaffold(
      appBar: AppBar(
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
            onPressed: () => userC.delete(uid).then(
              (deleted) {
                if (deleted) Get.back();
              },
            ),
            icon: Icon(Icons.delete_forever),
            color: Colors.red[900],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                "Edit User Information:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: profileC.nameC,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: profileC.emailC,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: profileC.phoneC,
                autocorrect: false,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onEditingComplete: () => userC.edit(
                  uid,
                  profileC.nameC.text,
                  profileC.emailC.text,
                  profileC.phoneC.text,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => userC.edit(
                  uid,
                  profileC.nameC.text,
                  profileC.emailC.text,
                  profileC.phoneC.text,
                ),
                child: Text(
                  "UPDATE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
