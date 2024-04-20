


import 'package:demo_cms2171/objects/Club.dart';
import 'package:demo_cms2171/objects/User.dart';
import 'package:demo_cms2171/objects/notification.dart';
import 'package:demo_cms2171/userInterface/MenuPageLeader.dart';
import 'package:flutter/material.dart';


class NotificationLeader extends StatelessWidget{
  List<ClubNotification> NotifyLst;
  User user;
  Club club;
  final TextEditingController message = TextEditingController();
  final TextEditingController password = TextEditingController();
  NotificationLeader({super.key, required this.NotifyLst,required this.user,required this.club});
  @override
  Widget build(BuildContext context) {

    List<ClubNotification> lst = NotifyLst;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MenuLeaderPage(clubprofile: club, user: user)
              ),
            );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: const Text('Create Notification'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    const SizedBox(
                      height: 12,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 170.0,
                      ),
                      child: Text("message",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    ),
                    textfield(message),
                    const SizedBox(
                      height: 12,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 170.0,
                      ),
                      child: Text("password",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    ),
                    Passwordtextfield(password),

                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromARGB(255, 34, 50, 99),
                      side: const BorderSide(
                          width: 0, color: Color.fromARGB(255, 218, 218, 218)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {
                       if(password.text != '' && password.text == user.getPassword()){
                         if(message.text != '') {
                           ClubNotification notify = ClubNotification(message: message.text, club: club);
                           NotifyLst += [notify.createNotification()];
                           showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 title: const Text('Successful'),
                                 content: const Text(
                                     "Notification sent"),
                                 actions: <Widget>[
                                   ElevatedButton(
                                     onPressed: () {
                                       Navigator.of(context).pop();
                                     },
                                     child: const Text('Close'),
                                   ),
                                 ],
                               );
                             },
                           );
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>
                                     NotificationLeader(NotifyLst: NotifyLst, user: user, club: club)
                             ),
                           );
                         }
                         else{
                           showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 title: const Text('Empty'),
                                 content: const Text(
                                     "Please enter a message"),
                                 actions: <Widget>[
                                   ElevatedButton(
                                     onPressed: () {
                                       Navigator.of(context).pop();
                                     },
                                     child: const Text('Close'),
                                   ),
                                 ],
                               );
                             },
                           );
                         }


                       }else{
                         showDialog(
                           context: context,
                           builder: (BuildContext context) {
                             return AlertDialog(
                               title: const Text('Failure'),
                               content: const Text(
                                   "Password entered was incorrect"),
                               actions: <Widget>[
                                 ElevatedButton(
                                   onPressed: () {
                                     Navigator.of(context).pop();
                                   },
                                   child: const Text('Close'),
                                 ),
                               ],
                             );
                           },
                         );
                       }
                    },
                    child: const Text(
                      'Send message',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromARGB(255, 34, 50, 99),
                      side: const BorderSide(
                          width: 0, color: Color.fromARGB(255, 218, 218, 218)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {
                      // _confirmedpassword.text = "";
                      // _newpassword.text = "";
                      // _emailpasscode.text = "";

                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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

  Widget textfield(TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 10),
      child: SizedBox(
        height: 60,
        width: 350,
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: textEditingController,
          onChanged: (value) {
            value = value;
          },
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 1, 43, 119),
            filled: true,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),
            contentPadding: const EdgeInsets.only(left: 14, top: 23),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget Passwordtextfield(TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 10),
      child: SizedBox(
        height: 60,
        width: 350,
        child: TextField(
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          controller: textEditingController,
          onChanged: (value) {
            value = value;
          },
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 1, 43, 119),
            filled: true,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),
            contentPadding: const EdgeInsets.only(left: 14, top: 23),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}