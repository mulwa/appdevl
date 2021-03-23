import 'package:flutter/material.dart';
import 'package:test00001020/Screen/map_screen.dart';
import 'package:test00001020/Screen/search_location.dart';
import 'package:test00001020/widgets/Grabbutton.dart';

class SetLocationAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Location access is important",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                "Ride pick-ups and other services will be faster and more accurate. We can also ensure your safety",
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 600,
                child: Image.asset(
                  'assets/images/city.png',
                  fit: BoxFit.fill,
                  color: Colors.black12,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GrabButton(
                          title: "Allow Location Access",
                          onPressed: () {
                            print("hey");
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GrabButton(
                          title: "Enter My Location",
                          color: Colors.grey,
                          onPressed: () {
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
