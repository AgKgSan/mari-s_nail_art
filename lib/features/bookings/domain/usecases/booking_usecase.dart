import 'package:mari_nail_art/features/bookings/data/model/booking_model.dart';
import 'package:mari_nail_art/features/bookings/data/model/service_model.dart';

abstract interface class BookingUsecase {
  Future<BookingModel> createBooking({required BookingModel booking});
  Future<List<ServiceModel>> getAllServices();
}
