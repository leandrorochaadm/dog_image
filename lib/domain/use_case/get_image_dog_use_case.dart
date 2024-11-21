import 'package:dog/domain/entities/dog_image_entity.dart';
import 'package:dog/domain/repositories/dog_repository.dart';

import '../../core/exception_custom.dart';

class GetImageDogUseCase {
  final DogRepository repository;

  GetImageDogUseCase(this.repository);

  Future<(String?, DogImageEntity?)> call() async {
    try {
      final dogImage = await repository.getDogImage();
      if (!dogImage.isValid) {
        return ('Imagem com url inválida', null);
      }
      return (null, dogImage);
    } on ExceptionCustom catch (e) {
      return (e.message, null);
    } catch (e) {
      return ('Erro inesperado ao obter a imagem', null);
    }
  }
}
