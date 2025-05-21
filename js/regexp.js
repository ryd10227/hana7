const str = "Senior Coding Learning JS";
const a = /[A-z\d]/.test(str);
console.log("🚀 ~ a:", a);

const b = /(A-z\d)/.test(str);
console.log("🚀 ~ b:", b);

const c = /(A-z\d)/.test("XA-z2");
console.log("🚀 ~ c:", c);

const d = /(A-z\d)/.test("XAz2");
console.log("🚀 ~ d:", d);
