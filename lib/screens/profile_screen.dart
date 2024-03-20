import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileScreen> {
  bool _isLoggedIn = false;
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: _isLoggedIn ? _buildLoggedInProfile() : _buildLoggedOutProfile(),
    );
  }

  Widget _buildLoggedInProfile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, ${_usernameController.text}!'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _handleLogout,
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildLoggedOutProfile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _showLoginScreen,
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: _showCreateAccountScreen,
            child: const Text('Create Account'),
          ),
        ],
      ),
    );
  }

  void _showLoginScreen() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoggedIn = true;
                  });
                  Navigator.pop(context);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCreateAccountScreen() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoggedIn = true;
                  });
                  Navigator.pop(context);
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleLogout() {
    setState(() {
      _isLoggedIn = false;
      _usernameController.clear();
    });
  }
}
