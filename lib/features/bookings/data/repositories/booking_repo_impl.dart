import 'package:mari_nail_art/core/error/exceptions.dart';
import 'package:mari_nail_art/features/bookings/data/datasources/booking_datasources.dart';
import 'package:mari_nail_art/features/bookings/data/model/booking_model.dart';
import 'package:mari_nail_art/features/bookings/data/model/service_model.dart';
import 'package:mari_nail_art/features/bookings/domain/repositories/booking_repo.dart';

class BookingRepoImpl implements BookingRepository {
  final BookingDatasource bookingDatasource;

  BookingRepoImpl({required this.bookingDatasource});

  @override
  Future<BookingModel> createBooking({required BookingModel booking}) async {
    try {
      final result = await bookingDatasource.createBooking(booking: booking);
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ServiceModel>> getAllServices() async {
    try {
      final result = await bookingDatasource.getAllServices();
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
