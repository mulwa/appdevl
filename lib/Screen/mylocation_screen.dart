import 'package:flutter/material.dart';
import 'package:test00001020/Screen/search_location.dart';

class MyLocationScreen extends StatelessWidget {
  static const String id = 'my-location';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                "Welcome back ! is this your location",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text("To "),
              InkWell(
                child: Text("Change Location"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchDestination()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
