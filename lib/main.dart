import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hive CRUD Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final boxx = Hive.box('mybox');
  Writedata() async {
    await boxx.put(2, 'flutterplabs');
  }

  updatedata() async {
    await boxx.put(2, 'plabs');
  }

  ReadData() {
    setState(() {});
  }

  Deletedata() async {
    await boxx.delete(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Writedata();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blue,
                  child: Text('Write'),
                ),
              ),
              InkWell(
                onTap: () {
                  ReadData();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blue,
                  child: Text('Read'),
                ),
              ),
              InkWell(
                onTap: () {
                  updatedata();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blue,
                  child: Text('Update'),
                ),
              ),
              InkWell(
                onTap: () {
                  Deletedata();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blue,
                  child: Text('Delete'),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              boxx.get(2) == null ? 'No Data Found' : boxx.get(2),
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
