import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:food_delivery_app/presentation/login/screen/otp_screen.dart';

class NumberForm extends StatelessWidget {
  const NumberForm({super.key});

  @override
  Widget build(BuildContext context) {
    final numberController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Image(image: AssetImage('lib/assets/india.png')),
                const SizedBox(width: 6),

                const Icon(Icons.arrow_drop_down, size: 20, color: Colors.grey),

                const SizedBox(width: 6),

                const Text(
                  "+91",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(width: 8),

                Container(height: 20, width: 1, color: Colors.grey.shade300),

                const SizedBox(width: 8),

                Expanded(
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,

                    controller: numberController,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 12),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: GestureDetector(
            onTap: () {
              if (numberController.text.length > 10 ||
                  numberController.text.length < 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Enter 10 Digit number !')),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtpScreen()),
                );
              }
            },
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
