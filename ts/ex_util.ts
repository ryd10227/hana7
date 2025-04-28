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
