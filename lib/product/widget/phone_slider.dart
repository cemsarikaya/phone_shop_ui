import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phone_shop_app/image_model.dart';

class PhoneSlider extends StatelessWidget {
  const PhoneSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: imageList
          .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Center(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        e,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
