import 'package:movies_app/movies/domain/entites/genre.dart';

class GenersModel extends Genres {
  const GenersModel({required super.id, required super.name});

  factory GenersModel.fromjson(Map<String, dynamic> json) => GenersModel(
        id: json["id"],
        name: json["name"],
      );
}
