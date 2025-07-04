import 'package:flutter/material.dart';
import 'package:card_crawler/ui/type/game_route.dart';
import 'package:card_crawler/provider/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _navigate(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Card Crawler',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigate to login screen (replace with your actual login screen)
                  Navigator.pushNamed(context, GameRoute.auth.path);
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to register screen (same screen as login but toggled)
                  Navigator.pushNamed(context, GameRoute.auth.path,arguments: false);
                },
                child: const Text('Register'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () async{
                  await context.read<AuthProvider>().playAsGuest();
                  Navigator.pushReplacementNamed(context, GameRoute.mainMenu.path);
                },
                child: const Text('Play as Guest'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}