import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_delivery_app/presentation/login/providers/otp_notifier.dart';
import 'package:food_delivery_app/presentation/login/providers/otp_states.dart';
import 'package:food_delivery_app/presentation/login/widgets/otp_bottom_section.dart';
import 'package:food_delivery_app/presentation/login/widgets/otp_box.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final List<TextEditingController> otpControllers = List.generate(
    6,

    (context) => TextEditingController(),
  );

  String getOtp() {
    return otpControllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(otpProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: state is LoadingOtp
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(29.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter OTP',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      6,
                      (i) => OtpBox(
                        otpController: otpControllers[i],
                        onChanged: (_) {
                          final otp = getOtp().trim();
                          ref.read(otpValueProvider.notifier).state = otp;
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 500),

                  OtpBottomSection(),
                ],
              ),
            ),
    );
  }
}
