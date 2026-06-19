import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/core/widgets/my_text_field.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/custom_form_field.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/payment_box.dart';

class WalkInForm extends StatefulWidget {
  const WalkInForm({super.key});

  @override
  State<WalkInForm> createState() => _WalkInFormState();
}

class _WalkInFormState extends State<WalkInForm> {
  final dateCtrl = TextEditingController();

  final startCtrl = TextEditingController();

  final endCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final extraAmountCtrl = TextEditingController();
  final noteCtrl = TextEditingController();
  String? selectedValue;
  String? paymentType;

  final List<String> items = [
    "Service 1",

    "Service 2",

    "Service 3",

    "Service 4",
  ];

  void pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime.now(),

      lastDate: DateTime(2100),
    );

    if (date != null) {
      dateCtrl.text =
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

      setState(() {});
    }
  }

  void pickStartTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,

      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      startCtrl.text = time.format(context);

      setState(() {});
    }
  }

  // void pickEndTime() async {
  //   TimeOfDay? time = await showTimePicker(
  //     context: context,

  //     initialTime: TimeOfDay.now(),
  //   );

  //   if (time != null) {
  //     endCtrl.text = time.format(context);

  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),

          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Walk In Form", style: AppFonts.heading2Reg),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Service Name"),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                initialValue: selectedValue,
                decoration: InputDecoration(
                  hintText: "Select Service",

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                borderRadius: BorderRadius.circular(15),
                items: items.map((String item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              SizedBox(height: 20),

              CustomFormField(
                controller: dateCtrl,
                label: "Select Date",
                icon: Icons.calendar_today,
                onTap: pickDate,
                labelText: 'Date',
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      controller: startCtrl,
                      label: "Start Time",
                      icon: Icons.access_time,
                      onTap: pickStartTime,
                      labelText: 'Start Time',
                    ),
                  ),
                  // SizedBox(width: 20),
                  // Expanded(
                  //   child: CustomFormField(
                  //     controller: endCtrl,
                  //     label: "End Time",
                  //     icon: Icons.access_time_filled,
                  //     onTap: pickEndTime,
                  //     labelText: 'End Time',
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 20),
              Text("Amount"),
              SizedBox(height: 20),
              MyTextField(
                controller: amountCtrl,
                hintText: "Enter The  Amount",
                obscureText: false,
              ),
              SizedBox(height: 20),
              Text("Extra Amount"),
              SizedBox(height: 20),
              MyTextField(
                controller: extraAmountCtrl,
                hintText: "Enter The Extra Amount",
                obscureText: false,
              ),
              SizedBox(height: 20),
              Text("Note"),
              SizedBox(height: 20),
              MyTextField(
                controller: noteCtrl,
                hintText: "Enter The Note",
                obscureText: false,
              ),
              // SizedBox(height: 20),
              // Text("Payment Type"),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Type", style: AppFonts.body2),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PaymentBox(
                        title: "Cash",
                        isSelected: paymentType == "Cash",
                        onTap: () {
                          setState(() {
                            (paymentType = "Cash");
                          });
                        },
                      ),
                      PaymentBox(
                        title: "K Pay",
                        isSelected: paymentType == "K Pay",
                        onTap: () {
                          setState(() {
                            paymentType = "K Pay";
                          });
                        },
                      ),
                      PaymentBox(
                        title: "Wave",
                        isSelected: paymentType == "Wave",
                        onTap: () {
                          setState(() {
                            paymentType = "Wave";
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButtons(label: "Submit", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
