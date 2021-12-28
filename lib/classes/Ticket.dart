import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';


class Ticket {
  String timefrom;
  String timeto;
  DateTime datefrom;
  DateTime dateto;
  String cityfrom;
  String cityto;
  String cityfrom1;
  String cityto1;
  String airlineimg;
  String airline;
  String seatclass;
  String airportfrom;
  String airportto;
  String duration;
  String transit;
  int kg =15;
  int points;
  int adult;
  int totalpoints = 0;
  double totalprice=0;
  double ticketprice=0;
  double totalticketprice=0;
  double baggageprice=0;
  double insuranceprice=0;
  double serviceprice = 1000;
  String paymentmethod = 'Credit / Debit Card';
  String idbook;

  void setTicket(
      {String timefrom,
      String timeto,
      String duration,
      String transit,
      String airlineimg,
      String airline,
      String cityfrom1,
      String cityto1,
      double ticketprice,
      int points}) {
    this.timefrom = timefrom;
    this.timeto = timeto;
    this.duration = duration;
    this.cityfrom1 = cityfrom1;
    this.cityto1 = cityto1;
    this.transit = transit;
    this.ticketprice = ticketprice;
    this.totalticketprice = this.adult * ticketprice;
    this.points = points;
    this.totalpoints = this.adult * points;
    this.airline = airline;
    this.airlineimg = airlineimg;
    this.kg = 15;
    this.baggageprice = 0;
    this.insuranceprice = 0;
  }

  String getFullDate(){
    return DateFormat.yMMMEd('en_US').format(this.datefrom);
  }

  String getShortDate(){
    return DateFormat.yMMMMd('en_US').format(this.datefrom);
  }

  void addKg(int kg){
    this.kg +=kg;
  }

  void deductKg(int kg){
    this.kg -=kg;
  }

  void addBaggagePrice(double price){
    this.baggageprice +=price;
  }

  void deductBaggagePrice(double price){
    this.baggageprice -=price;
  }

  void addInsurancePrice(double price){
    this.insuranceprice +=price;
  }

  String getMoney(number){
    final oCcy = new NumberFormat("#,###", "en_US");
    return oCcy.format(number);
  }

  void calculateTotal(){
    totalprice = totalticketprice + baggageprice + insuranceprice + serviceprice;
  }

  String getTotal(){
    calculateTotal();
    final oCcy = new NumberFormat("#,###", "en_US");
    return oCcy.format(totalprice);
  }

  void generateIdBook(){
    this.idbook = randomNumeric(9);
  }
}

Ticket ticket = new Ticket();
