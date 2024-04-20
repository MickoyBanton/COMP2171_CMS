


class Club{
  String socialMedia;
  String meetingDay;
  String meetingTimes;
  String emailAddress;
  String phoneNumber;
  String clubPresident;
  String name;

  Club({
    required this.socialMedia,
    required this.meetingDay,
    required this.meetingTimes,
    required this.emailAddress,
    required this.name,
    required this.clubPresident,
    required this.phoneNumber
  });

  getSocial(){
    return socialMedia;
  }
  getMeetDay(){
    return meetingDay;
  }

  getMeetTime(){
    return meetingTimes;
  }
  getEmail(){
    return emailAddress;
  }
  getName(){
    return name;
  }

  Club editClubProfile(String socialMedia,String meetingDay,String meetingTimes,String emailAddress, String name,String clubPresident, String  phoneNumber){
   Club club = Club(
       socialMedia: socialMedia,
       meetingDay: meetingDay,
       meetingTimes: meetingTimes,
       emailAddress: emailAddress,
       name: name,
       clubPresident: clubPresident,
       phoneNumber: phoneNumber);
    return club;
  }



}