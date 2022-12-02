const fs = require("fs");

const points = {
  "A X": 4,
  "A Y": 8,
  "A Z": 3,
  "B X": 1,
  "B Y": 5,
  "B Z": 9,
  "C X": 7,
  "C Y": 2,
  "C Z": 6
}

var total = 0;

fs.readFile("./data.csv", "utf8", function (err, data) {
  const strategy = data.split(/\n/);

  function roundCalculator(play) {
    return points[play];
  }
  
  for (i = 0; i < strategy.length; i++) {
    total += roundCalculator(strategy[i])
  }

  console.log(total)
});

//    1  |  2  | points | extra |  total  |
//   ______________________________________
//    A  |  X  |   3    |   1   |   4
//    A  |  Y  |   6    |   2   |   8
//    A  |  Z  |   0    |   3   |   3
//    B  |  X  |   0    |   1   |   1
//    B  |  Y  |   3    |   2   |   5
//    B  |  Z  |   6    |   3   |   9
//    C  |  X  |   6    |   1   |   7
//    C  |  Y  |   0    |   2   |   2
//    C  |  Z  |   3    |   3   |   6
