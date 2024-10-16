import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

/// A [CustomNavBar] widget that acts as a singleton, 
/// ensuring that only one instance of the navigation bar exists.
/// This is a stateful widget to handle bottom navigation interactions
/// with smooth animations between navigation items.
class CustomNavBar extends StatefulWidget {
  // Singleton instance of CustomNavBar
  static const CustomNavBar _instance = CustomNavBar._internal();

  // Private named constructor to restrict direct instantiation
  const CustomNavBar._internal();

  /// Factory constructor that returns the singleton instance of [CustomNavBar].
  factory CustomNavBar() => _instance;

  @override
  CustomNavBarState createState() => CustomNavBarState();
}

class CustomNavBarState extends State<CustomNavBar> {
  int currentIndex = 0;

  /// List of navigation items that includes icons and labels.
  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.search, 'label': 'Search'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  /// Updates the current selected index and performs navigation
  /// based on the selected item index.
  ///
  /// The navigation logic (commented out) can be customized
  /// according to the navigation system (e.g., GoRouter).
  void onItemTapped(BuildContext context, int index) {
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        // context.go('/home'); // Uncomment and update navigation paths
        break;
      case 1:
        // context.go('/search');
        break;
      case 2:
        // context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        color: Theme.of(context).colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: _navItems.asMap().entries.map((entry) {
              int index = entry.key;
              IconData icon = entry.value['icon'];
              String label = entry.value['label'];

              return _buildNavItem(
                context: context,
                index: index,
                icon: icon,
                label: label,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  /// Builds an individual navigation item for the bottom bar.
  /// The item is rounded, animated, and responds to tap gestures.
  ///
  /// The [isSelected] state determines the appearance and size of the item.
  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required IconData icon,
    required String label,
  }) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        onItemTapped(context, index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isSelected ? 120 : 90,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.black,
              ),
              if (isSelected)
                const SizedBox(width: 8), // Space between icon and label when selected
              if (isSelected)
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A [BaseScaffold] widget that includes a body and the singleton [CustomNavBar]
/// at the bottom. This class acts as a base layout for screens requiring bottom navigation.
class BaseScaffold extends StatelessWidget {
  final Widget child;

  const BaseScaffold({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavBar._instance,
    );
  }
}
