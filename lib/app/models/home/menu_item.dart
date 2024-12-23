import 'dart:ui';

class MenuItem {
  final String title;
  final String description;
  final String imageUrl;
  final int userCount;
  final Color backgroundColor;
  final Color iconBackgroundColor;

  MenuItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userCount,
    required this.backgroundColor,
    required this.iconBackgroundColor,
  });
}
