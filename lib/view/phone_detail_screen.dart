import 'package:flutter/material.dart';
import 'package:phone_shop_app/model/phone_model.dart';
import 'package:phone_shop_app/product/constant/padding_items.dart';
import 'package:phone_shop_app/product/constant/project_items.dart';
import 'package:phone_shop_app/product/constant/text_style_items.dart';
import 'package:phone_shop_app/product/widget/color_change.dart';

class PhoneDetailScreenView extends StatefulWidget {
  final List<PhoneModel> path;
  const PhoneDetailScreenView({Key? key, required this.path}) : super(key: key);
  @override
  State<PhoneDetailScreenView> createState() => _PhoneDetailScreenViewState();
}

class _PhoneDetailScreenViewState extends State<PhoneDetailScreenView> {
  List<PhoneModel> resources = [];

  @override
  void initState() {
    super.initState();

    resources = widget.path;
  }

  @override
  Widget build(BuildContext context) {
    Color changeBlack = const Color.fromARGB(255, 25, 25, 25);
    Color changeBlue = const Color.fromARGB(255, 57, 131, 192);
    Color changeWhite = const Color.fromARGB(255, 237, 237, 237);
    double containerSize = 0.82;
    double imageSize = 0.35;

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(ProjectItems.projectName),
      ),
      body: Column(
        children: [
          Container(
            height: screenSize.height * containerSize,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(17)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: PaddindUtility().paddingGeneral,
                  child: SizedBox(
                    height: screenSize.height * imageSize,
                    child: Image.network(resources.first.imageBlue.toString()),
                  ),
                ),
                Center(
                  child: Text(
                    resources.first.name.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorChange(color: changeBlack),
                    ColorChange(color: changeBlue),
                    ColorChange(color: changeWhite),
                  ],
                ),
                Padding(
                  padding: PaddindUtility().paddingText,
                  child: FeaturesCard(resources: resources),
                ),
                const CounterCard()
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: PaddindUtility().paddingText,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Satın Al', style: kdeatilsText),
                Text('${resources.first.prI.toString()} TL', style: kdeatilsText),
              ]),
            ),
          )
        ],
      ),
    );
  }
}

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

class CounterCard extends StatefulWidget {
  const CounterCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  int _counter = 0;

  void _addCounter() {
    setState(() {
      _counter++;
    });
  }

  void _removeCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddindUtility().paddingCounterButton,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          counterElevatedButton(
              icon: Icons.add,
              onPress: () {
                _addCounter();
              }),
          Padding(
            padding: PaddindUtility().paddingGeneral,
            child: Text(
              '$_counter',
              style: kfeatureText,
            ),
          ),
          counterElevatedButton(
              icon: Icons.remove,
              onPress: () {
                _removeCounter();
              }),
        ],
      ),
    );
  }

  SizedBox counterElevatedButton({required IconData icon, required Function() onPress}) {
    return SizedBox(
      height: 40,
      width: 50,
      child: ElevatedButton(onPressed: onPress, child: Icon(icon)),
    );
  }
}
