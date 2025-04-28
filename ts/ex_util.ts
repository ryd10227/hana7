// 두 타입을 합치는 Combine 유틸리티 타입 만들기
// * 힌트: 두 타입의 같은 key 라면 union type, 그렇지 않다면 각 타입의 key type
//   - 공통키: 키들의 교집합(keyof T & keyof U)

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

type MyCombine<T, U> = {
  [key in keyof (T & U)]: key extends keyof T & keyof U
    ? T[key] | U[key]
    : key extends keyof U
    ? U[key]
    : key extends keyof T
    ? T[key]
    : undefined;
};

// keyof (T & U) 키들의 합집합
// keyof T & keyof U 키들의 교집합
type Combine<T, U> = {
  // k는 (T & U) 의 key니까 마지막에 (T & U)[k]를 해도 오류가 안 남
  [k in keyof (T & U)]: k extends keyof T & keyof U ? T[k] | U[k] : (T & U)[k];
};

type ICombined = Combine<IUser, IDept>;

let combineX: ICombined = {
  id: 0,
  age: 33,
  name: "aaa",
  dname: "bbb",
  captain: "ccc",
};

let combineY: ICombined = {
  id: 0,
  age: "33세",
  name: "aaa",
  dname: "bbb",
  captain: "ccc",
};

// 두 타입을 합치고 일부는 제외하는 CombineExclude 유틸리티 타입 만들기
// * 힌트: 두 타입의 같은 key 라면 union type, 그렇지 않다면 각 타입의 key type
function q1() {
  type CombineExclude<T, U, E extends keyof (T & U)> = {
    // type CombineExclude<T,U,E>={
    [k in Exclude<keyof Combine<T, U>, E>]: Combine<T, U>[k];
  };

  type ICombineExclude = CombineExclude<IUser, IDept, "name" | "dname">;

  let combineExclude: ICombineExclude = {
    id: 0,
    age: 33,
    captain: "ccc",
  };
}

// regist 함수가 다음과 같을 때 파라미터 처리를 해보세요.
function q2() {
  function registUserObj({ name, age }: { name: string; age: number }) {
    const id = 100;
    return { id, name, age };
  }

  type RegistUserObj = Parameters<typeof registUserObj>[0];
}

// debounce와 throttle 함수를 TypeScript로 작성하시오.
// 방법1) …args를 Generic으로!
// 방법2) cb 을 Generic으로!
function q3() {
  // 방법 2
  const debounce = <T extends (...args: Parameters<T>) => ReturnType<T>>(
    cb: T,
    delay: number = 1
  ) => {
    let timer: ReturnType<typeof setTimeout>;
    return (...args: Parameters<typeof cb>) => {
      if (timer) clearTimeout(timer);
      timer = setTimeout(cb, delay, ...args);
    };
  };

  // 방법 1
  const throttle = <T>(cb: (...args: T[]) => any, delay: number = 1) => {
    let timer: ReturnType<typeof setTimeout> | null;
    return (...args: T[]) => {
      if (timer) return;
      timer = setTimeout(() => {
        cb(...args);
        timer = null;
      }, delay);
    };
  };
}

// JS 시간에 작성했던 memoized 함수를 범용성을 고려하여 TS로 작성하시오.
function q4() {
  // 함수를 받아서 메모이징하는 함수
  function memoized<T extends (...args: Parameters<T>) => ReturnType<T>>(
    fn: T
  ) {
    const cache: Record<string, any> = {};
    return function (...args: Parameters<T>) {
      const k = [...args].join();
      // 캐시가 있으면 리턴하고, 없으면 새로 구하고 캐시해라
      return k in cache ? cache[k] : (cache[k] = fn(...args));
    };
  }

  // test
  const memoizeAdd = memoized((a: number, b: number) => {
    return a + b;
  });

  console.log(memoizeAdd(1, 2)); // 3
  console.log(memoizeAdd(3, 4)); // 7

  const memoizeFactorial = memoized((n: number): number => {
    if (n <= 1) return 1;

    return n * memoizeFactorial(n - 1);
  });
}

console.log("\n----------1----------");
q1();
console.log("\n----------2----------");
q2();
console.log("\n----------3----------");
q3();
console.log("\n----------4----------");
q4();

export {};
