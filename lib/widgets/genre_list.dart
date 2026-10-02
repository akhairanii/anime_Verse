import 'package:flutter/material.dart';

class GenreList extends StatelessWidget {
  final List<String> genres;
  final String selected;
  final ValueChanged<String>? onGenreSelected;

  const GenreList({
    super.key,
    this.genres = const [
      "All",
      "Action",
      "Adventure",
      "Comedy",
      "Drama",
      "Fantasy",
      "Horror",
      "Mystery",
      "Romance",
      "Sci-Fi",
      "Slice of Life",
    ],
    this.selected = "All",
    this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SizedBox(
      height: screenHeight * 0.065,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.008,
        ),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          final isActive = genre == selected;

          return Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.03),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(screenWidth * 0.06),
                  onTap: () {
                    // Panggil callback waktu genre dipilih
                    if (onGenreSelected != null) {
                      onGenreSelected!(genre);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.01,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.06),
                      color: isActive
                          ? const Color(0xFF00ADB5) // Warna aksen saat aktif
                          : const Color(0xFF0B395E), // Warna dasar saat tidak aktif
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: isActive ? 0.4 : 0.2),
                          blurRadius: screenWidth * 0.02,
                          offset: Offset(0, screenHeight * 0.003),
                        ),
                      ],
                    ),
                    child: Text(
                      genre,
                      style: TextStyle(
                        fontSize: screenWidth * 0.038,
                        color: isActive ? Colors.white : Colors.white60,
                        fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}