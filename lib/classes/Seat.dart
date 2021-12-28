import 'dart:math';

class Seat {
  var number = new List.generate(12, (_) => new List(6));
  var status = new List.generate(12, (_) => new List(6));
  int x;
  int y;
  int temp;

  Seat() {
    var rng = new Random();
    for (var i = 0; i < 12; i++) {
      number[i][0] = 'A' + (i + 1).toString();
      number[i][1] = 'B' + (i + 1).toString();
      number[i][2] = 'C' + (i + 1).toString();
      number[i][3] = 'D' + (i + 1).toString();
      number[i][4] = 'E' + (i + 1).toString();
      number[i][5] = 'F' + (i + 1).toString();
      status[i][0] = rng.nextInt(3);
      status[i][1] = rng.nextInt(3);
      status[i][2] = rng.nextInt(3);
      status[i][3] = rng.nextInt(3);
      status[i][4] = rng.nextInt(3);
      status[i][5] = rng.nextInt(3);
    }
    status[7][0] = 3;
    temp = 1;
    x = 7;
    y = 0;
  }

  void selectSeat(int i, int j) {
    status[x][y]=temp;
    x = i;
    y = j;
    temp = status[x][y];
    status[x][y]=3;
  }
}

// status
// 0 not avail
// 1 standard seat
// 2 hot seat
Seat seat = Seat();
