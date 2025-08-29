import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  bool validateOtp(String otp) {
    if (otp == '123456') {
      return true;
    }
    return false;
  }
}

final repoImplPrvoider = StateProvider<AuthRepository>(
  (ref) => AuthRepositoryImpl(),
);
