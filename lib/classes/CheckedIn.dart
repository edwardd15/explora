import 'package:explora/classes/Ticket.dart';
import 'package:intl/intl.dart';

class CheckedIn {
  var ticket = <Map>[];
  int n = 0;
  int i;

  void addTicket(Ticket tix) {
    ticket.add({
      'timefrom': tix.timefrom,
      'timeto': tix.timeto,
      'datefrom': tix.datefrom,
      'dateto': tix.dateto,
      'cityfrom': tix.cityfrom,
      'cityto': tix.cityto,
      'cityfrom1': tix.cityfrom1,
      'cityto1': tix.cityto1,
      'airlineimg': tix.airlineimg,
      'airline': tix.airline,
      'seatclass': tix.seatclass,
      'airportfrom': tix.airportfrom,
      'airportto': tix.airportto,
      'duration': tix.duration,
      'transit': tix.transit,
      'kg': tix.kg,
      'points': tix.points,
      'adult': tix.adult,
      'totalpoints': tix.totalpoints,
      'totalprice': tix.totalprice,
      'ticketprice': tix.ticketprice,
      'totalticketprice': tix.totalticketprice,
      'baggageprice': tix.baggageprice,
      'insuranceprice': tix.insuranceprice,
      'serviceprice': tix.serviceprice,
      'serviceprice1': 1000.0,
      'paymentmethod': tix.paymentmethod,
      'idbook': tix.idbook,
      'seat': 'A8',
      'seatprice':0,
      'checkinprice': 0,
      'ispaid' : false
    });
    n += 1;
  }

  String getShortDate(int i) {
    return DateFormat.yMMMMd('en_US').format(this.ticket[i]['datefrom']);
  }

  void addSeat(int i, String seat, double seatprice) {
    ticket[i] = {'seat': seat, 'seatprice': seatprice};
  }

  void calculateCheckinPrice(int i) {
    this.ticket[i]['checkinprice'] = this.ticket[i]['serviceprice'] + this.ticket[i]['seatprice'];
  }

  String getCheckinPrice(int i) {
    calculateCheckinPrice(i);
    final oCcy = new NumberFormat("#,###", "en_US");
    return oCcy.format(this.ticket[i]['checkinprice']);
  }

  String getMoney(number){
    final oCcy = new NumberFormat("#,###", "en_US");
    return oCcy.format(number);
  }
}

CheckedIn checkedIn = new CheckedIn();