const fs = require("fs");

fs.readFile("./data.csv", "utf8", function (err, data) {
  const arr = data.split(/\n\n/);

  function sumUp(total, num) {
    return total + num
  }

  for (i = 0; i < arr.length; i += 1) {
    let total = arr[i].split(/\n/).map(Number).reduce(sumUp)
    arr[i] = total
  };

  for ( i = 1; i < 4; i += 1 ) {
    let highest = Math.max(...arr)
    console.log("number " + i + " = " + highest);
    arr[arr.indexOf(highest)] = 0
  }
});
