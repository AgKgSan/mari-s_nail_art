import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Themes & Styles
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';

// Core Reusable Widgets
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/core/widgets/my_text_field.dart';

// Features / Bookings
import 'package:mari_nail_art/features/bookings/data/model/booking_model.dart';
import 'package:mari_nail_art/features/bookings/data/model/service_model.dart';
import 'package:mari_nail_art/features/bookings/presentation/providers/booking_provider.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/custom_form_field.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/drop_down_widget.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/payment_box.dart';

class WalkInForm extends StatefulWidget {
  const WalkInForm({super.key});

  @override
  State<WalkInForm> createState() => _WalkInFormState();
}

class _WalkInFormState extends State<WalkInForm> {
  final _formKey = GlobalKey<FormState>();

  // Text Field Controllers
  final dateCtrl = TextEditingController();
  final startCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final extraAmountCtrl = TextEditingController();
  final noteCtrl = TextEditingController();

  // Selected State Form Values
  ServiceModel? selectedService;
  String? paymentType;

  @override
  void initState() {
    super.initState();
    // Fetch live services right when this screen launches
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookingProvider>().getAllServices();
    });
  }

  @override
  void dispose() {
    dateCtrl.dispose();
    startCtrl.dispose();
    amountCtrl.dispose();
    extraAmountCtrl.dispose();
    noteCtrl.dispose();
    super.dispose();
  }

  void pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      dateCtrl.text = DateFormat('yyyy-MM-dd').format(date);
      setState(() {});
    }
  }

  void pickStartTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      if (!mounted) return;
      startCtrl.text = time.format(context);
      setState(() {});
    }
  }

  void _submitForm() async {
    // 1. Text Fields Validation
    if (!_formKey.currentState!.validate()) return;

    // 2. Dropdown & Payment Selection Checks
    if (selectedService == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select a service")));
      return;
    }

    if (paymentType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please choose a payment method")),
      );
      return;
    }

    try {
      final int serviceId = selectedService!.id;

      // 3. Normalize Date & Time to UTC ISO Format
      final String rawDateText = dateCtrl.text.trim();
      final String rawTimeText = startCtrl.text.trim();

      DateTime localParsed = DateFormat(
        "yyyy-MM-dd hh:mm a",
      ).parse("$rawDateText $rawTimeText");
      DateTime utcDateTime = localParsed.toUtc();

      // Target Format: 2026-06-26T02:30:00Z
      final String isoBookingDate =
          utcDateTime.toIso8601String().split('.').first + 'Z';

      // 4. Safely handle optional numbers and strings
      final double? extraAmount = extraAmountCtrl.text.trim().isEmpty
          ? null
          : double.tryParse(extraAmountCtrl.text.trim());

      final String? notes = noteCtrl.text.trim().isEmpty
          ? null
          : noteCtrl.text.trim();

      final bookingProvider = context.read<BookingProvider>();

      // 5. Send payload to your booking service block
      final isSuccess = await bookingProvider.createBooking(
        booking: BookingModel(
          serviceId: serviceId,
          bookingDate: isoBookingDate,
          amount: double.tryParse(amountCtrl.text.trim()) ?? 0.0,
          paymentType: paymentType!.toUpperCase().replaceAll(" ", "_"),
          notes: notes ?? "",
          extraAmount: extraAmount ?? 0.0,
          id: 1,
          customeId: 1,
          customerName: '',
          customerPhone: '',
          serviceName: selectedService!.name,
          status: 'PENDING',
          createdByCustomerOrStaffName: '',
          createdAt: '',
          cancelledBy: '',
        ),
      );

      if (!mounted) return;

      if (isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Booking created successfully!")),
        );
        context.pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(bookingProvider.errorMessage ?? "An error occurred"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error parsing form parameters: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watches provider properties changes to dynamically render loaders or errors
    final providerState = context.watch<BookingProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text("Walk In Form", style: AppFonts.heading2Reg),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Service Name"),
                    const SizedBox(height: 10),

                    // Dynamic Service Selector Widget
                    DropDownWidget(
                      selectedService: selectedService,
                      onChanged: (ServiceModel? newValue) {
                        setState(() {
                          selectedService = newValue;
                          if (newValue != null) {
                            // Autofill regular base price to amount text field dynamically
                            amountCtrl.text = newValue.price.toString();
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    CustomFormField(
                      controller: dateCtrl,
                      label: "Select Date",
                      icon: Icons.calendar_today,
                      onTap: pickDate,
                      labelText: 'Date',
                    ),
                    const SizedBox(height: 20),

                    CustomFormField(
                      controller: startCtrl,
                      label: "Start Time",
                      icon: Icons.access_time,
                      onTap: pickStartTime,
                      labelText: 'Start Time',
                    ),
                    const SizedBox(height: 20),

                    const Text("Amount"),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: amountCtrl,
                      hintText: "Enter The Amount",
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),

                    const Text("Extra Amount"),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: extraAmountCtrl,
                      hintText: "Enter The Extra Amount (Optional)",
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),

                    const Text("Note"),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: noteCtrl,
                      hintText: "Enter The Note (Optional)",
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Payment Type", style: AppFonts.body2),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PaymentBox(
                              title: "Cash",
                              isSelected: paymentType == "Cash",
                              onTap: () => setState(() => paymentType = "Cash"),
                            ),
                            PaymentBox(
                              title: "K Pay",
                              isSelected: paymentType == "K Pay",
                              onTap: () =>
                                  setState(() => paymentType = "K Pay"),
                            ),
                            PaymentBox(
                              title: "Wave",
                              isSelected: paymentType == "Wave",
                              onTap: () => setState(() => paymentType = "Wave"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    ElevatedButtons(
                      label: "Submit",
                      onPressed: providerState.isLoading ? () {} : _submitForm,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Full-screen overlay loading screen during form submissions
          if (providerState.isLoading &&
              (providerState.serviceModel ?? []).isNotEmpty)
            Container(
              color: Colors.black.withOpacity(0.25),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
