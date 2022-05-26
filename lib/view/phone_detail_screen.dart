import 'package:flutter/material.dart';
import 'package:phone_shop_app/model/color_model.dart';
import 'package:phone_shop_app/model/phone_model.dart';
import 'package:phone_shop_app/product/constant/padding_items.dart';
import 'package:phone_shop_app/product/constant/project_items.dart';
import 'package:phone_shop_app/product/constant/text_style_items.dart';
import 'package:phone_shop_app/product/widget/color_change.dart';
import 'package:phone_shop_app/product/widget/counter_card.dart';
import 'package:phone_shop_app/product/widget/features_card.dart';

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
                    children: colorList
                        .map((Color color) => ColorChange(
                              color: color,
                            ))
                        .toList()),
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
