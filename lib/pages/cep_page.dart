import 'package:flutter/material.dart';
import 'package:viacep/models/viacep_model.dart';
import 'package:viacep/repositories/impl/viacep_database.dart';
import 'package:viacep/repositories/impl/viacep_dio.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  late ViaCepDatabaseImpl viaCepDioDatabase;
  late ViaCepImpl viaCep;
  TextEditingController cepController = TextEditingController();

  List<Results> list = [];

  @override
  void initState() {
    super.initState();
    viaCepDioDatabase = ViaCepDatabaseImpl();
    viaCep = ViaCepImpl();
    getAll();
  }

  getAll() async {
    var ceps = await viaCepDioDatabase.getAllAddresses();
    list = ceps.results!;
    setState(() {});
  }

  getCep(String cep) async {
    try {
      cep = cep.replaceAll('.', '').replaceAll('-', '');
      var cepDatabase = await viaCepDioDatabase.getAddress(cep);
      if (cepDatabase.results!.isEmpty) {
        var cepReturn = await viaCep.getAddress(cepController.text);
        cepReturn.cep = cepReturn.cep!.replaceAll('.', '').replaceAll('-', '');
        await dialogBuilder(context, cepReturn, false, false);
      } else {
        await dialogBuilder(context, cepDatabase.results![0], true, false);
      }

      await getAll();
    } catch (e) {
      final snackBar = SnackBar(
        content: const Text('Erro ao pesquisar o cep!'),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> dialogBuilder(
      BuildContext context, Results cep, bool hasInDb, bool toRemove) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(cep.cep!),
            content: Text(
              'Logradouro: ${cep.logradouro}\n'
              'Bairro: ${cep.bairro}\n'
              'Cidade: ${cep.localidade}\n'
              'UF: ${cep.uf}\n'
              'IBGE: ${cep.ibge}',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              !hasInDb
                  ? TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Salvar'),
                      onPressed: () async {
                        await viaCepDioDatabase.saveAddress(cep);
                        Navigator.of(context).pop();
                      },
                    )
                  : toRemove
                      ? TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Remover'),
                          onPressed: () async {
                            await viaCepDioDatabase
                                .deleteAddress(cep.objectId!);
                            Navigator.of(context).pop();
                            await getAll();
                          },
                        )
                      : const Text(""),
            ],
          );
        });
  }

  removeFocus() {
    FocusNode focus = FocusScope.of(context);
    focus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => removeFocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Pesquise um Cep"),
              const SizedBox(
                height: 40,
              ),
              TextField(
                maxLength: 8,
                keyboardType: TextInputType.number,
                controller: cepController,
                decoration: const InputDecoration(labelText: "CEP"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  removeFocus();
                  if (cepController.text.isNotEmpty &&
                      cepController.text.length == 8) {
                    await getCep(cepController.text);
                    cepController.text = "";
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                ),
                child: const Text(
                  "Pesquisar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: list.isEmpty
                    ? const Text("Nenhum CEP pesquisado")
                    : ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (_, index) {
                          var cep = list[index];
                          return ListTile(
                            onTap: () {
                              removeFocus();
                              dialogBuilder(context, cep, true, true);
                            },
                            title: Text(cep.logradouro!),
                            subtitle: Text(cep.cep!),
                            leading: Text(cep.uf!),
                            trailing: Text(cep.ibge!),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
