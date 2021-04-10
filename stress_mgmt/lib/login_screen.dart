import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_mgmt/home_screen.dart';
import 'package:stress_mgmt/user_controller.dart';
import 'package:stress_mgmt/utils.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Image.asset("assets/logo.png"),
            SizedBox(height: 60),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                // Ensure a name was provided
                if (_usernameController.text.replaceAll(" ", "").length < 2) {
                  showToast("Please add a nickname");
                  return;
                }
                Get.put(UserController()).username = _usernameController.text;
                Get.offAll(() => HomeScreen());
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFF0EAB9B),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Submit",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
