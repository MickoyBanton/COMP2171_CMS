import 'package:demo_cms2171/objects/Club.dart';
import 'package:demo_cms2171/objects/User.dart';
import 'package:demo_cms2171/userInterface/MenuPageLeader.dart';
import 'package:demo_cms2171/userInterface/menupage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:const Authenticator(),
    );
  }
}

class Authenticator extends StatefulWidget {
  const Authenticator({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Authenticator> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void VerifyUser(BuildContext context) {
    List<dynamic> lst = [];
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'kevonteh' && password == 'password123') {
      print('Login successful');
      User user = User(userName: "kevonteh",
          password: 'password123', phoneNumber: '18767709267', email: 'brownkev@gmail', idNumber: '620167655');
      _usernameController.text = '';
      _passwordController.text = '';
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MenuPage(profileLst: lst,user:user)));
    }
    else if(username == 'Mickoy' && password == 'password123'){
      print('Login successful Mickoy');
      User user = User(userName: "Mickoy",
          password: 'password123', phoneNumber: '18767709264', email: 'brownMickoy@gmail', idNumber: '620167655');
      Club club = Club(socialMedia:  "https://www.example.com/basketball",
          meetingDay: "Wednesday",
          meetingTimes: "6:00PM",
          emailAddress: "basketballclub@example.com",
          name: "Basketball",
          clubPresident: "John Doe",
          phoneNumber: "+1 (123) 456-7890");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MenuLeaderPage(user:user, clubprofile: club)));

    }




    else {
      print('Login failed');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: const Text(
                'The information seems to be incorrect please try again'),
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
      _usernameController.text = '';
      _passwordController.text = '';
    }
  }

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        !obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          if (obscurePassword) {
                            obscurePassword = !obscurePassword;
                          } else {
                            obscurePassword = true;
                          }
                          print(obscurePassword);
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: obscurePassword,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    VerifyUser(context);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
