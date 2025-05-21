// "use strict";

// f = 1;
// NaN = 1;
// Infinity = 0;
// function f(a, aa) {
//   console.log("outer f", a);
// }
// // delete f; // error
// {
//   f(100);
//   function f(a) {
//     console.log("block f", a);
//   }
// }
// f(200);

function varFn() {
  var v = 1;
  {
    var v = 2,
      vv = 3;
    console.log(v, vv); // 2, 3
  }
  console.log(v, vv); // 2, 3
}
varFn();