import 'package:ezpedal/phone2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(234, 239, 243, 1),
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 7),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = "";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top half for the image
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/otp_image.png', // Replace with your asset image
                fit: BoxFit.cover, // Make the image cover the top half
              ),
            ),

            // Bottom half for the form with red background
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffe2363d), // Background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0), // Curved top-left corner
                  topRight: Radius.circular(30.0), // Curved top-right corner
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // Welcome Text
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'OTP Verification',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'A 4 digit code has been sent to your number',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //Timer
                    const SizedBox(height: 10),
                    // OTP input Field
                    Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      validator: (s) {
                        return s == '2222' ? null : 'Pin is incorrect';
                      },
                      pinputAutovalidateMode:
                      PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onChanged: (value) {
                        code = value;
                      },
                      onCompleted: (pin) => print(pin),
                    ),
                    const SizedBox(height: 20),
                    // Verify OTP Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            // Handle OTP Verification logic
                            // PhoneAuthCredential credential =
                            // PhoneAuthProvider.credential(
                            //     verificationId: LoginScreen.verify,
                            //     smsCode: code);
                            // await auth.signInWithCredential(credential);

                            // Navigate to success screen
                            Navigator.pushNamed(context, "success");

                            // Wait for 5 seconds before navigating to the home page
                            Future.delayed(const Duration(seconds: 5), () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "home", (route) => false);
                            });
                          } catch (e) {
                            // Handle errors here (e.g., show error message)
                            print("Error: $e");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child: const Text('VERIFY OTP'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Did not receive OTP
                    Text.rich(
                      TextSpan(
                        text: "If you didn't receive OTP! ",
                        style: const TextStyle(
                            fontSize: 12, color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Resend?',
                            style: TextStyle(color: Colors.yellow[700]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Change Mobile number button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        icon: const Icon(
                            Icons.smartphone, color: Colors.white),
                        label: const Text(
                          'Change Mobile Number',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // Handle Change Mobile number logic
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'phone', (route) => false);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
