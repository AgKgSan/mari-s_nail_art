import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/features/bookings/data/model/service_model.dart';
import 'package:mari_nail_art/features/bookings/presentation/providers/booking_provider.dart';
import 'package:provider/provider.dart';

class DropDownWidget extends StatelessWidget {
  final ServiceModel? selectedService;
  final ValueChanged<ServiceModel?> onChanged;

  const DropDownWidget({
    super.key,
    required this.selectedService,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Watches the provider that was kicked off by WalkInForm's initState
    final provider = context.watch<BookingProvider>();
    final dynamicServices = provider.serviceModel ?? [];

    if (provider.isLoading && dynamicServices.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null && dynamicServices.isEmpty) {
      return Text(
        "Error loading services: ${provider.errorMessage}",
        style: const TextStyle(color: Colors.red),
      );
    }

    return DropdownButtonFormField<ServiceModel>(
      value: selectedService,
      decoration: InputDecoration(
        hintText: "Select Service",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
      borderRadius: BorderRadius.circular(15),
      items: dynamicServices.map((ServiceModel service) {
        return DropdownMenuItem<ServiceModel>(
          value: service,
          child: Text(service.name),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
