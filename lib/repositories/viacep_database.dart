import 'package:viacep/models/viacep_model.dart';

abstract class ViaCepDatabase {
  Future<ViaCepModel> getAddress(String cep);
  Future<void> saveAddress(Results address);
  Future<void> deleteAddress(String id);
  Future<ViaCepModel> getAllAddresses();
}