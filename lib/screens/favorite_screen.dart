import 'package:anime_verse/widgets/app_scaffold.dart';
import 'package:anime_verse/data/dummy_data.dart';
import 'package:flutter/material.dart';

import '../widgets/favorite_anime_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Filter daftar anime yang terdaftar sebagai favorit DAN sesuai dengan query pencarian
    final favoriteList = DummyData.animeList.where((anime) {
      final matchesSearch = anime.title
          .toLowerCase()
          .contains(_searchController.text.toLowerCase());
      final isFav = anime.isFavorite ?? false; // mastiin anime favorit aja yang ditampilin
      return isFav && matchesSearch;
    }).toList();

    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Favorite Anime",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: screenWidth * 0.06,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.075),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: screenWidth * 0.02,
                    offset: Offset(0, screenHeight * 0.005),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Cari Anime Favorit...",
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: screenWidth * 0.04,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white70,
                    size: screenWidth * 0.06,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white70),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                      });
                    },
                  )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.075),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.075),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.075),
                    borderSide:
                    const BorderSide(color: Colors.white, width: 1.5),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF0B395E),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.015,
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.01),

          // Favorite Anime List
          Expanded(
            child: favoriteList.isEmpty
                ? const Center(
              child: Text(
                "Tidak ada anime favorit",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal: screenWidth * 0.04,
              ),
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final anime = favoriteList[index];
                return FavoriteAnimeCard(
                  title: anime.title,
                  genre: anime.genre,
                  rating: anime.rating,
                  imagePath: anime.imagePath,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}