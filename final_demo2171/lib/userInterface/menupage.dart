
import 'package:demo_cms2171/main.dart';
import 'package:demo_cms2171/objects/User.dart';
import 'package:demo_cms2171/userInterface/NotificationPage.dart';
import 'package:demo_cms2171/userInterface/UserProfile.dart';
import 'package:flutter/material.dart';

import 'RegisteredClubs.dart';
import 'SearchPage.dart';
import 'information.dart';

class MenuPage extends StatelessWidget {
  List<dynamic> profileLst = [];
  User user;
  MenuPage({super.key, required this.profileLst,required this.user});
  InformationPage info = InformationPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Authenticator()));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 49, 92),
        title: const Center(
            child: Text(
              "Main Menu",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: '/assets/fonts/Poppins/Poppins-ExtraLight.ttf/'),
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Registered Clubs screen
                print('Navigate to Registered Clubs');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisteredClubs(
                      profileLst: getLst(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Registered Clubs'),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to Club Search screen
                print('Navigate to Club Search');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClubSearch(
                      profileList: getLst(),
                      user: user,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Club Search'),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to Notifications screen
                print('Navigate to Notifications');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NotificationPage(NotifyLst: info.NotifyLs)
                  ),
                );
                
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Notifications'),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to User Profile screen
                print('Navigate to User Profile');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UserProfile(user: user, RegisterLst: getLst(),)
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('User Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic> getLst() {
    return profileLst;
  }
}
