class PhoneModel {
  String? batteryPower;
  String? cameraResolution;
  String? frontCamera;
  String? imageBlack;
  String? imageBlue;
  String? imageWhite;
  String? internalMemory;
  String? name;
  double? prI;
  String? price;
  String? ramCapacity;
  String? screenSize;

  PhoneModel(
      {this.batteryPower,
      this.cameraResolution,
      this.frontCamera,
      this.imageBlack,
      this.imageBlue,
      this.imageWhite,
      this.internalMemory,
      this.name,
      this.prI,
      this.price,
      this.ramCapacity,
      this.screenSize});

  PhoneModel.fromJson(Map<String, dynamic> json) {
    batteryPower = json['battery_power'];
    cameraResolution = json['camera_resolution'];
    frontCamera = json['front_camera'];
    imageBlack = json['image_black'];
    imageBlue = json['image_blue'];
    imageWhite = json['image_white'];
    internalMemory = json['internal_memory'];
    name = json['name'];
    prI = json['pr_i'];
    price = json['price '];
    ramCapacity = json['ram_capacity'];
    screenSize = json['screen_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['battery_power'] = batteryPower;
    data['camera_resolution'] = cameraResolution;
    data['front_camera'] = frontCamera;
    data['image_black'] = imageBlack;
    data['image_blue'] = imageBlue;
    data['image_white'] = imageWhite;
    data['internal_memory'] = internalMemory;
    data['name'] = name;
    data['pr_i'] = prI;
    data['price '] = price;
    data['ram_capacity'] = ramCapacity;
    data['screen_size'] = screenSize;
    return data;
  }
}
