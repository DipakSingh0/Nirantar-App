// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nira/features/auth/controllers/logout_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _notificationsEnabled = true;


  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _emailController.text = user.email ?? '';
        _nameController.text = user.displayName ?? '';
        _phoneController.text = user.phoneNumber ?? '';
      });
    }
  }

  void _updateProfile() {
    // Implement logic to update the user's profile in Firebase or your backend
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  void _changePassword() async {
    // Implement logic to change the user's password
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // void _logout() async {
  //   await _auth.signOut();
  //   Navigator.pushReplacementNamed(context, '/login');
  // }

  @override
  Widget build(BuildContext context) {
  final logoutController = LogoutController(context: context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('S E T T I N G S'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                'Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Email should not be editable
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).primaryColor, // Use theme color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12), // Adjust padding
                  textStyle: const TextStyle(fontSize: 16), // Adjust text size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: const Text('Update Profile'),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Preferences',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            const SizedBox(height: 32),
            const Text(
              'Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _changePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Change Password'),
              ),
            ),
            const SizedBox(height: 16),
             SizedBox(
              width: double.infinity,
               child: ElevatedButton(
                onPressed: logoutController.signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Red color for logout button
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Logout'),
                           ),
             ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
