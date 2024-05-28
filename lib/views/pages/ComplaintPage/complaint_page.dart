import 'package:flutter/material.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Şikayet"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _inputField(context),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            _buttons(context),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.15,
            ),
          ],
        ),
      ),
    );
  }

  _inputField(context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              // Name Field
              child: TextField(
                decoration: InputDecoration(
                    hintText: "İsim",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.person)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            // surname field
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Soyisim",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.person)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.mail),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "Text",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.text_fields_sharp),
          ),
          maxLength: 180,
          maxLines: 4,
          minLines: 1,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  _buttons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(),
          child: const Text(
            "Gönder",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
