class Transaction{
  var history = <Map>[];
  int n;
  Transaction(){
    history.add({'img':'payment','type':'Payment','idBook':'17676BHVD34','date':'Mon, Feb 28, 2020','value':'-Rp1,374,000'});
    history.add({'img':'refund','type':'Refund','idBook':'HUFH9787H','date':'Fri, May 15, 2020','value':'+Rp35,000'});
    history.add({'img':'top_up','type':'Top Up','idBook':'3R3HGGGWE2','date':'Sun, May 25, 2020','value':'+Rp300,000'});
    n = 3;
  }

  void addTransaction({String img, String type,String idBook, String date, String value}){
    history.add({'img':img,'type':type,'idBook':idBook,'date':date,'value':value});
    n+=1;
  }


}

Transaction transaction = new Transaction();