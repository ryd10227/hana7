import { Factory } from "./generic";

let x: Hana7 = { id: 1, name: "SY" };
let ft: Factory<string>;

function q1() {
  interface IUser {
    id: number;
    age: number;
    name: string;
  }

  interface IDept {
    id: number;
    age: string;
    dname: string;
    captain: string;
  }

  // type Change<T, K extends keyof T, U> = {
  //   [x in K]: U;
  // } & Omit<T, K>;

  // (k extends K) 는 (property k == 'captain'일 때) 라는 뜻
  // type 안에서 '==' 연산자를 못씀
  type Change<T, K extends keyof T, U> = {
    [key in keyof T]: key extends K ? U : T[key];
  };

  type DeptCaptain = Change<IDept, "captain", IUser>;

  // type Err = Change<IDept, "xxx", IUser>; // 존재하지 않는 키는 Error!!!
}

function q2() {
  type Item = { item: string; price: number };
  type ItemPrice<T, U> = {
    // [k in keyof T]: T[k] extends string ? keyof U : number;
    [key in keyof T]: key extends "item" ? keyof U : T[key];
  };

  const stock = { X: 1, Y: 2, Z: 30 };

  const itemPrices: ItemPrice<Item, typeof stock>[] = [
    { item: "X", price: 1000 },
    { item: "Y", price: 2000 },
    { item: "Z", price: 3000 },
    // { item: "E", price: 3000 },
  ];

  const total = itemPrices.reduce(
    (curr, itemPrice) => curr + stock[itemPrice.item] * itemPrice.price,
    0
  );
}

function q3() {
  // type TPropertyKeyType = string | number | symbol;
  // type TUser = { [key: string]: string | number };

  // 어떤 parameter가 와도 범용적으로 쓸 수 있음
  function deleteArray<T>(
    arr: T[],
    startOrKey: number | keyof T,
    endOrValue?: number | T[keyof T]
    // endOrValue?: unknown
  ) {
    if (typeof startOrKey === "number") {
      if (typeof endOrValue === "number") {
        return arr.filter((_, i) => i < startOrKey || i > endOrValue - 1);
      }
      return arr.slice(0, startOrKey);
    }

    if (typeof startOrKey === "string") {
      return arr.filter((e) => {
        if (e && typeof e === "object") {
          return e[startOrKey] !== endOrValue;
        }
      });
    }

    return [];
  }
  const arr = [1, 2, 3, 4];
  console.log(deleteArray(arr, 2)); // [1, 2]
  console.log(deleteArray(arr, 1, 3)); // [1, 4]
  console.log(arr); // [1, 2, 3, 4]

  const users = [
    { id: 1, name: "Hong" },
    { id: 2, name: "Kim" },
    { id: 3, name: "Lee" },
  ];

  console.log(deleteArray(users, 2)); // [Hong, Kim]
  console.log(deleteArray(users, 1, 2)); // [Hong, Lee]
  console.log(deleteArray(users, "id", 2)); // [Hong, Lee]
  console.log(deleteArray(users, "name", "Lee")); // [Hong, Kim]
}

// console.log("\n----------1----------");
// q1();
// console.log("\n----------2----------");
// q2();
console.log("\n----------3----------");
q3();

export {};
