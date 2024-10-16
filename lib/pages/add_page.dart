import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/addC.dart';
import '../controllers/usersC.dart';

class AddPage extends StatelessWidget {
  final addC = Get.find<AddC>();
  final usersC = Get.find<UsersC>();

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
              TextField(
                controller: addC.nameC,
                textInputAction: TextInputAction.next,
                autocorrect: false,
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
                controller: addC.emailC,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autocorrect: false,
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
                controller: addC.phoneC,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                autocorrect: false,
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
                onEditingComplete: () => usersC.add(
                  addC.nameC.text,
                  addC.emailC.text,
                  addC.phoneC.text,
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
                onPressed: () => usersC.add(
                  addC.nameC.text,
                  addC.emailC.text,
                  addC.phoneC.text,
                ),
                child: Text(
                  "ADD USER",
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
