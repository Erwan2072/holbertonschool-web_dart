import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  try {
    int page = 1;
    bool hasNextPage = true;

    while (hasNextPage) {
      final url = 'https://rickandmortyapi.com/api/character?page=$page';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> characters = data['results'];

        for (var character in characters) {
          print(character['name']);
        }


        hasNextPage = data['info']['next'] != null;
        page++;
      } else {
        throw Exception('Failed to load characters. Status: ${response.statusCode}');
      }
    }
  } catch (error) {
    print('error caught: $error');
  }
}