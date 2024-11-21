import 'package:dio/dio.dart';

import '../data/repository/dog_api_repository.dart';
import '../domain/use_case/get_image_dog_use_case.dart';
import '../presenter/notifiers/dog_image_notifier.dart';

class DependencyFactory {
  static Dio createDio() {
    return Dio();
  }

  static DogApiRepository createDogApiRepository() {
    final dio = createDio();
    return DogApiRepository(dio);
  }

  static GetImageDogUseCase createGetImageDogUseCase() {
    final repository = createDogApiRepository();
    return GetImageDogUseCase(repository);
  }

  static DogImageNotifier createDogImageNotifier() {
    final useCase = createGetImageDogUseCase();
    return DogImageNotifier(useCase);
  }
}
