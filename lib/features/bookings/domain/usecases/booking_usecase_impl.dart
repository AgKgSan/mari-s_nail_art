import 'package:mari_nail_art/core/error/exceptions.dart';
import 'package:mari_nail_art/features/bookings/data/model/booking_model.dart';
import 'package:mari_nail_art/features/bookings/data/model/service_model.dart';
import 'package:mari_nail_art/features/bookings/domain/repositories/booking_repo.dart';
import 'package:mari_nail_art/features/bookings/domain/usecases/booking_usecase.dart';

class BookingUsecaseImpl implements BookingUsecase {
  final BookingRepository bookingRepository;

  BookingUsecaseImpl({required this.bookingRepository});

  @override
  Future<BookingModel> createBooking({required BookingModel booking}) async {
    try {
      return await bookingRepository.createBooking(booking: booking);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ServiceModel>> getAllServices() async {
    try {
      return await bookingRepository.getAllServices();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
