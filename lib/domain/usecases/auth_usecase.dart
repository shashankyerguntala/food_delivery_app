import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/data/repository_impl/auth_repo_impl.dart';
import 'package:food_delivery_app/domain/repository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository repo;

  AuthUsecase(this.repo);

  bool call(String otp) {
    return repo.validateOtp(otp);
  }
}

final authUseCaseProvider = Provider<AuthUsecase>((ref) {
  final repo = ref.read(authRepoImplPrvoider);
  return AuthUsecase(repo);
});
