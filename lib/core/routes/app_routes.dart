import 'package:flutter/material.dart';
import 'package:whisk_and_serve/core/routes/favourites_routes.dart';
import 'package:whisk_and_serve/core/routes/home_routes.dart';
import 'package:whisk_and_serve/core/routes/profile_routes.dart';
import 'package:whisk_and_serve_core/router/nav/navitem.dart';

class AppRoutes {
  static const String explore = '/';
  static const String favourites = '/favourites';
  static const String profile = '/profile';
}

final appRoutes = [
  exploreRoutes,
  favouritesRoutes,
  profileRoutes,
];

/// List of navigation items.
final List<NavItem> navItems = [
  NavItem(
    icon: Icons.explore,
    label: 'Explore',
    route: AppRoutes.explore,
  ),
  NavItem(
    icon: Icons.favorite,
    label: 'Favorites',
    route: AppRoutes.favourites,
  ),
  NavItem(
    icon: Icons.person,
    label: 'Profile',
    route: AppRoutes.profile,
  ),
];
