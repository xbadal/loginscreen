import 'package:easylogin/data/student_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                padding: EdgeInsets.only(right: 8.0, left: 8.0),

                itemCount: students.length,
                itemBuilder: (context, index) {
                  final item = students[index];

                  return _studentRow(
                    item['name']!,
                    item['image']!,
                    item['description']!,
                  );
                },
              ),
    );
  }
}

_studentRow(String name, String image, String desc) {
  return Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey, width: 0.5), // Underline
      ),
    ),
    child: Row(
      children: [
        Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
        SizedBox(width: 12.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 4),
              Text(
                desc,
                maxLines: 1,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
