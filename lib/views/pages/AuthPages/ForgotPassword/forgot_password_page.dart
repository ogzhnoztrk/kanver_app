import 'package:flutter/material.dart';
import 'package:kanver_app/views/pages/AuthPages/RegisterPage/register_page.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _header(context),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              _inputField(context),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              _signUp(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Image.network("https://i.hizliresim.com/p3wnqld.png"),
        ),
        const Text(
          "Şifremi Unuttum",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.person),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.purple,
          ),
          child: const Text(
            "Sıfırla",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  _signUp(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Mevcut bir hesabınız yok mu? "),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ));
            },
            child: const Text(
              "Kayıt Ol",
              style: TextStyle(color: Colors.purple),
            ))
      ],
    );
  }
}
