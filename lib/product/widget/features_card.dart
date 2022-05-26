import 'package:flutter/material.dart';
import 'package:phone_shop_app/model/phone_model.dart';
import 'package:phone_shop_app/product/constant/text_style_items.dart';

class FeaturesCard extends StatelessWidget {
  const FeaturesCard({
    Key? key,
    required this.resources,
  }) : super(key: key);

  final List<PhoneModel> resources;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        featuresText(text: 'Dahili Hafıza : ${resources.first.internalMemory}'),
        featuresText(text: 'Ekran Boyutu : ${resources.first.screenSize}'),
        featuresText(text: 'Pil Gücü : ${resources.first.batteryPower}'),
        featuresText(text: 'Ram Kapasitesi : ${resources.first.ramCapacity}'),
        featuresText(text: 'Ön (Selfie) Kamera :${resources.first.frontCamera}'),
        featuresText(text: 'Kamera Çözünürlüğü :${resources.first.cameraResolution}'),
      ],
    );
  }

//'Dahili Hafıza : ${resources.first.internalMemory}'
  Text featuresText({required String text}) {
    return Text(
      text,
      style: kfeatureText,
    );
  }
}
