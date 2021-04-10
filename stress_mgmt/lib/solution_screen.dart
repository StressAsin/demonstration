import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_mgmt/selection_data.dart';
import 'package:stress_mgmt/user_controller.dart';

class SolutionScreen extends StatefulWidget {
  @override
  _SolutionScreenState createState() => _SolutionScreenState();
}

class _SolutionScreenState extends State<SolutionScreen> {
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Try these out!"),
              titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            List<String> res = results[index];
            return ListTile(
              leading: Image.network(
                res[0],
                width: 90,
                fit: BoxFit.cover,
              ),
              title: Text(res[1]),
              subtitle: Text(res[2]),
            );
          }, childCount: results.length)),
        ],
      ),
    );
  }
}
