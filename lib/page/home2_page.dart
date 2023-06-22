import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:robot_tambak/config/app_asset.dart';
import 'package:robot_tambak/model/sensor.dart';

import '../config/app_color.dart';
import '../controller/c_sensor.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({super.key});

  @override
  State<Home2Page> createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  final CSensor sensorController = Get.put(CSensor());
  final CSensor sensorC = Get.find();
  TextEditingController ketinggianAir = TextEditingController();
  TextEditingController setJam = TextEditingController();
  TextEditingController setMenit = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final sensor_ = Sensor();

  submitform(String field) {
    int? value = int.tryParse(ketinggianAir.text);
    sensorC.updateSensor(field, value);
    ketinggianAir.clear();
  }

  submitform2() {
    int? value = int.tryParse(setJam.text);
    int? value2 = int.tryParse(setMenit.text);
    Map<String, dynamic> data = {
      'Set_Jam': value,
      'Set_Menit': value2,
    };
    sensorC.updateSensor2(data);

    setJam.clear();
    setMenit.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundHome,
        body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Container(
                  child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 180,
                        decoration: const BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                      ),
                      Column(
                        children: [
                          Image.asset(AppAsset.logo, width: 63, height: 57),
                          const Text('Robot Tambak',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const Text(
                            'Pantau perkembangan tambak anda hanya dengan satu genggaman saja',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppAsset.baterai,
                                    width: 60, height: 60),
                                const Text(
                                  'Baterai',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primary),
                                ),
                              ],
                            ),
                            Obx(
                              () => Padding(
                                padding: EdgeInsets.all(15.0),
                                child: CircularPercentIndicator(
                                  animation: true,
                                  animationDuration: 1000,
                                  radius: 60.0,
                                  lineWidth: 15.0,
                                  percent: sensorController
                                              .sensorData.value.baterai !=
                                          null
                                      ? (sensorController
                                              .sensorData.value.baterai! /
                                          100)
                                      : 0.0,
                                  center: Text(
                                    '${sensorController.sensorData.value.baterai} %',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary),
                                  ),
                                  progressColor: AppColor.primary,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 220,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  Image.asset(AppAsset.air,
                                      width: 80, height: 80),
                                  Text(
                                    '${sensorController.sensorData.value.setAir} %',
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Form(
                            key: formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text('Set Ketinggian Air',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primary)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: ketinggianAir,
                                    onSaved: (value) => sensorC.sensorData.value
                                        .setAir = int.parse(value!),
                                    validator: (value) =>
                                        value == '' ? "Don't empty" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.water),
                                      filled: true,
                                      fillColor: Colors.white,
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 16),
                                      hintText: 'Set Ketinggian Air',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: AppColor.secondary)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          fixedSize:
                                              MaterialStateProperty.all<Size>(
                                                  const Size(250, 50)),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColor.primary)),
                                      onPressed: () {
                                        submitform('Set_Air');
                                      },
                                      child: const Text(
                                        'Set',
                                        style: TextStyle(fontSize: 24),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 260,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 10),
                              child: Column(
                                children: [
                                  Image.asset(AppAsset.waktu,
                                      width: 60, height: 60),
                                  Text(
                                    '${sensorController.sensorData.value.setJam} Jam',
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary),
                                  ),
                                  Text(
                                    '${sensorController.sensorData.value.setMenit} Menit',
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('Set Waktu Pakan',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: TextFormField(
                                  controller: setJam,
                                  keyboardType: TextInputType.number,
                                  validator: (value) =>
                                      value == '' ? "Don't empty" : null,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.timelapse),
                                    filled: true,
                                    fillColor: Colors.white,
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    hintText: 'Set Jam',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: AppColor.secondary)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: TextFormField(
                                  controller: setMenit,
                                  keyboardType: TextInputType.number,
                                  validator: (value) =>
                                      value == '' ? "Don't empty" : null,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.timelapse),
                                    filled: true,
                                    fillColor: Colors.white,
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    hintText: 'Set Menit',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: AppColor.secondary)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                                const Size(250, 50)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColor.primary)),
                                    onPressed: () {
                                      submitform2();
                                    },
                                    child: const Text(
                                      'Set',
                                      style: TextStyle(fontSize: 24),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          );
        })));
  }
}
