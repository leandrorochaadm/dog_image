class DogImageEntity {
  final String imageUrl;

  DogImageEntity({required this.imageUrl});

  bool get isValid => imageUrl.trim().isNotEmpty;
}
