import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            // Welcome Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Hello User,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Align text and icon
                    children: [
                      Text(
                        'Welcome to Astro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.notifications_none,  // Bell icon
                        color: Colors.white,
                        size: 28,  // Adjust the size as needed
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),


            const SizedBox(height: 20),

            // Daily Horoscope Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Horoscope',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'The stars are on your favor, you can’t be horrible. They won’t let you down!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Horoscope Icons Horizontal Scroll
            SizedBox(
              height: 120, // Adjust this based on the height of your horoscope cards
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildHoroscopeCard('assets/leo.png', 'Leo'),
                  const SizedBox(width: 10),
                  _buildHoroscopeCard('assets/virgo.png', 'Virgo'),
                  const SizedBox(width: 10),
                  _buildHoroscopeCard('assets/cancer.png', 'Cancer'),
                  const SizedBox(width: 10),
                  _buildHoroscopeCard('assets/aries.png', 'Aries'),
                  const SizedBox(width: 10),
                  _buildHoroscopeCard('assets/gemeni.png', 'Gemini'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Astro Services Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Astro Services',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Astro Services Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: _buildServiceButton('assets/call.png', 'Call')),
                    const SizedBox(width: 10),
                    Expanded(child: _buildServiceButton('assets/Chat.png', 'Chat')),
                    const SizedBox(width: 10),
                    Expanded(child: _buildServiceButton('assets/Video.png', 'Video')),
                    const SizedBox(width: 10),
                    Expanded(child: _buildServiceButton('assets/detail_report.png', 'Detail Report')),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Recommended Astrologers Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended Astrologers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Horizontal Scroll for Astrologers
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildAstrologerCard('Astro Vivek K', '₹ 30/min', 'assets/Astro_Vivek_K.png'),
                  const SizedBox(width: 10),
                  _buildAstrologerCard('Acharya Anu', '₹ 30/min', 'assets/Acharya_Anu.png'),
                  const SizedBox(width: 10),
                  _buildAstrologerCard('Dharmik B', '₹ 25/min', 'assets/Dharmesh.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Horoscope Card Widget
  Widget _buildHoroscopeCard(String imagePath, String title) {
    return Container(
      height: 200,
      width: 125,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Astro Services Button Widget
  Widget _buildServiceButton(String imagePath, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }


  // Astrologer Card Widget
  Widget _buildAstrologerCard(String name, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 120,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              price,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 3),
            ElevatedButton(
              onPressed: () {
                // Connect action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Connect'),
            ),
          ],
        ),
      ),
    );
  }
}
