import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:robot_tambak/config/app_asset.dart';
import 'package:robot_tambak/config/app_color.dart';

import '../controller/c_sensor.dart';

class Home1Page extends StatefulWidget {
  const Home1Page({super.key});

  @override
  State<Home1Page> createState() => _Home1PageState();
}

class _Home1PageState extends State<Home1Page> {
  final CSensor sensorController = Get.put(CSensor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundHome,
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 250,
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
                                  Image.asset(AppAsset.pakan,
                                      width: 100, height: 100),
                                  const Text(
                                    'Pakan',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary),
                                  ),
                                ],
                              ),
                              Obx(
                                () => RotatedBox(
                                  quarterTurns: -1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: LinearPercentIndicator(
                                      width: 220.0,
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 120.0,
                                      percent: sensorController
                                                  .sensorData.value.pakan !=
                                              null
                                          ? (sensorController
                                                  .sensorData.value.pakan! /
                                              100)
                                          : 0.0,
                                      center: Text(
                                        '${sensorController.sensorData.value.pakan} %',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      linearStrokeCap: LinearStrokeCap.butt,
                                      progressColor: AppColor.primary,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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
                                  Image.asset(AppAsset.air,
                                      width: 80, height: 80),
                                  const Text(
                                    'Level Air',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary),
                                  ),
                                ],
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CircularPercentIndicator(
                                    animation: true,
                                    animationDuration: 1000,
                                    radius: 60.0,
                                    lineWidth: 15.0,
                                    percent: sensorController
                                                .sensorData.value.ultrasonic !=
                                            null
                                        ? (sensorController
                                                .sensorData.value.ultrasonic! /
                                            100)
                                        : 0.0,
                                    center: Text(
                                      '${sensorController.sensorData.value.ultrasonic!.toStringAsFixed(2)} %',
                                      style: const TextStyle(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Stack(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AppAsset.ph,
                                        width: 30, height: 30),
                                    const Text(
                                      'Ph Air',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primary),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(
                                () => Padding(
                                  padding:
                                      const EdgeInsets.only(left: 34, top: 70),
                                  child: Text(
                                    '${sensorController.sensorData.value.pH}',
                                    style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(AppAsset.suhu,
                                        width: 30, height: 30),
                                    const Text(
                                      'Suhu Air',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primary),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(
                                () => Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 70),
                                  child: Text(
                                    '${sensorController.sensorData.value.suhu} °C',
                                    style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primary),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
          }),
        ));
  }
}
