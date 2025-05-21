function q1() {
  const isStringNumber = (value: unknown): value is [string, number] =>
    Array.isArray(value) &&
    typeof value[0] === "string" &&
    typeof value[1] === "number";

  const f1 = (value: number | string | boolean | [string, number]) => {
    if (isStringNumber(value)) {
      console.log(value[0].toUpperCase(), value[1].toFixed());
    }
  };

  f1(["item", 1000]);
}

//   interface Animal {}
// interface Dog extends Animal {
//     name: string;
// }
// interface Cat extends Animal {
//     punch(): void;
// }
// class Retriever implements Dog {}

// function isDog(a: Animal): a is Dog {
// 	// <이 부분을 작성하시오>
// }

// T1과 동일한 타입으로 T2를 정의하시오.
function q2() {
  const constCart = {
    X: 1,
    Y: 2,
    Z: 3,
  } as const;

  type T1 = 1 | 2 | 3;
  type ConstCart = typeof constCart;
  type T2 = ConstCart[keyof ConstCart];
}

// '가', '나', '다' 어떤 걸 throw 해도 에러 메시지를 출력하도록 (라) 부분을 수정하시오. (type predicate)
function q3() {
  try {
    // throw new Error('some error!!!!');   // 가
    // throw 'some string error!!!';        // 나
    throw ["some", "array", "error"]; // 다
  } catch (error) {
    console.log((error as Error).message); // (라)
  }
}

function q4() {
  interface Animal {}
  interface Dog extends Animal {
    name: string;
  }
  interface Cat extends Animal {
    punch(): void;
  }
  class Retriever implements Dog {
    constructor(public name: string) {}
  }

  function isDog(a: Animal): a is Dog {
    // <이 부분을 작성하시오>
    return "name" in a && typeof a.name === "string";
  }

  const maxx: Dog = { name: "Maxx" };
  if (isDog(maxx)) console.log(maxx.name, "is Dog!");

  const gunhee = new Retriever("Gunhee");
  if (isDog(gunhee)) console.log(gunhee.name, "is Retriever!");
}

console.log("\n----------1----------");
q1();
console.log("\n----------2----------");
q2();
console.log("\n----------3----------");
q3();
console.log("\n----------4----------");
q4();
