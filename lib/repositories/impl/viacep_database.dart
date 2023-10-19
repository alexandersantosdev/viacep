import 'package:viacep/http/viacep_database_dio.dart';
import 'package:viacep/models/viacep_model.dart';
import 'package:viacep/models/viacep_new.dart';
import 'package:viacep/repositories/viacep_database.dart';

class ViaCepDatabaseImpl extends ViaCepDatabase {
  @override
  Future<void> deleteAddress(String id) async {
    ViaCepDioDatabase viaCepDio = ViaCepDioDatabase();
    var response = await viaCepDio.dio.delete("viacep/$id");

    if (response.statusCode == 200) {
      return;
    }

    throw "Erro ao deletar endereço";
  }

  @override
  Future<ViaCepModel> getAddress(String cep) async {
    ViaCepDioDatabase viaCepDio = ViaCepDioDatabase();
    var uri = Uri.encodeComponent('{"cep": "$cep"}');
    var response = await viaCepDio.dio.get("viacep?where=$uri");

    if (response.statusCode == 200) {
      var viaCepModel = ViaCepModel.fromJson(response.data);
      return viaCepModel;
    }

    return ViaCepModel();
  }

  @override
  Future<ViaCepModel> getAllAddresses() async {
    ViaCepDioDatabase viaCepDio = ViaCepDioDatabase();
    var response = await viaCepDio.dio.get("viacep");

    if (response.statusCode == 200) {
      var viaCepModel = ViaCepModel.fromJson(response.data);
      return viaCepModel;
    }

    return ViaCepModel();
  }

  @override
  Future<ViaCepNewModel> saveAddress(Results address) async {
    ViaCepDioDatabase viaCepDio = ViaCepDioDatabase();
    var response = await viaCepDio.dio.post("viacep", data: address.toJson());
    if (response.statusCode == 201) {
      return ViaCepNewModel.fromJson(response.data);
    }
    return ViaCepNewModel();
  }
}
