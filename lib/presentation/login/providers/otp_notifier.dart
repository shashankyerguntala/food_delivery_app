import 'package:food_delivery_app/presentation/login/providers/otp_states.dart';
import 'package:riverpod/riverpod.dart';

class OtpNotifier extends StateNotifier<OtpState> {
  OtpNotifier() : super(LoadingOtp()) {
    loadOtp();
  }

  Future<void> loadOtp() async {
    await Future.delayed(Duration(seconds: 2));
    state = LoadedOtp();
  }

  bool validateOtp(String s) {
    if (s == '123456') {
      return true;
    }
    return false;
  }
}

final otpProvider = StateNotifierProvider<OtpNotifier, OtpState>(
  (ref) => OtpNotifier(),
);

final otpValueProvider = StateProvider<String>((ref) => '');
