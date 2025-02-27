import 'package:get/get.dart';
import 'package:rio_cupones/src/environment/environment.dart';
import 'package:rio_cupones/src/models/Business.dart';

class BusinessProvider extends GetConnect {
  String url = '${Environment.API_URL}api/business';

  Future<Response> create(Business business) async {
    Response response = await post(
      '$url/create',
      business.toJson(),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }
}
