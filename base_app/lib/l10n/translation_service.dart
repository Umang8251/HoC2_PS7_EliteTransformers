import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationService {
  static const String apiKey = "AIzaSyDY7qtG9hGoLRY4Vl3R2YnDawNJ-9jY43s";
  static const String baseUrl = "https://translation.googleapis.com/language/translate/v2";

  static Future<String> translateText(String text, String targetLanguage) async {
    final response = await http.post(
      Uri.parse('$baseUrl?key=$apiKey'),
      body: {
        'q': text,
        'target': targetLanguage,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']['translations'][0]['translatedText'];
    } else {
      return "Translation failed";
    }
  }
}
