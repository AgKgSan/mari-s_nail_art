import 'package:flutter/widgets.dart';
import 'package:mari_nail_art/features/bookings/data/model/booking_model.dart';
import 'package:mari_nail_art/features/bookings/data/model/service_model.dart';
import 'package:mari_nail_art/features/bookings/domain/usecases/booking_usecase.dart';

class BookingProvider extends ChangeNotifier {
  final BookingUsecase bookingUsecase;

  BookingProvider({required this.bookingUsecase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  BookingModel? _bookingModel;
  BookingModel? get bookingModel => _bookingModel;

  List<ServiceModel>? _serviceModel = [];
  List<ServiceModel>? get serviceModel => _serviceModel;

  Future<void> getAllServices() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _serviceModel = await bookingUsecase.getAllServices();
    } catch (e) {
      _errorMessage = e.toString().replaceAll('ServerException:', '').trim();
      _serviceModel = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createBooking({required BookingModel booking}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _bookingModel = await bookingUsecase.createBooking(booking: booking);
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('ServerException:', '').trim();
      _bookingModel = null;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetBookingState() {
    _bookingModel = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }
}
