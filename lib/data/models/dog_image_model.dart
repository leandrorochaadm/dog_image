import 'package:dog/domain/entities/dog_image_entity.dart';

class DogImageModel {
  DogImageModel({
    required this.message,
    required this.status,
  });

  final String message;
  final String status;

  factory DogImageModel.fromJson(Map<String, dynamic> json) {
    return DogImageModel(
      message: json["message"] ?? "",
      status: json["status"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };

  toEntity() => DogImageEntity(imageUrl: message);
}
