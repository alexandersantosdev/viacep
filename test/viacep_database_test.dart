import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:viacep/models/viacep_model.dart';
import 'package:viacep/repositories/impl/viacep_database.dart';

void main() {
  test('getCep with viacep database', () async {
    var viacepDatabase = ViaCepDatabaseImpl();
    ViaCepModel cep = await viacepDatabase.getAddress('83304330');
    debugPrint(cep.results![0].logradouro);
  });
  test('getCeps with viacep database', () async {
    var viacepDatabase = ViaCepDatabaseImpl();
    ViaCepModel cep = await viacepDatabase.getAllAddresses();
    debugPrint(cep.results![0].logradouro);
  });
  test('add a new cep with viacep database', () async {
    var viacepDatabase = ViaCepDatabaseImpl();
    var address = Results(
      cep: "01001000",
      logradouro: "Praça da Sé",
      complemento: "lado ímpar",
      bairro: "Sé",
      localidade: "São Paulo",
      uf: "SP",
      ibge: "3550308",
    );

    await viacepDatabase.saveAddress(address);
  });
  test('delete one cep with viacep database', () async {
    var viacepDatabase = ViaCepDatabaseImpl();
    await viacepDatabase.deleteAddress('');
  });
}
