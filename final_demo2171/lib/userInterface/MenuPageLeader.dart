
import 'package:demo_cms2171/main.dart';
import 'package:demo_cms2171/objects/Club.dart';
import 'package:demo_cms2171/objects/User.dart';
import 'package:demo_cms2171/objects/notification.dart';
import 'package:demo_cms2171/userInterface/ClubProfileLeader.dart';
import 'package:demo_cms2171/userInterface/NotificationPage.dart';
import 'package:demo_cms2171/userInterface/UserProfileClubLeader.dart';
import 'package:flutter/material.dart';

import 'NotificationLeader.dart';
import 'UserProfile.dart';
import 'information.dart';

class MenuLeaderPage extends StatelessWidget {
  Club clubprofile;
  User user;

  List<ClubNotification> lstNotify = [];
  MenuLeaderPage({super.key, required this.clubprofile,required this.user});
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
              "Club Leader Main Menu",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: '/assets/fonts/Poppins/Poppins-ExtraLight.ttf/'),
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.transparent,
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
                print('Edit Club Profile');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => clubLeaderProfile(profile: getLst() ,
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
                child: Text('Edit Club Profile'),
              ),
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate to Club Search screen
            //     print('Navigate to Club Search');
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) => ClubSearch(
            //     //       profileList: getLst(),
            //     //       user: user,
            //     //     ),
            //     //   ),
            //     // );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     foregroundColor: Colors.white, backgroundColor: Colors.blue,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            //   child: const Padding(
            //     padding: EdgeInsets.all(10.0),
            //     child: Text('Club Search'),
            //   ),
            // ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to Notifications screen
                print('Navigate to Notifications');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NotificationLeader(NotifyLst: lstNotify, user: user, club: getLst(), )
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
                          UserProfileClubLeader(user: user, RegisterLst: getLst())
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

 Club getLst() {
    return clubprofile;
  }
}
