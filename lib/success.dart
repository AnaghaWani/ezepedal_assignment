import 'package:flutter/material.dart';

class SuccessfulLogin extends StatefulWidget {
  const SuccessfulLogin({super.key});

  @override
  State<SuccessfulLogin> createState() => _SuccessfulLoginState();
}

class _SuccessfulLoginState extends State<SuccessfulLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0), // Set top margin (in this case, 40 pixels)
                child: Image.asset(
                  'assets/pana.png',
                ),
              ),
            ),
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red[600],
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Mobile verification has successfully done',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
