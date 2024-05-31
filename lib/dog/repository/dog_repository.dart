import 'dart:convert';

import 'package:dogs/dog/service/http_service.dart';

import '../model/dog.dart';

class DogRepository {

  Future<DogModel?> getDogImage() async {
    try {
      final res = await HttpService().getData(apiUrl: "https://dog.ceo/api/breeds/image/random");
      final body = json.decode(res.body);
      final DogModel model = DogModel.fromJson(body);
      return model;
    } catch(error) {
      return null;
    }
  }

}