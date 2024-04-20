


import 'package:demo_cms2171/objects/notification.dart';
import 'package:flutter/material.dart';


class NotificationPage extends StatelessWidget{
List<ClubNotification> NotifyLst;
NotificationPage({super.key, required this.NotifyLst});
@override
Widget build(BuildContext context) {

  List<ClubNotification> lst = NotifyLst;
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new),
        color: Colors.white,
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 0, 49, 92),
      title: const Center(
          child: Text(
            "Club Forum",
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
      child: ListView(
        children: ClubSearch(lst, context),
      ),
    ),

  );
}

List<Widget> ClubSearch(List<ClubNotification> lst, BuildContext context) {
  List<Widget> clubLst = [];
  for (int i = 0; i < lst.length; i++) {
    clubLst.add(clubCard(
        lst[i],
        context));
  }
  return clubLst;
}

Widget clubCard(ClubNotification notification, BuildContext context) {
  return GestureDetector(
    onTap: () {

    },
    child: Padding(
      padding: const EdgeInsets.all(22.0),
      child: Card(
        color: const Color.fromARGB(255, 0, 49, 92).withOpacity(0.1),
        elevation: 0, // Adjust elevation if needed
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: Colors.transparent, width: 3), // Border settings
          borderRadius:
          BorderRadius.circular(12), // Optional: Adjust border radius
        ),
        child: SizedBox(
          height: 140,
          child: Stack(
            children: [

              Positioned(
                  top: 15,
                  left: 20,
                  child: Text(
                    notification.club.getName(),
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  )),
              Positioned(
                  top: 35,
                  left: 20,
                  child: Text(notification.club.clubPresident,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 10))),
              Positioned(
                top: 7,
                left: 10,
                child: Row(
                  children: [
                    Container(
                      width: 5, // Width of the rectangle
                      height: 125,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 49, 92),
                        borderRadius: BorderRadius.circular(
                            12), // Adjust the radius as needed
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 55,
                  left: 20,
                  right: 12,
                  child: Text(
                     notification.message,
                      style: const TextStyle(color: Colors.black)))
            ],
          ),
        ),
      ),
    ),
  );
}
}