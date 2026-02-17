import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesearch/core/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Search",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  context.push(AppRoutes.search);
                },
                child: Container(
                  height: 58,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.lightBlue),
                      SizedBox(width: 10),
                      Text(
                        'Search for your favorite movies',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
