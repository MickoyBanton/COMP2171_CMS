
import 'package:demo_cms2171/objects/User.dart';
import 'package:flutter/material.dart';

import 'menupage.dart';

class UserProfile extends StatelessWidget {
  User user;
  List<dynamic> RegisterLst = [];
  UserProfile({super.key, required this.user,required this.RegisterLst});

  @override
  Widget build(BuildContext context) {
    final TextEditingController Name = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController idNumber = TextEditingController();

    Name.text = user.getUserName();
    email.text = user.getEmail();
    phone.text = user.getPhoneNumber();
    idNumber.text = user.getIdNumber();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MenuPage(profileLst: RegisterLst, user: user,)));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 49, 92),
        title: const Center(
            child: Text(
              "User Profile",
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
            onPressed: () {
              user;
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Name",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(Name),

          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Phone",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(phone),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Email",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(email),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("ID number",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          textfield(idNumber),

          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
            ),
            child: Text("Password",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          Passwordtextfield(password),

          Center(
            child: SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:const Color.fromARGB(255, 34, 50, 99) ,
                  side: const BorderSide(
                      width: 0, color: Color.fromARGB(255, 218, 218, 218)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () async{
                  if(password.text != ''){
                    if(password.text == user.getPassword()){
                      if(Name.text != '' && phone.text != '' && email.text != '' &&  idNumber.text  != '' ){
                        user = user.editUserProfile(Name.text, password.text, phone.text, email.text, idNumber.text);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Successful'),
                              content: const Text(
                                  "Profile was updated "),
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
                      }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Failure'),
                              content: const Text(
                                  " Please enter all field "),
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

                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                "Password entered was Incorrect"),
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
                          title: const Text('Error'),
                          content: const Text(
                              "Please  enter password"),
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
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: const Text(
                  "Update",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
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
