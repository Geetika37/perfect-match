import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:perfectmatch/services/baseurl.dart';

class DistrictController extends GetxController {
  var districts = [].obs;
  var isLoading = false.obs;

  Future<void> fetchDistricts(int stateId) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('${baseUrl}location/district?state_id=$stateId'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        districts.value = data['data'];
      } else {
        throw Exception('Failed to load districts');
      }
    } catch (e) {
      print('Error fetching districts: $e');
    } finally {
      isLoading(false);
    }
  }
}
