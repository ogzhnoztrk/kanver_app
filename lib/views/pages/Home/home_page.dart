import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanver_app/views/pages/AnnouncementsPage/announcements_page.dart';
import 'dart:ui';

import 'package:kanver_app/views/pages/Home/widgets/home_page_card_group.dart';
import 'package:kanver_app/views/pages/ComplaintPage/complaint_page.dart';
import 'package:kanver_app/views/pages/Profile/profile_page.dart';
import 'package:kanver_app/views/pages/AuthPages/LoginPage/login_page.dart';
import 'package:kanver_app/views/pages/AuthPages/RegisterPage/register_page.dart';
import 'package:kanver_app/views/pages/postAnnouncement/post_announcement_page.dart';
import 'package:kanver_app/views/pages/test_page/route_where_you_go.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// ListView
          ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(w / 17, w / 20, 0, w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kan Ver',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: w / 35),
                    Text(
                      'Gönüllü olarak kan bağışı\nyapabilceğiniz gönüllü uygulama',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              HomePageCardsGroup(
                color: Colors.green.shade900,
                icon: Icons.login,
                title: 'Giris Test',
                context: context,
                route: const LoginPage(),
                color2: Colors.red,
                icon2: Icons.app_registration_outlined,
                title2: 'Kayıt test',
                route2: const RegisterPage(),
                animation: _animation,
                animation2: _animation2,
              ),
              HomePageCardsGroup(
                color: Colors.green.shade900,
                icon: Icons.account_box,
                title: 'Profil',
                context: context,
                route: const ProfilePage(),
                color2: Colors.red,
                icon2: Icons.bloodtype,
                title2: 'Donor Ol',
                route2: const RouteWhereYouGo(),
                animation: _animation,
                animation2: _animation2,
              ),
              HomePageCardsGroup(
                color: Colors.orange.shade900,
                icon: Icons.campaign,
                title: 'İlanlar',
                context: context,
                route: const AnnouncementsPage(),
                color2: const Color(0xff63ace5),
                icon2: Icons.add_comment,
                title2: 'İlan Ekle',
                route2: const PostAnnouncementPage(),
                animation: _animation,
                animation2: _animation2,
              ),
              HomePageCardsGroup(
                color: Colors.red,
                icon: Icons.medical_services,
                title: 'Hastaneler',
                context: context,
                route: const RouteWhereYouGo(),
                color2: Colors.yellow.shade800,
                icon2: Icons.assignment_late,
                title2: 'Şikayet',
                route2: const ComplaintPage(),
                animation: _animation,
                animation2: _animation2,
              ),
              SizedBox(height: w / 20),
            ],
          ),

          /// SETTING ICON
          Padding(
            padding: EdgeInsets.fromLTRB(0, w / 9.5, w / 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RouteWhereYouGo();
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(99)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: w / 8.5,
                        width: w / 8.5,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.05),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.settings,
                            size: w / 17,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blur the Status bar
          blurTheStatusBar(context),
        ],
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
