import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getStates();
  }

  List<String> states = ['State'];
  List<String> cities = ['City'];
  String dropDownCity = "City";
  String dropDown = 'State';

  //var authToken;

  fetchData() async {
    var response = await http.get(
        Uri.parse(
          'https://www.universal-tutorial.com/api/getaccesstoken',
        ),
        headers: {
          "Accept": "application/json",
          "api-token":
              " NwNZfGrNlWJV5UebFzLSLmyzfJVl5z0HqyHesyQVguEDbjudPhN8r8elJlkg0sFl7Ug",
          "user-email": "sarang@digimogo.com",
        });
    if (response.statusCode == 200) {
      var jsonRes = jsonDecode(response.body);

      print("heyyyyy$jsonRes");
      // return json.decode(response.body);
    } else {
      throw Exception('Failed');
    }
  }

  getStates() async {
    var response = await http.get(
        Uri.parse("https://www.universal-tutorial.com/api/states/India"),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJzYXJhbmdAZGlnaW1vZ28uY29tIiwiYXBpX3Rva2VuIjoiTndOWmZHck5sV0pWNVVlYkZ6TFNMbXl6ZkpWbDV6MEhxeUhlc3lRVmd1RURianVkUGhOOHI4ZWxKbGtnMHNGbDdVZyJ9LCJleHAiOjE2NDI1MTUwODZ9.dlw62fmGKSvOlHaSrjI4yDOM3GJ6Muh7xj_0MUhxJ3Q",
          "Accept": "application/json"
        });

    if (response.statusCode == 200) {
      var stateList = jsonDecode(response.body);
      states.clear();
      states.add('State');
      for (var state in stateList) {
        states.add('${state['state_name']}');
      }
      print(states);
      return states;
    }
    update();
  }

  getCities(String city) async {
    var response = await http.get(
        Uri.parse("https://www.universal-tutorial.com/api/cities/$city"),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJzYXJhbmdAZGlnaW1vZ28uY29tIiwiYXBpX3Rva2VuIjoiTndOWmZHck5sV0pWNVVlYkZ6TFNMbXl6ZkpWbDV6MEhxeUhlc3lRVmd1RURianVkUGhOOHI4ZWxKbGtnMHNGbDdVZyJ9LCJleHAiOjE2NDI1MTUwODZ9.dlw62fmGKSvOlHaSrjI4yDOM3GJ6Muh7xj_0MUhxJ3Q",
          "Accept": "application/json"
        });

    if (response.statusCode == 200) {
      var cityList = jsonDecode(response.body);
      cities.clear();
      cities.add('City');
      for (var city1 in cityList) {
        cities.add('${city1["city_name"]}');
      }
      // return cities;
    }
    update();
  }
}
