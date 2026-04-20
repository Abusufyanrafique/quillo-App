import 'package:flutter/material.dart';
import 'package:quillo_app/utils/app_colors.dart';
import 'package:quillo_app/utils/app_images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quillo_app/widgets/splash_screens/get_started_button%20.dart';
class HappyCooking extends StatefulWidget {
  const HappyCooking({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HappyCookingState createState() => _HappyCookingState();
}

class _HappyCookingState extends State<HappyCooking> {

  @override
  void initState() {
    super.initState();

    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => HomeScreen()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashscreenbackground, 
      body: Column(
        children: [
      
          // Logo (optional)
          Image(image: AssetImage(AppImages.aimagic)),
          SizedBox(height: 20),
      
          Text(
            "Happy",
          style: GoogleFonts.poppins(
            fontSize: 42,
           color: AppColors.splashscreenfirsttext,
           fontWeight: FontWeight.w900,
           letterSpacing: -1.2,
  ),
          ),
      
          SizedBox(height: 10),
      
         Center(
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text(
              "Cooking",
            style: GoogleFonts.poppins(
            fontSize: 42,
           color: AppColors.splashscreensecondtext,
           fontWeight: FontWeight.w900,
           letterSpacing: -1.2,
  ),
            ),
           ],),
         ),
      Text("Turn your receipts into\n delicious meals with AI",
       style: GoogleFonts.poppins(
          fontSize: 15,
          color: AppColors.thirdtext,
           fontWeight: FontWeight.w400,
           letterSpacing: -1.2,
  ),
      ),
      SizedBox(height: 10,),
      GetStartedButton(
      imagePath:AppImages.getstarted,
      onTap: () {
    // navigation yahan
      },
),
          SizedBox(height: 30),
      
         RichText(
  text: TextSpan(
    children: [

      TextSpan(
        text: "Already have an account?",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color:AppColors.accounttext,
        ),
      ),

      TextSpan(
        text: "Sign in",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.yellow,
        ),
      ),
    ],
  ),
)
        ],
      ),
    );
  }
}