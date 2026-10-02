import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return AppScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.055,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: screenWidth * 0.13,
                backgroundImage: const AssetImage('assets/images/profile.jpg'),
              ),
              SizedBox(height: screenHeight * 0.015),

              // Name
              Text(
                "Annisa AnimeVerse",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),

              // Email
              Text(
                "akhairani@gmail.com",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: screenWidth * 0.035,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              // Badge / Member Status
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.006,
                ),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Member since September 2026",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: screenWidth * 0.03,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Account Settings Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Account Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),

              _buildOptionCard(
                context: context,
                icon: Icons.person_outline,
                title: "Change Username",
                subtitle: "Update your display name",
                onTap: () {},
              ),
              SizedBox(height: screenHeight * 0.012),

              _buildOptionCard(
                context: context,
                icon: Icons.lock_outline,
                title: "Change Password",
                subtitle: "Update your account password",
                onTap: () {},
              ),
              SizedBox(height: screenHeight * 0.025),

              // App Information Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "App Information",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),

              _buildOptionCard(
                context: context,
                icon: Icons.info_outline,
                title: "About AnimeVerse",
                subtitle: "Version 1.0.0",
                onTap: () {},
              ),
              SizedBox(height: screenHeight * 0.035),

              // Tombol Log Out Merah
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    ),
                  ),
                  onPressed: () {
                    // Navigasi kembali ke Sign In
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/signin',
                          (route) => false,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: screenWidth * 0.055,
                      ),
                      SizedBox(width: screenWidth * 0.025),
                      Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pembantu untuk item opsi
  Widget _buildOptionCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B395E).withOpacity(0.5),
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(screenWidth * 0.02),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
          child: Icon(icon, color: Colors.white, size: screenWidth * 0.05),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.038,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.white54,
            fontSize: screenWidth * 0.03,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
          size: screenWidth * 0.04,
        ),
        onTap: onTap,
      ),
    );
  }
}