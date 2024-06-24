import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:perfectmatch/services/baseurl.dart';

class StateController extends GetxController {
  var states = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchStates();
    super.onInit();
  }

  Future<void> fetchStates() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('${baseUrl}location/state'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        states.value = data['data'];
      } 
      else {
        throw Exception('Failed to load states');
      }
    } catch (e) {
      print('Error fetching states: $e');
    } finally {
      isLoading(false);
    }
  }

}
