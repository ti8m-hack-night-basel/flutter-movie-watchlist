import 'package:flutter/material.dart';

class BmdbAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showsFavorites;
  final VoidCallback? onFavoritesTapped;
  final VoidCallback? onTrendingTapped;

  const BmdbAppBar({super.key, required this.title, required this.showsFavorites, this.onFavoritesTapped, this.onTrendingTapped});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: true,
      actions: [
        if (showsFavorites)
          TextButton(
            onPressed: onTrendingTapped,
            child: Text("Trending"),
          ),
        if (showsFavorites)
          TextButton(
            onPressed: onFavoritesTapped,
            child: Text("Favoriten"),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
