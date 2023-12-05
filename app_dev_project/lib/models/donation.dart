import 'package:cloud_firestore/cloud_firestore.dart';

class Donations {
  DateTime date;
  String charityName;
  Map<String, int> foodMap;

  Donations({
    required this.date,
    required this.charityName,
    required this.foodMap,
  });

  Map<String, dynamic> toJson() => {
        "date": date,
        "charity": charityName,
        "foodMap": foodMap,
      };

  factory Donations.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    final Timestamp timestamp = data['date'] as Timestamp;

    return Donations(
        date: timestamp.toDate(),
        charityName: data["charity"],
        foodMap: (data['foodMap'] as Map<String, dynamic>).cast<String, int>());
    //foodMap: data["foodMap"]);
  }
}
