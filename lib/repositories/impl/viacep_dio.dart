import 'package:viacep/http/viacep_dio.dart';
import 'package:viacep/models/viacep_model.dart';
import 'package:viacep/repositories/viacep.dart';

class ViaCepImpl extends ViaCep {
  @override
  Future<ViaCepModel> getAddress(String cep) async {
    ViaCepDio viaCepDio = ViaCepDio();
    var response = await viaCepDio.dio.get("$cep/json");
    
    if (response.statusCode == 200) {
      var viaCepModel = ViaCepModel.fromJson(response.data);
      return viaCepModel;
    }

    return ViaCepModel();
  }
}
