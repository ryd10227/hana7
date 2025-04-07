const n = 123;
const bi = 123n;

const n___bi1 = n === bi;
console.log("🚀 ~ n___bi1:", n___bi1);

const n__bi1 = n == bi;
console.log("🚀 ~ n___bi1:", n__bi1);

const s = "abc";
const ss = new String("abc");
const s__ss = s == ss;
console.log("🚀 ~ s__ss:", s__ss, typeof s);
const s___ss = s === ss;
console.log("🚀 ~ s__ss:", s___ss, typeof ss);

// class String {
//   name = "xx";
//   constructor(initValue) {}
//   getName() {}
// }

// new String("abc");

console.log("-------- symbol ---------");

const s1 = Symbol("asdf");
const s2 = Symbol("asdf");
const s__s1 = s1 == s2;
console.log("🚀 ~ s__s1:", s__s1, typeof s1, typeof s2);

// 동일인이니 강제로 동일한 키로 만들어줘
const seoulHong = Symbol.for("H");
const busanHong = Symbol.for("H");
const s__p = seoulHong == busanHong;
console.log("🚀 ~ s__p:", s__p);

console.log("-------- undef - null ---------");

const undef = undefined;
const nil = null;
const undef__nil = undef == nil;
console.log("🚀 ~ undef__nil:", undef__nil);
const undef___nil = undef === nil;
console.log("🚀 ~ undef___nil:", undef___nil);

const hong = { id: 1, name: "Hong" };
let kim = { id: Symbol(), name: "Kim" };
console.log(hong === kim);
kim = hong;
console.log(hong === kim);


console.log("-------- undef - null ---------");

const obj1 = new Object();
const obj2 = {};
console.log(obj1 === obj2);
