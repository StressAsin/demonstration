import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_mgmt/login_screen.dart';
import 'package:stress_mgmt/user_controller.dart';
import 'package:stress_mgmt/utils.dart';

class FeedbackScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    String username = userController.getUsername();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Feedback"),
              titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 40),
                Text("Here is your feedback from us",
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 10),
                Container(
                  width: width * 0.85,
                  height: 2,
                  color: Colors.grey,
                ),
                SizedBox(height: 40),
                Container(
                  width: width * 0.95,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black38,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi $username!",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Congratulations for going through your stress management session.",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "You are a champion and you are in charge of your mental health!",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(height: 20),
                      Text("Bravo!",
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    showToast("See you later!");
                    Get.offAll(() => LoginScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: MediaQuery.of(context).size.width * 0.2),
                    decoration: BoxDecoration(
                      color: Color(0xFF0EAB9B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
            ),
          ),
        ],
      ),
    );
  }
}
