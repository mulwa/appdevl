import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test00001020/Screen/mylocation_screen.dart';
import 'package:test00001020/providers/location_provider.dart';
import 'package:test00001020/providers/user_location_provider.dart';
import 'package:test00001020/widgets/Grabbutton.dart';

import 'map_screen.dart';
import 'search_location.dart';

class LandingScreen extends StatefulWidget {
  static const String id = 'landing-screen';
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  LocationProvider _locationProvider = LocationProvider();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Consumer<UserAddressProvider>(
            builder: (context, address, child) => Column(
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
                address.currentAddress != null
                    ? Text(
                        "Last location entered",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                      )
                    : InkWell(
                        onTap: () async {
                          var res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchDestination()));
                        },
                        child: Text(
                          "Select Current Address",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                address.currentAddress != null
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.location_pin,
                              color: Colors.amberAccent,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              address.currentAddress?.placeName?.toLowerCase(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: InkWell(
                              child: Text(
                                "Change",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                              onTap: () async {
                                var res = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchDestination()));

                                print(res);
                              },
                            ),
                          )
                        ],
                      )
                    : Container(),
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
                            title: "Use This Location",
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyLocationScreen()));
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
      ),
    );
  }
}
