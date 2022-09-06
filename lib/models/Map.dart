// ignore: file_names

class Maps {
  final String title, description, image, distance;
  final double latitude, longitude;

  Maps({
    required this.title,
    required this.description,
    required this.image,
    required this.distance,
    required this.latitude,
    required this.longitude,
  });
}

List<Maps> branchesList = [
  Maps(
    title: "MCC Gulzar e Quaid",
    description:
        "Hussain and Ali Plaza, Old Airport Rd, Faisal Colony, Rawalpindi, Punjab, Pakistan",
    image: "assets/maps/mcc_gulzar_e_quaid.PNG",
    distance: "0 km",
    latitude: 33.6013203,
    longitude: 73.1249883,
  ),
  Maps(
    title: "MCC Ghori Town",
    description:
        "Ghori Town Phase 4-A، Islamabad, Islamabad Capital Territory، Pakistan",
    image: "assets/maps/mcc_ghori_town.PNG",
    distance: "0 km",
    latitude: 33.6160989,
    longitude: 73.1367373,
  ),
  Maps(
    title: "MCC Khana Pul",
    description:
        "Khanna Bilal Town Khanna, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan",
    image: "assets/maps/mcc_khana_pul.PNG",
    distance: "0 km",
    latitude: 33.6307124,
    longitude: 73.1148693,
  ),
  Maps(
    title: "MCC Band Khanna Road",
    description: "Muslim Town, Rawalpindi, Punjab 46000, Pakistan",
    image: "assets/maps/mcc_band_khanna_road.PNG",
    distance: "0 km",
    latitude: 33.6267932,
    longitude: 73.0913216,
  ),
];
