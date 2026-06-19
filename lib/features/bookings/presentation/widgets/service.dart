import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';

class Service extends StatelessWidget {
  final String shopData;
  final String serviceData;
  const Service({super.key, required this.shopData, required this.serviceData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  shopData,
                  style: AppFonts.body2,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  serviceData,
                  style: AppFonts.text2,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
