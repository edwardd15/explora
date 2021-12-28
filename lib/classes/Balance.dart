import 'package:explora/classes/CheckedIn.dart';
import 'package:explora/classes/Ticket.dart';
import 'package:explora/classes/Transaction.dart';
import 'package:intl/intl.dart';
import 'package:explora/classes/ProfileClass.dart';

//final oCcy = new NumberFormat("#,##0.00", "en_US");
final oCcy = new NumberFormat("#,###", "en_US");

class Balance {
  double balance;
  int points;

  Balance() {
    balance = 200000;
    points = 1024;
  }

  void addBalance(double balance) {
    this.balance += balance;
    topUp(transaction, balance);
  }

  void deductBalance(double balance) {
    this.balance -= balance;
    pay(transaction, ticket,checkedIn, balance);
  }

  void deductBalance1(double balance) {
    this.balance -= balance;
    pay1(transaction, ticket,checkedIn, balance);
  }

  void addPoints(int points) {
    this.points += points;
  }

  String getBalance(PersonalDataClass personalData) {
    if (personalData.loggedin) {
      return oCcy.format(balance);
    } else {
      return '-';
    }
  }

  String getPoints(PersonalDataClass personalData) {
    if (personalData.loggedin) {
      return this.points.toString();
    } else {
      return '-';
    }
  }

  void setBalance(double balance) {
    this.balance = balance;
  }

  void topUp(Transaction transaction, double value) {
    transaction.addTransaction(
      img: 'top_up',
      type: 'Top Up',
      date: DateFormat.yMMMEd().format(DateTime.now()).toString(),
      value: '+Rp' + oCcy.format(value),
    );
  }

  void pay(Transaction transaction, Ticket ticket, CheckedIn checkedIn, double value) {
    ticket.generateIdBook();
    transaction.addTransaction(
        img: 'payment',
        type: 'Payment',
        date: DateFormat.yMMMEd().format(DateTime.now()).toString(),
        value: '-Rp' + oCcy.format(value),
        idBook: ticket.idbook);
    checkedIn.addTicket(ticket);
  }

  void pay1(Transaction transaction, Ticket ticket, CheckedIn checkedIn, double value) {
    ticket.generateIdBook();
    transaction.addTransaction(
        img: 'payment',
        type: 'Payment',
        date: DateFormat.yMMMEd().format(DateTime.now()).toString(),
        value: '-Rp' + oCcy.format(value),
        idBook: checkedIn.ticket[checkedIn.i]['idbook']);
    
  }

  bool isSuciffient(double price) {
    return this.balance >= price;
  }
}

Balance balance = new Balance();
