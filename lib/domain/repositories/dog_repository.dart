import '../entities/dog_image_entity.dart';

abstract class DogRepository {
  Future<DogImageEntity> getDogImage();
}
