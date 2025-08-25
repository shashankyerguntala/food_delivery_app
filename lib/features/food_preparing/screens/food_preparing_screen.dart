import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/food_preparing/widgets/floating_button_track.dart';

import 'package:food_delivery_app/features/home/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PreparingFoodScreen extends StatelessWidget {
  const PreparingFoodScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset("lib/assets/chef.png"),
              SizedBox(height: 10),
              Text(
                "Chef is preparing your food...",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(31, 25, 112, 1),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 200,
                child: Text(
                  "Please do some streaching until chef is cooking your food..",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(31, 25, 112, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButtonTrack(
        onOrderTap: () {
          Navigator.pop(context);
        },
        onHomeTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
