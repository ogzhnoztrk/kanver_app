import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: const Text("Profil"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            // profile image
            profileImage(context),
            const SizedBox(
              height: 10,
            ),
            // personal informations
            const Text("isim soyisim", style: TextStyle(fontSize: 20)),
            const Text("18 bursa", style: TextStyle(fontSize: 20)),
            // personal informations
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),

            // TODO burada eğer kullanıcı zaten donor ise o bilgi gosteerilecek
            ElevatedButton(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text("Donor Ol"), Icon(Icons.bloodtype_sharp)],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Divider(
                indent: MediaQuery.of(context).size.width * 0.14,
                endIndent: MediaQuery.of(context).size.width * 0.14,
              ),
            ),

            // bottom card
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff040039).withOpacity(.1),
                    blurRadius: 100,
                  ),
                ],
              ),
              child: Column(children: [
                Card(
                  child: ListTile(
                    title: const Text("Kişisel Bilgilerim"),
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      debugPrint("Kişisel bilgilerim");
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text("Ayarlar"),
                    leading: const Icon(Icons.settings),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      debugPrint("Ayarlar");
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text("Gizlilik Politikası"),
                    leading: const Icon(Icons.policy),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      debugPrint("gizlilik politikası");
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text("Çıkış"),
                    leading: const Icon(Icons.logout),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      debugPrint("Çıkış");
                    },
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Stack profileImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff040039).withOpacity(.15),
                blurRadius: 99,
              ),
            ],
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.height * 0.14,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: Colors.white),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          ),
        )
      ],
    );
  }
}
