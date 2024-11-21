import 'package:flutter/cupertino.dart';

import '../../domain/use_case/get_image_dog_use_case.dart';
import '../states/dog_image_state.dart';

class DogImageNotifier extends ValueNotifier<DogImageState> {
  DogImageNotifier(this.getImageDogUseCase) : super(DogImageState.initial()) {
    load();
  }

  final GetImageDogUseCase getImageDogUseCase;

  Future<void> load() async {
    value = DogImageState(status: DogImageStatus.loading);
    final (errorMessage, dogImage) = await getImageDogUseCase();

    if (dogImage != null) {
      value = DogImageState(
        status: DogImageStatus.success,
        imageUrl: dogImage.imageUrl,
      );
      return;
    }

    value = DogImageState(
      status: DogImageStatus.error,
      errorMessage: errorMessage ?? 'Erro inesperável',
    );
  }
}
