enum DogImageStatus {
  initial,
  loading,
  success,
  error,
}

class DogImageState {
  DogImageState({
    required this.status,
    this.imageUrl = '',
    this.errorMessage = '',
  });

  final DogImageStatus status;
  final String imageUrl;
  final String errorMessage;

  factory DogImageState.initial() =>
      DogImageState(status: DogImageStatus.initial);
}
