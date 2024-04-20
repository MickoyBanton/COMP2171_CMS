

import 'Club.dart';

class ClubNotification{
  String message;
  Club club;
  ClubNotification({required this.message,required this.club});



  ClubNotification createNotification(){
      return ClubNotification(message: message, club: club);
  }




}