import 'package:dio/dio.dart';
import '../models/characters.dart';

class CharactersRepository {
  final Dio _dio = Dio();

  Future<List<Character>> getAllCharacters() async {
    try {
      final response = await _dio.get(
        "https://rickandmortyapi.com/api/character",
      );

      if (response.statusCode == 200) {
        final data = response.data; // Already a decoded Map
        final List<dynamic> results = data['results'];

        return results.map((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception(
          "Failed to load characters with status: ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
