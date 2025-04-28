// type T3 = 1 | 2 | 3;
// type ConstCart = typeof constCart;
// // type T4 = typeof constCart[keyof typeof constCart];
// type T4 = ConstCart[keyof ConstCart];

// const xCart = { x: 1, y: "str" } as const;
// type XCart = typeof xCart;
// type T5 = XCart[keyof XCart];

// type ValueOf<T> = T[keyof T];
// type T44 = ValueOf<typeof constCart>;
// type T55 = ValueOf<typeof xCart>;

export class Factory<T> {
  protected products: T[];

  constructor(product: T) {
    this.products = [product];
  }

  create(product: T) {
    this.products.push(product);
  }
  getProducts() {
    return [...this.products];
  }
}

type Syrup =
  | { syrup: "choco"; price: 500 }
  | { syrup: "strawberry"; price: 800 };
type Topping = "java" | "cherry";
type Coffee = { menu: string; price: number };

class CoffeeFactory extends Factory<Coffee> {
  order<T>(menu: string, topping: T[]) {
    const coffee = this.products.find(({ menu: _coffee }) => _coffee === menu);

    return coffee ? { ...coffee, additives: topping } : null;
  }
}
const post: Post = {
  id: 10,
  title: "post",
  content: "content",
  user: { id: 1, name: "hong", age: 33 },
};
const product = { id: 100, name: "TV", price: 1000000 };

// function getUserInfoX<T>(params: T) {
//   return params.user; // Error!
// }
function getUserInfo<T extends { user: User }>(params: T) {
  return params.user;
}

getUserInfo(post);
// getUserInfo(product); // Error!
function getUserInfo2<T extends Post>(params: T) {
  return params.user; // Error? No!
}

interface IUser {
  id: number;
  age: number;
  name: string;
}

function get<T, K extends keyof T>(container: T, key: K) {
  return container[key];
}
const user = get<Post, "user">(post, "user");

const user2 = get(post, "user"); // 함수 타입 매개변수의 타입 인수는 생략 가능! -> 타입스크립트가 유추함.

const user3 = get(post, "user"); //

interface Post {
  id: number;
  title: string;
  content: string;
  user: IUser;
}

type X<T> = {
  [k in keyof T]: T[keyof T];
};

type ValueOf<T> = T[keyof T];

export {};
