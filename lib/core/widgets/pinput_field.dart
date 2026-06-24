import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:pinput/pinput.dart';

class PinputField extends StatelessWidget {
  final TextEditingController pinController;

  const PinputField({super.key, required this.pinController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        controller: pinController,
        length: 6,
        keyboardType: TextInputType.number,

        defaultPinTheme: PinTheme(
          width: 55,

          height: 55,

          textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),

          decoration: BoxDecoration(
            border: Border.all(color: AppColors.text2, width: 1.5),

            borderRadius: BorderRadius.circular(12),
          ),
        ),

        focusedPinTheme:
            PinTheme(
              width: 55,

              height: 55,

              textStyle: const TextStyle(
                fontSize: 22,

                fontWeight: FontWeight.w600,
              ),

              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1.5),

                borderRadius: BorderRadius.circular(12),
              ),
            ).copyDecorationWith(
              border: Border.all(color: AppColors.secondary, width: 2),

              borderRadius: BorderRadius.circular(12),
            ),

        submittedPinTheme:
            PinTheme(
              width: 55,

              height: 55,

              textStyle: const TextStyle(
                fontSize: 22,

                fontWeight: FontWeight.w600,
              ),

              decoration: BoxDecoration(
                border: Border.all(color: AppColors.text2, width: 1.5),

                borderRadius: BorderRadius.circular(12),
              ),
            ).copyDecorationWith(
              border: Border.all(color: AppColors.primary, width: 2),

              borderRadius: BorderRadius.circular(12),
            ),

        onCompleted: (pin) {
          print(pin);
        },
      ),
    );
  }
}
