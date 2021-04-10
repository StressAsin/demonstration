import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_mgmt/selection_data.dart';
import 'package:stress_mgmt/solution_screen.dart';
import 'package:stress_mgmt/user_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserController userController = Get.put(UserController());
  List<String> selectedFeels = [];

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
              title: Text("Hi, $username"),
              titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              background: Image.asset(
                "assets/background.png",
                fit: BoxFit.cover,
                width: width,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 80),
                Text("Choose what best describes you",
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 10),
                Container(
                  width: width * 0.85,
                  height: 2,
                  color: Colors.grey,
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Wrap(
                      children: feels
                          .map((e) => GestureDetector(
                                onTap: () {
                                  // Add `e` in list if not there, else remove
                                  if (selectedFeels.contains(e)) {
                                    selectedFeels.remove(e);
                                  } else {
                                    selectedFeels.add(e);
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: PillWidget(
                                    selected: selectedFeels.contains(e),
                                    text: e,
                                  ),
                                ),
                              ))
                          .toList()),
                ),
                SizedBox(
                  height: 30,
                ),
                if (selectedFeels.length > 0)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SolutionScreen()),
                      );
                    },
                    child: Text("Submit"),
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

class PillWidget extends StatelessWidget {
  final String text;
  final bool selected;
  const PillWidget({this.text, this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: selected ? Color(0xFF121212) : Color(0xFF00DCC7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .button
            .copyWith(color: selected ? Colors.white : Colors.black),
      ),
    );
  }
}
