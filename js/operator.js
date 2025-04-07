const n = 1;
const b = true;
const nb = n + b;
console.log("🚀 ~ nb:", nb);

// const nil = null;
const nil = [];
const n_nil = n + nil;
console.log("🚀 ~ n_nil:", n_nil);

const undef = undefined;
const n_undef = n + undef;
console.log("🚀 ~ n_undef:", n_undef);

let x = 5;
console.log(3 - -x);

console.log(10 + -x * 2);
console.log(-10 * -x * -2);

console.log(x++, ++x);

let aa = 1;
let bb = 2;
let cc = (aa++, ++bb, 12213);

console.log(aa, bb, cc);
console.log("(-----------------)");
i = 100; // primitive (NOT Object === has not methods)
i.toString(); // error? No! 수동형변환(Type Casting)
console.log(i, typeof i); // 100
console.log(10 + i.toString());

let u = "hong"; // primitive
u.age = 30; // 에러일까? (: 오브젝트의 강제형변환)
console.log(u.age); // ?
u = 7;
console.log(u, i);


console.log(0.1 + 0.2); // 0.30000000000000004
console.log(0.1 + 0.2 === 0.3); // false
console.log((0.1 + 0.2).toFixed(1)); // 0.3

