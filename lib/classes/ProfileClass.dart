import 'dart:io';

class PersonalDataClass {
  String fullname;
  String gender;
  String birthdate;
  String city;
  File profPic;
  bool loggedin;

  PersonalDataClass() {
    fullname = "박채영";
    gender = 'Female';
    birthdate = "2/11/1997";
    city = "Seoul";
    loggedin = false;
  }

  void login(){
    loggedin = true;
  }

  void logout(){
    loggedin = false;
  }

  String getName(){
    if(loggedin){
      return fullname;
    }
    else{
      return 'Guest';
    }
  }

  String getName1(){
    if(gender=='Male'){
      return 'Mr. '+fullname;
    }
    else{
      return 'Ms. '+fullname;
    }
  }
}

class PassportClass {
  String firstname;
  String lastname;
  String number;
  String nationality;

  PassportClass() {
    firstname = 'Roseanne';
    lastname = 'Park';
    number = '0463979982';
    nationality = 'Republic of South Korea';
  }
}

class EmailClass {
  int n;
  var address = new List(5);

  EmailClass() {
    address[0] = 'rose.blackpink@gmail.com';
    n = 1;
  }

  void addAddress(String text) {
    if (n< 5) {
      address[n] = text;
      n += 1;
    }
  }
  
  void deleteAddress(String _address){
    var iDel;
    for (var i=0; i<n; i++){
      if (address[i]==_address) {
        iDel = i;
        break;
      }
    }
    for (var i = iDel; i<n; i++){
      if (i+1<=n){
        address[i] = address[i+1];
      }
    }
    n-=1;
  }
}

class PhoneClass {
  int n;
  var number = new List(5);

  PhoneClass() {
    number[0] = '628123456789';
    n = 1;
  }

  void addNumber(String _number) {
    if (n < 5) {
      number[n] = _number;
      n += 1;
    }
  }

  void deleteNumber(String _number){
    var iDel;
    for (var i=0; i<n; i++){
      if (number[i]==_number) {
        iDel = i;
        break;
      }
    }
    for (var i = iDel; i<n; i++){
      if (i+1<=n){
        number[i] = number[i+1];
      }
    }
    n-=1;
  }
}

PersonalDataClass personalData = PersonalDataClass();
PassportClass passport = PassportClass();
EmailClass email = EmailClass();
PhoneClass phone = PhoneClass();

