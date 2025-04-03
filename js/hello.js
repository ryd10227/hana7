console.log("Hello");

const myName = "seoyeon33";

// function, var는 함수스코프
// let, const는 블록스코프

function printName(nm) {
  console.log(1, nm);
  //   const myName = "hanaro";
  {
    var myName = "True";
    console.log("if true", myName);
  }
  console.log("function", myName);
}

printName(myName);
console.log(3, myName);

console.log("------------------", typeof 123);
