import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mari_nail_art/features/auth/data/datasources/auth_datasource_impl.dart';
import 'package:mari_nail_art/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:mari_nail_art/features/auth/domain/usecases/auth_usecase_impl.dart';
import 'package:mari_nail_art/features/auth/presentation/provider/auth_provider.dart';
import 'package:mari_nail_art/features/bookings/data/datasources/booking_datasources_impl.dart';
import 'package:mari_nail_art/features/bookings/data/repositories/booking_repo_impl.dart';
import 'package:mari_nail_art/features/bookings/domain/usecases/booking_usecase_impl.dart';
import 'package:mari_nail_art/features/bookings/presentation/providers/booking_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

MultiProvider initApp({
  required http.Client httpClient,
  required SharedPreferences sharedPreferences,
  required Builder app,
}) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (_) {
          final remoteDatasourceImpl = AuthDatasourceImpl(
            client: httpClient,
            pref: sharedPreferences,
          );
          final repositoryImpl = AuthRepoImpl(
            authDatasource: remoteDatasourceImpl,
          );

          final usecaseImpl = AuthUsecaseImpl(authRepository: repositoryImpl);

          return AuthProvider(authUsecase: usecaseImpl);
        },
      ),
      ChangeNotifierProvider<BookingProvider>(
        create: (_) {
          final remoteDatasourceImpl = BookingDatasourceImpl(
            client: httpClient,
            pref: sharedPreferences,
          );
          final repositoryImpl = BookingRepoImpl(
            bookingDatasource: remoteDatasourceImpl,
          );

          final usecaseImpl = BookingUsecaseImpl(
            bookingRepository: repositoryImpl,
          );

          return BookingProvider(bookingUsecase: usecaseImpl);
        },
      ),
    ],
    child: app,
  );
}
