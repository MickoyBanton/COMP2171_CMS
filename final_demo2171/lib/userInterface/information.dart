import 'package:demo_cms2171/objects/notification.dart';

import '../objects/Club.dart';


List<Club> clubLst =[
  Club(socialMedia:  "https://www.example.com/basketball",
      meetingDay: "Wednesday",
      meetingTimes: "6:00PM",
      emailAddress: "basketballclub@example.com",
      name: "Basketball",
      clubPresident: "John Doe",
      phoneNumber: "+1 (123) 456-7890"),
  Club(socialMedia:  "https://www.example.com/soccer",
      meetingDay: "Saturday",
      meetingTimes: "10:00AM",
      emailAddress: "soccerclub@example.com",
      name: "Soccer",
      clubPresident: "Jane Smith",
      phoneNumber: "+1 (234) 567-8901"),
];
Club soccer = getClub(clubLst[1]);
Club basketball = getClub(clubLst[0]);
class InformationPage {

  List<dynamic> lst = [

    {
      "ClubName": "Basketball",
      "SocialMedia": "https://www.example.com/basketball",
      "meetDay": "Wednesday",
      "meetTime": "6:00PM",
      "email": "basketballclub@example.com",
      "phone": "+1 (123) 456-7890",
      "ClubPres": "John Doe"
    },
    {
      "ClubName": "Soccer",
      "SocialMedia": "https://www.example.com/soccer",
      "meetDay": "Saturday",
      "meetTime": "10:00AM",
      "email": "soccerclub@example.com",
      "phone": "+1 (234) 567-8901",
      "ClubPres": "Jane Smith"
    },
    {
      "ClubName": "Tennis",
      "SocialMedia": "https://www.example.com/tennis",
      "meetDay": "Tuesday",
      "meetTime": "4:30PM",
      "email": "tennisclub@example.com",
      "phone": "+1 (345) 678-9012",
      "ClubPres": "Alice Johnson"
    },
    {
      "ClubName": "Tennis",
      "SocialMedia": "https://www.example.com/tennis",
      "meetDay": "Tuesday",
      "meetTime": "4:30PM",
      "email": "tennisclub@example.com",
      "phone": "+1 (345) 678-9012",
      "ClubPres": "Alice Johnson"
    },
    {
      "ClubName": "Chess",
      "SocialMedia": "https://www.linkedin.com/in/chessclub789",
      "meetDay": "Friday",
      "meetTime": "6:30PM",
      "email": "chessclub789@gmail.com",
      "phone": "+1 (800) 555-1234",
      "ClubPres": "Alice Johnson"
    },
    {
      "ClubName": "Swimming",
      "SocialMedia": "https://www.linkedin.com/in/swimmingclub456",
      "meetDay": "Sunday",
      "meetTime": "8:00PM",
      "email": "swimmingclub456@gmail.com",
      "phone": "+1 (800) 777-8888",
      "ClubPres": "David Brown"
    },
    {
      "ClubName": "Volleyball",
      "SocialMedia": "https://www.linkedin.com/in/volleyballclub789",
      "meetDay": "Monday",
      "meetTime": "6:00PM",
      "email": "volleyballclub789@gmail.com",
      "phone": "+1 (800) 999-0000",
      "ClubPres": "Emily Davis"
    }
  ];


  List<ClubNotification> NotifyLs = [
  ClubNotification(message: 'Soccer Practice will end early today', club: soccer),
  ClubNotification(message: 'Basketball will be canceled today due to event at the court', club: basketball),

  ];

  List<dynamic> getLst(){
    return lst;
  }


}
Club getClub(Club club){
  return club;
}