import 'package:flutter/material.dart';
import 'package:viacep/shared/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Não foi possível abrir o link $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'ViaCepAPP',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            const FormatedText(
              text: "Alexander Roberto dos Santos",
            ),
            const Text("Desenvolvedor FullStack"),
            const SizedBox(
              height: 20,
            ),
            const FormatedText(
              text: "Stacks:",
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Javascript/Node"),
            const Text("Dart/Flutter"),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    launchInBrowser(Uri.parse("https://www.linkedin.com/in/alexander-roberto-dos-santos-030bb786"));
                  },
                  child: const Text("Linkedin"),
                ),
                TextButton(
                  onPressed: () {
                    launchInBrowser(Uri.parse("https://github.com/alexandersantosdev"));
                  },
                  child: const Text("Github"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const FormatedText(
              text: "Email:",
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("lekxandy@gmail.com"),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

class FormatedText extends StatelessWidget {
  final String text;
  const FormatedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20),
    );
  }
}
