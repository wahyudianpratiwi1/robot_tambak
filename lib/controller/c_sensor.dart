import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../model/sensor.dart';

class CSensor extends GetxController {
  Rx<Sensor> sensorData = Sensor().obs;
  late DatabaseReference _databaseReference;
  void updateSensor(String field, dynamic value) {
    _databaseReference.child(field).set(value);
  }

  void updateSensor2(Map<String, dynamic> data) {
    _databaseReference.update(data);
  }

  @override
  void onInit() {
    super.onInit();
    _databaseReference = FirebaseDatabase.instance.ref('Sensor');
    _databaseReference.onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        // var data = snapshot.value;
        final data =
            Map<String, dynamic>.from(snapshot.value! as Map<Object?, Object?>);
        if (data != null) {
          var sensor = Sensor.fromJson(data);
          sensorData.value = sensor;
        } else {
          sensorData.value = Sensor(
            baterai: 0,
            pakan: 0,
            setAir: 0,
            setJam: 0,
            setMenit: 0,
            suhu: 0.0,
            ultrasonic: 0,
            pH: 0.0,
          );
        }
      }
    });
  }
}
