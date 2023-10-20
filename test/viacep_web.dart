import 'package:flutter_test/flutter_test.dart';
import 'package:viacep/models/viacep_model.dart';
import 'package:viacep/repositories/impl/viacep_dio.dart';

void main() {
  test('getcep with viacep server', () async {
    ViaCepImpl viaCepImpl = ViaCepImpl();
    String cep = "83304-330";
    Results address = await viaCepImpl.getAddress(cep);
    expect(address.cep, cep);
    expect(address.logradouro, 'Rua Antônio Valenga');
  });
}
