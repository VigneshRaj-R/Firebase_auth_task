import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController {
  Rx<Position?> currentPosition = Rx<Position?>(null);
  Rx<String?> ipAddress = Rx<String?>(null);

  Future<void> getLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition.value = position;
  }

  Future<void> getIpAddress() async {
    final response =
        await http.get(Uri.parse('https://api.ipify.org?format=json'));
    ipAddress.value = response.body;
  }
}

void uploadDataToFirebase() {
  final LocationController locationController = Get.find();
  if (locationController.currentPosition.value != null &&
      locationController.ipAddress.value != null) {
    FirebaseFirestore.instance.collection('locationData').add({
      'latitude': locationController.currentPosition.value!.latitude,
      'longitude': locationController.currentPosition.value!.longitude,
      'ipAddress': locationController.ipAddress.value,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
