import 'package:flutter/material.dart';
import 'package:phone_shop_app/product/constant/padding_items.dart';
import 'package:phone_shop_app/product/constant/text_style_items.dart';

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
      if (_counter != 0) {
        _counter--;
      }
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
