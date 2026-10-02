class Anime {
  final String id;
  final String title;
  final String imagePath;
  final String genre;
  final String rating;
  final String totalEpisodes;
  final String description;
  bool isFavorite;

  Anime({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.genre,
    required this.rating,
    required this.totalEpisodes,
    required this.description,
    this.isFavorite = false,
  });
}