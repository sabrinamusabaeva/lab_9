import 'package:flutter/material.dart';
import 'db_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DBHelper dbHelper = DBHelper();
  User user;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    User fetchedUser = await dbHelper.getUser(1);
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Main Screen'),
      ),

        body: Padding(
            padding: const EdgeInsets.all(15.0),

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children:[
                  Text(
                      'Username: ${user.username ?? ""}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                      'Phone: ${user.phone ?? ""}'
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                      'Address: ${user.address ?? ""}'
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                      'Email: ${user.email ?? ""}'
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ]
            )
        )
    ),
  }
}