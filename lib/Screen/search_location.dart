import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test00001020/Screen/map_screen.dart';
import 'package:test00001020/consta.dart';
import 'package:test00001020/model/place_prediction.dart';
import 'package:test00001020/utils/request_helper.dart';
import 'package:test00001020/widgets/prediction_tile.dart';

class SearchDestination extends StatefulWidget {
  @override
  _SearchDestinationState createState() => _SearchDestinationState();
}

class _SearchDestinationState extends State<SearchDestination> {
  TextEditingController pickUpController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  FocusNode focusDestination = FocusNode();
  bool focused = false;

  void setFocus() {
    if (!focused) {
      FocusScope.of(context).requestFocus(focusDestination);
      focused = true;
    }
  }

  List<Prediction> destinationPrediction = [];

  void searchPlace(String placeName) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$kApiKey&sessiontoken=1234567890&components=country:ke";

    if (placeName.length > 2) {
      var res = await RequestHelper.getRequest(url);
      if (res == 'failed') {
        return;
      }
      if (res['status'] == 'OK') {
        var predictionJson = res['predictions'];

        var predictionList = (predictionJson as List)
            .map((e) => Prediction.fromJson(e))
            .toList();
        setState(() {
          destinationPrediction = predictionList;
        });
      }
      print(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    setFocus();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7))
              ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, top: 48, right: 24, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back)),
                        Text('Your Location',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800)),
                        IconButton(
                            icon: Icon(Icons.map),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, MapScreen.id);
                            })
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.amberAccent,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: TextField(
                                onChanged: (val) {
                                  searchPlace(val);
                                },
                                focusNode: focusDestination,
                                controller: destinationController,
                                decoration: InputDecoration(
                                    hintText: 'Enter current address',
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                    fillColor: Colors.white,
                                    filled: true,
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 10, bottom: 10),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            (destinationPrediction.length > 0)
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PridictionTile(
                            prediction: destinationPrediction[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, index) {
                          return Divider();
                        },
                        itemCount: destinationPrediction.length),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
