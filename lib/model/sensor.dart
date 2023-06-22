class Sensor {
  int? baterai;
  int? pakan;
  int? setAir;
  int? setJam;
  int? setMenit;
  double? suhu;
  int? ultrasonic;
  double? pH;

  Sensor({
    this.baterai,
    this.pakan,
    this.setAir,
    this.setJam,
    this.setMenit,
    this.suhu,
    this.ultrasonic,
    this.pH,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        baterai: json["Baterai"],
        pakan: json["Pakan"],
        setAir: json["Set_Air"],
        setJam: json["Set_Jam"],
        setMenit: json["Set_Menit"],
        suhu: json["Suhu"]?.toDouble(),
        ultrasonic: json["Ultrasonic"],
        pH: json["pH"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Baterai": baterai,
        "Pakan": pakan,
        "Set_Air": setAir,
        "Set_Jam": setJam,
        "Set_Menit": setMenit,
        "Suhu": suhu,
        "Ultrasonic": ultrasonic,
        "pH": pH,
      };
}
