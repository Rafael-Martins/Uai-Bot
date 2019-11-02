const fs = require("fs");

const list = ``.split("\n");

let dObj = {};

list.split("\n").forEach(value => {
  dObj = {
    ...dObj,
    [value
      .split("–")
      .map(i => i.trim())[0]
      .toLowerCase()]: value.split("–").map(i => i.trim())[1]
  };
});

fs.writeFile("./dicio.json", JSON.stringify(dObj), err => {
  if (err) {
    console.log("Error writing file", err);
  } else {
    console.log("Successfully wrote file");
  }
});

console.log(dObj);
