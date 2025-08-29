import 'package:food_delivery_app/domain/usecases/auth_usecase.dart';
import 'package:food_delivery_app/presentation/login/providers/otp_states.dart';
import 'package:riverpod/riverpod.dart';

class OtpNotifier extends StateNotifier<OtpState> {
  final AuthUsecase authUsecase;
  OtpNotifier(this.authUsecase) : super(LoadingOtp()) {
    loadOtp();
  }

  Future<void> loadOtp() async {
    await Future.delayed(Duration(seconds: 2));
    state = LoadedOtp();
  }

  bool checkOtp(String otp) {
    final isValid = authUsecase(otp);

    return isValid;
  }
}

final otpProvider = StateNotifierProvider<OtpNotifier, OtpState>((ref) {
  final authUsecase = ref.watch(authUseCaseProvider);
  return OtpNotifier(authUsecase);
});

final otpValueProvider = StateProvider<String>((ref) => '');
