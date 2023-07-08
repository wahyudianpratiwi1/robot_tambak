import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../helper/notification_helper.dart';
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
          checkNotification(sensor);
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
          checkNotification(Sensor(
            baterai: 0,
            pakan: 0,
            setAir: 0,
            setJam: 0,
            setMenit: 0,
            suhu: 0.0,
            ultrasonic: 0,
            pH: 0.0,
          ));
        }
      }
    });
  }

  void checkNotification(Sensor sensor) {
    final pHValue = sensor.pH;
    final suhuValue = sensor.suhu;
    if (pHValue! < 6.5 || pHValue > 9) {
      NotificationHelper.showNotification(
        title: 'Peringatan PH Air',
        body: 'PH air abnormal: $pHValue',
      );
    }
    if (suhuValue! < 27 || suhuValue > 30) {
      NotificationHelper.showNotification(
        title: 'Peringatan Suhu Air',
        body: 'Suhu air abnormal: $suhuValue °C',
      );
    }

    if ((pHValue < 6.5 || pHValue > 9) && (suhuValue < 27 || suhuValue > 30)) {
      NotificationHelper.showNotification(
        title: 'Peringatan Suhu Dan PH Air',
        body: 'PH air abnormal: $pHValue\n Suhu air mencapai: $suhuValue °C',
      );
    }
  }
}
