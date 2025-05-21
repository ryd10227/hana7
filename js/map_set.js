const hong = { id: 1, name: "Hong" };

const m = new Map();

m.set(1, 100);
m.set(2, 200);
m.set(hong, hong.name);
m.set(2, 222);
m.set(3, undefined);

m.delete(1);

console.log(m);
console.log(m.has(hong));
console.log(m.has(3));
console.log(m.get(hong));

const keys = m.keys();
console.log("🚀 ~ keys:", keys);

const s = new Set([1, 2, "3"]);
s.add(4);
s.add(hong);
console.log(s);
