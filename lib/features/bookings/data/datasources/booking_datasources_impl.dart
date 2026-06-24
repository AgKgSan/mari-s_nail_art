import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mari_nail_art/core/configs/app_configs.dart';
import 'package:mari_nail_art/core/error/exceptions.dart';
import 'package:mari_nail_art/features/bookings/data/datasources/booking_datasources.dart';
import 'package:mari_nail_art/features/bookings/data/model/booking_model.dart';
import 'package:mari_nail_art/features/bookings/data/model/service_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingDatasourceImpl implements BookingDatasource {
  final http.Client client;
  final SharedPreferences pref;

  BookingDatasourceImpl({required this.client, required this.pref});

  @override
  Future<List<ServiceModel>> getAllServices() async {
    try {
      final accessToken = pref.getString('accessToken');
      final response = await client.get(
        Uri.parse(AppConfigs.getServices),
        headers: {
          'Content-Type': 'application/json',
          if (accessToken != null) 'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final jsonList = json.decode(response.body) as List<dynamic>;
        return jsonList
            .map((data) => ServiceModel.fromMap(data as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException(
          'Server returned status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<BookingModel> createBooking({required BookingModel booking}) async {
    {
      try {
        log(booking.id.toString());
        final accessToken = pref.getString('accessToken');

        final response = await client.post(
          Uri.parse(AppConfigs.walkIn),
          headers: {
            'Content-Type': 'application/json',
            if (accessToken != null) 'Authorization': 'Bearer $accessToken',
          },
          body: jsonEncode({
            'serviceId': booking.serviceId,
            'bookingDate': booking.bookingDate,
            'amount': booking.amount,
            'extraAmount': booking.extraAmount,
            'paymentType': booking.paymentType,
            'notes': booking.notes,
          }),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          final Map<String, dynamic> jsonMap =
              jsonDecode(response.body) as Map<String, dynamic>;

          return BookingModel.fromMap(jsonMap);
        } else {
          throw ServerException(
            'Server returned status code ${response.statusCode}',
          );
        }
      } catch (e) {
        throw ServerException(e.toString());
      }
    }
  }
}
