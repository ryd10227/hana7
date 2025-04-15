class Animal {
  static ID = 1;

  static fuc() {
    return 678;
  }
  static Num = 9;

  constructor(name) {
    this.nage = name;
  }

  feed(food) {
    console.log(`feed to ${this.name} ${food}`);
  }
}

const petMixin = {
  likePeople() {
    console.log(`${this.name} likes people…`);
  },
};

class Cat {
  static answer = 99;
}

// Cat은 Dog에서 상속받지 않아서 쓸 수 없음
class Dog extends Animal {
  #age = 0;
  constructor(name, age) {
    super(name);
    // this.name = name; // this는 힙의 주소. heap에 있는 name이라는 뜻
    this.#age = age;
  }

  getAge() {
    return this.#age;
  }

  get age() {
    return this.#age;
  }

  set age(newAge) {
    this.#age = newAge;
  }

  setName(name) {
    this.name = name;
  }

  f() {
    return this.ID;
  }

  static sf() {
    return this.fuc();
    // static은 원래 this를 가질 수 없음. static 영역에 존재하는 거라서.
    // 상속받은 Animal의 static인 ID를 같이 쓸 수 있음
  }
}

const animal = new Animal();
const animalid = animal.ID;

console.log("aid", animalid);

const dog = new Dog("Dog", 3);
console.log("🚀 ~ dog:", Dog.name);

console.log("타입", typeof dog.sf);
console.log("타입", typeof Dog.sf);

console.log(dog.name, dog.getAge());

dog.setName("Maxx");

dog.age = 5;
console.log(dog.name, dog.age);

dog.feed("Vitamin C");

Object.assign(Dog.prototype, petMixin);

dog.likePeople();

Object.assign(Dog.prototype, petMixin); // dog에 petMixin을 주겠다

const marryTheNewDog = new Dog("Marry");
marryTheNewDog.likePeople();

function wrapFullName(user) {
  return new Proxy(user, {
    get(target, prop) {
      if (prop === "fullName") {
        return target.firstName + " " + target.lastName;
      } else {
        return target[prop];
      }
    },

    set(target, prop, value) {
      if (prop === "fullName") {
        [target.firstName, target.lastName] = value.split(" ");
      } else {
        target[prop] = value;
      }
      return target;
    },
  });
}

const hong = {
  id: 1,

  firstName: "Gildong",

  lastName: "Hong",

  get fullName() {
    return this.firstName + this.lastName;
  },

  set fullName(fname) {
    [this.firstName, this.lastName] = fname.split(" ");
  },
};

console.log("🚀 ~ fullname:", hong.fullName);

hong.fullName = "asdf asdf";

console.log("🚀 ~ fullname:", hong.fullName);

const kim = wrapFullName({ id: 2, firstName: "Gildong", lastName: "Kim" });

console.log(kim.id, kim.fullName);
kim.id = 5;
kim.fullName = "seoyeon yoon";

console.log(kim.fullName);
