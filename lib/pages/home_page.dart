import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';
import '../controllers/usersC.dart';

class HomePage extends StatelessWidget {
  final usersC = Get.find<UsersC>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(20),
            child: usersC.users.isEmpty
                ? Center(
                    child: Text(
                      "Belum ada data",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: usersC.users.length,
                    itemBuilder: (context, i) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://via.placeholder.com/150"), // Placeholder untuk avatar
                        ),
                        title: Text(
                          "${usersC.users[i].name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          "${usersC.users[i].email}",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => usersC.delete(usersC.users[i].id),
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red[900],
                          ),
                        ),
                        onTap: () => Get.toNamed(
                          RouteName.profile,
                          arguments: usersC.users[i].id,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.get_app_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
