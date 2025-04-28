// firstObject, lastObject
// filterBy('x', 1)
// filterBy('x', 'a', true)
// findBy('x', 1)
// sortBy('x')

type Prop = string | number | symbol;

// 전역객체라서 다른 파일에도 적용됨
declare global {
  interface Array<T> {
    // Array interface 병합
    firstObject: T;
    lastObject: T;
    // first(): T;
    mapBy: (prop: Prop) => any[];
    filterBy: (prop: Prop, value: any, isInclude: boolean) => any;
    findBy: (prop: Prop, value: any) => any;
    sortBy: (prop: Prop) => any;
  }
}

// pamameter에 타입 쓸 필요 없음
Array.prototype.mapBy = function (prop) {
  return this.map((a) => a[prop]);
};

const users = [
  { id: 1, name: "Hong" },
  { id: 2, name: "Kim" },
];
console.log(users.mapBy("name")); // ['Hong', 'Kim']

Array.prototype.filterBy = function (prop, value, isInclude) {
  if (isInclude) {
    return this.filter((a) => a[prop].includes(value));
  } else {
    return this.filter((a) => a[prop] === value);
  }
};

Array.prototype.findBy = function (prop, value) {
  return this.find((a) => a[prop] === value);
};

Array.prototype.sortBy = function (prop) {
  return this.sort((a, b) => a - b);
};

export {};
