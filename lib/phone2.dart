import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String verify = "";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedCode = '+91'; // Default value
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.text = _selectedCode; // Initialize with default value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top half for the image
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/login_image.png', // Replace with your asset image
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // Welcome Text
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hi Welcome!',
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
                        'Submit your Mobile number',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Login divider
                    const Row(
                      children: [
                        Expanded(child: Divider(thickness: 1, color: Colors.white)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("Log in or Sign up", style: TextStyle(color: Colors.white)),
                        ),
                        Expanded(child: Divider(thickness: 1, color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Mobile Number Input Field
                    Row(
                      children: [
                        // Phone Number Input Field
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 55, // Same height as the Send OTP button
                            child: TextFormField(
                              controller: _mobileController,
                              decoration: InputDecoration(
                                filled: true, // Enables the background color
                                fillColor: Colors.white,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: DropdownButton<String>(
                                    value: _selectedCode,
                                    underline: const SizedBox(),
                                    items: const [
                                      DropdownMenuItem<String>(
                                        value: '+1',
                                        child: Text('+1'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: '+91',
                                        child: Text('+91'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: '+44',
                                        child: Text('+44'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedCode = value!;
                                        _phoneController.text = _selectedCode; // Update text field
                                      });
                                    },
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Enter Mobile number',
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Send OTP Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async{
                          // Concatenate the country code and mobile number
                          final fullNumber = _selectedCode + _mobileController.text;
                          // Handle OTP Send logic with fullNumber
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                timeout: const Duration(minutes:2),
                              phoneNumber: '${_selectedCode + _mobileController.text}',
                              verificationCompleted: (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent: (String verificationId, int? resendToken) {
                                  LoginScreen.verify = verificationId;
                                  // Navigator.pushNamed(context,"otp");
                              },
                              codeAutoRetrievalTimeout: (String verificationId) {},

                          );
                          Navigator.pushNamed(context,"otp");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child: const Text('SEND OTP'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Or Divider
                    const Row(
                      children: [
                        Expanded(child: Divider(thickness: 1, color: Colors.white)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("Or", style: TextStyle(color: Colors.white)),
                        ),
                        Expanded(child: Divider(thickness: 1, color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Continue with Email Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.email_outlined, color: Colors.white),
                        label: const Text(
                          'Continue with Email Id',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: (){
                          // Handle Email login logic
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Terms and Privacy Policy
                    Text.rich(
                      TextSpan(
                        text: 'By signing up, you agree to our ',
                        style: const TextStyle(fontSize: 12, color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Terms of Use',
                            style: TextStyle(color: Colors.yellow[700]),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.yellow[700]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
