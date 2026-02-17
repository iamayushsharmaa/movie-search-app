import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/routes/app_routes.dart';

class WidgetTree extends StatelessWidget {
  final Widget child;

  const WidgetTree({super.key, required this.child});

  static const List<String> _tabs = [
    AppRoutes.home,
    AppRoutes.favourites,
  ];

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState
        .of(context)
        .uri
        .path;

    final index = _tabs.indexWhere(
          (path) => location == path || location.startsWith('$path/'),
    );

    return index == -1 ? 0 : index;
  }

  void _onTabTapped(BuildContext context, int index) {
    if (index < 0 || index >= _tabs.length) return;

    context.go(_tabs[index]);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _getSelectedIndex(context);

    return Scaffold(
      body: child,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => _onTabTapped(context, index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}