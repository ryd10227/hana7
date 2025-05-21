const readline = require("readline");
const { stdin: input, stdout: output } = require("process");

const rl = readline.createInterface({ input, output });

const gener = add();
const { value } = gener.next();
console.log(value);

rl.on("line", (answer) => {
  if (answer === "bye") rl.close();

  const { value, done } = gener.next(Number(answer));

  if (done) {
    console.log("total ", value);
    rl.close();
  } else {
    console.log(value);
  }
}).on("close", () => {
  process.exit();
});

function* add() {
  const a = yield "first number?";
  const b = yield "second number?";
  return a + b;
}
