import 'package:dio/dio.dart';
import 'package:dog/domain/entities/dog_image_entity.dart';
import 'package:dog/domain/repositories/dog_repository.dart';

import '../../core/exception_custom.dart';
import '../models/dog_image_model.dart';

class DogApiRepository implements DogRepository {
  final Dio dio;

  DogApiRepository(this.dio);
  @override
  Future<DogImageEntity> getDogImage() async {
    try {
      final response = await dio.get('https://dog.ceo/api/breeds/image/random');
      final data = DogImageModel.fromJson(response.data);

      if (data.status != 'success') {
        throw ExceptionCustom('Erro no status ao obter imagem');
      }
      final dogImageEntity = data.toEntity();
      return dogImageEntity;
    } catch (e) {
      throw ExceptionCustom('Erro não esperado ao obter imagem');
    }
  }
}
