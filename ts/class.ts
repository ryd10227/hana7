// class WithProperty {
//   myProperty!: () => void; // Type 정의
// }
// console.log(new WithProperty().myProperty === new WithProperty().myProperty); // true??? false!

// const instance = new WithProperty();
// instance.myProperty(); // OK?

// class WithProperty2 {
//   myProperty: () => void; // call signature
//   constructor() {
//     this.myProperty = () => {
//       console.log("Hello, this is myProperty!");
//     };
//   }
// }
// const instance2 = new WithProperty2();
// instance2.myProperty();

// interface Learner {
//   name: string | number;
//   study(hours: number): void;
// }

// class Student implements Learner {
//   name: "sy";
//   study(hours: number): void {
//     this.name = `${hours}`;
//   }
// }

class Animal {
  constructor(public name: string, public mouse: string = "x") {
    this.mouse = mouse;
  }

  feed(food: string) {
    this.mouse = food;
    console.log(food, "feed to", this.name);
  }

  print(age: number) {
    console.log("Animal name is", this.name);
  }
}

class Dog extends Animal {
  print() {
    console.log("name is", this.name);
  }
}
class Cat extends Animal {
  print() {
    console.log(this.constructor.name, "name is", this.name);
  }
}

const max: Dog = new Dog("Max");
const navee: Cat = new Cat("Navee");

let animal: Animal = max;
// animal.feed("Banana").print(12);

animal = navee;
// animal.feed("fish").print(123);
