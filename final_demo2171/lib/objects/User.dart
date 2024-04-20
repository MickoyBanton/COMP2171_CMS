


class User {
  String userName;
  String password;
  String phoneNumber;
  String email;
  String idNumber;

  User({required this.userName,required this.password,required this.phoneNumber,required this.email,required this.idNumber});

 User editUserProfile(String userName,String password,String phoneNumber,String email, String idNumber){
     User user = User(userName: userName,password: password,phoneNumber: phoneNumber,email: email,idNumber: idNumber);
     return user;
 }

 getUserName(){
   return userName;
 }
 getIdNumber(){
   return idNumber;
 }

  getEmail(){
    return email;
  }

  getPassword(){
    return password;
  }
  getPhoneNumber(){
    return phoneNumber;
  }
  showUserProfile(){

  }


}