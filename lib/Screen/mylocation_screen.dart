import 'package:flutter/material.dart';
import 'package:test00001020/Screen/search_location.dart';
import 'package:test00001020/Screen/setlocation_screen.dart';
import 'package:test00001020/widgets/Grabbutton.dart';

import 'map_screen.dart';

class MyLocationScreen extends StatelessWidget {
  static const String id = 'my-location';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back ! is this your location",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To skip this step from now on , allow location access for your Grab services "),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Last location entered",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/marker.png',
                      height: 16,
                      width: 16,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Karaadzhi Turkmenistan Karaadzhi Turkmenistan",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Text(
                        "Change",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchDestination()));
                      },
                    ),
                  )
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200,
                    child: Column(
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
                          title: "Use This Location",
                          color: Colors.grey,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SetLocationAddress()));
                            // Navigator.pushReplacementNamed(
                            //     context, MapScreen.id);
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
