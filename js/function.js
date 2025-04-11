globalThis.name = "GlobalName";
this.name = "ModuleName";

function f() {
  console.log("f.this: ", this);
}
f();

const af = () => {
  console.log("af.this: ", this.name);
  console.log("af.GlobalThis.name: ", globalThis.name);
};
af();

const obj = {
  name: "ObjName",
  bark() {
    // good!(호출한 객체)
    console.log("bark=", this.name);
  },
  bark2: () =>
    // bad!! (this=전역(browser)/module(node))
    console.log("bark2=", this.name),
};

// obj.bark();
// obj.bark2();

const Dog = function (name) {
  console.log(this, new.target, this instanceof Dog);
  this.name = name;
  this.bark = function () {
    console.log("bark=", new.target, this.name, name);
  };
  this.bark2 = () => console.log("bark2=", new.target, this.name, name);
};

const dog = Dog("Doggy");
const lucy = new Dog("Lucy");
// Dog.bark(); // ?
lucy.bark(); // ?
lucy.bark2(); // ?
console.log("type=", typeof dog); // ?
console.log("type=", typeof lucy); // ?

globalThis.name = "Global Name";

const objt = {
  name: "Obj name",
  printName: function () {
    console.log(this.name);
  },
};

const printName = objt.printName;
printName();

const Cat = (name) => {
  console.log("Cat>>", this);
  this.name = name;

  this.bark = function () {
    console.log("bark=", new.target, this.name, name);
  };

  this.bark2 = () => console.log("bark2=", this.name, name);

  return this;
};

// const cat = Cat("Coco");
// // const cat = new Cat(''); // error!!
// cat.bark(); // ?
// cat.bark2(); // ?
// Cat.bark(); // ?
// console.log("type=", typeof cat); // ?

const hong = { id: 1, name: "Hong" };
const kim = { id: 2, name: "Kim" };

const expressFn = function (name) {
  console.log("efn -->", this.name, name, this instanceof expressFn); // instanceof : 그 클래스로 만들어졌냐
};

const arrowFn = (name) => {
  console.log("afn -->", this, this.name, name);
};

// expressFn.bind(hong)("expfn");
// arrowFn.bind(kim)("afn");
expressFn.apply(hong, ["expfn"]); // apply는 array로
arrowFn.apply(kim, ["afn"]);
