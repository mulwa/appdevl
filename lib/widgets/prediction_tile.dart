import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test00001020/consta.dart';
import 'package:test00001020/model/address.dart';
import 'package:test00001020/model/place_prediction.dart';
import 'package:test00001020/utils/request_helper.dart';

class PridictionTile extends StatelessWidget {
  final Prediction prediction;
  const PridictionTile({
    Key key,
    this.prediction,
  }) : super(key: key);

  void getPlaceDetails(String placeID, context) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=$kApiKey";
    var res = await RequestHelper.getRequest(url);
    if (res == 'failed') {
      return;
    }
    if (res['status'] == 'OK') {
      Address address = Address();
      address.placeName = res['result']['name'];
      address.placeId = placeID;
      address.latitude = res['result']['geometry']['location']['lat'];
      address.longitude = res['result']['geometry']['location']['lng'];

      ;
      Navigator.pop(context, 'getDirection');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        getPlaceDetails(prediction.placeId, context);
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(Icons.location_city),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prediction.mainText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        prediction.secondaryText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 12.0),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
