import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:perfectmatch/services/baseurl.dart';

class CityController extends GetxController {
  var cities = [].obs;
  var isLoading = false.obs;

  void fetchCities(int districtId) async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('${baseUrl}location/city?district_id=$districtId'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        cities.value = data['data'];
      } else {
        throw Exception('Failed to load cities');
      }
    } catch (e) {
      print('Error fetching cities: $e');
    } finally {
      isLoading(false);
    }
  }
}
