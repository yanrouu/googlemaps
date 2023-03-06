import '../models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key =
      'AIzaSyAFYTolE1Nu7HttktcF_-nsYqpj3-DLNuQ'; // replace YOUR_API_KEY_HERE with your actual API key

  Future<List<Place>> getPlaces(double lat, double lng) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=hospital&rankby=distance&key=$key');

    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load places');
    }

    var json = convert.jsonDecode(response.body);

    var jsonResults = json['results'] as List;

    if (jsonResults.isNotEmpty) {
      return jsonResults.map((place) => Place.fromJson(place)).toList();
    } else {
      return [];
    }

    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
