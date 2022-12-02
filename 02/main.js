const fs = require("fs");

const points = {
  "A X": 3,
  "A Y": 4,
  "A Z": 8,
  "B X": 1,
  "B Y": 5,
  "B Z": 9,
  "C X": 2,
  "C Y": 6,
  "C Z": 7
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
//    A  |  X  |   0    |   3   |   3
//    A  |  Y  |   3    |   1   |   4
//    A  |  Z  |   6    |   2   |   8
//    B  |  X  |   0    |   1   |   1
//    B  |  Y  |   3    |   2   |   5
//    B  |  Z  |   6    |   3   |   9
//    C  |  X  |   0    |   2   |   2
//    C  |  Y  |   3    |   3   |   6
//    C  |  Z  |   6    |   1   |   7
