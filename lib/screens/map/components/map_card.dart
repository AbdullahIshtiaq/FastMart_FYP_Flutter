import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../../../constants.dart';
import '../../../models/Map.dart';

class MapCard extends StatelessWidget {
  const MapCard({Key? key, required this.map}) : super(key: key);

  final Maps map;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: primaryColor,
          width: 1,
        ),
      ),
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            map.image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  map.title,
                  style: TextStyle(fontSize: 20, color: Colors.grey[800]),
                ),
                Container(height: 10),
                Text(map.description,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                style:
                    TextButton.styleFrom(foregroundColor: Colors.transparent),
                child: const Text(
                  "GO TO MAP",
                  style: TextStyle(color: primaryColor),
                ),
                onPressed: () {
                  MapsLauncher.launchCoordinates(
                      map.latitude, map.longitude, map.title);
                },
              ),
            ],
          ),
          Container(height: 5)
        ],
      ),
    );
  }
}
