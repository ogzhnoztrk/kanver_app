import 'package:flutter/material.dart';
import 'package:kanver_app/views/pages/AuthPages/ForgotPassword/forgot_password_page.dart';
import 'package:kanver_app/views/pages/AuthPages/RegisterPage/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              _inputField(context),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              _buttons(context),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
              ),
              _forgotPassword(context)
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Kanver'e Hoşgeldiniz",
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
        TextField(
          decoration: InputDecoration(
            hintText: "Şifre",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  _buttons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _signup(context),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(),
          child: const Text(
            "Giriş",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ForgotPassword(),
        ));
      },
      child: const Text(
        "Şifremi Unutum?",
        style: TextStyle(color: Colors.purple),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Hesabınız yok mu? "),
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
