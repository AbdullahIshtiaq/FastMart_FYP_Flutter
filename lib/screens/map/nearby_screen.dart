import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/Map.dart';
import 'package:fyp_frontend/screens/map/components/map_card.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_launcher/maps_launcher.dart';

class NearNyScreen extends StatefulWidget {
  const NearNyScreen({Key? key}) : super(key: key);

  @override
  State<NearNyScreen> createState() => _NearNyScreenState();
}

class _NearNyScreenState extends State<NearNyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nearby Marts",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding / 2, 0.0, defaultPadding / 2, defaultPadding * 2),
        child: Expanded(
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor, shape: const StadiumBorder()),
                  onPressed: () {
                    MapsLauncher.launchQuery('Madina Cash and Carry');
                  },
                  child: const Text('See All Branches'),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.17,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: MapCard(
                      map: branchesList[index],
                    ),
                  ),
                  itemCount: branchesList.length,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
