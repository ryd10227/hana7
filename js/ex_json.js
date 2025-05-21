const arr = [100, 200, 300, 400, 500, 600, 700];

// for-in문을 사용하여 배열의 인덱스(키)를 출력하시오.
function q1() {
  console.log("배열의 인덱스 (키): ");

  for (const i in arr) {
    console.log(i);
  }
}

// for-in문을 사용하여 배열의 원소(값)를 출력하시오. (of처럼)
function q2() {
  console.log("배열의 원소 (값): ");

  for (const i in arr) {
    console.log(arr[i]);
  }
}

const obj = { name: "Kim", addr: "Yongsan", level: 1, role: 9, receive: false };

// for-in문을 사용하여 프로퍼티 이름(키)을 출력하시오.
function q3() {
  console.log("for-in 프로퍼티 이름 (키): ");

  for (const i in obj) {
    console.log(i);
  }
}

//   for-in문을 사용하여 프로퍼티 값을 출력하시오.
function q4() {
  console.log("for-in 프로퍼티 값: ");

  for (const i in obj) {
    console.log(obj[i]);
  }
}

// for-of문을 사용하여 프로퍼티 값을 출력하시오.
function q5() {
  console.log("for-of 프로퍼티 값: ");

  for (const v of Object.values(obj)) {
    console.log(v);
  }
}

// level 프로퍼티가 열거(entries)되지 않도록 설정하시오. // Object.defineProperty
function q6() {
  Object.defineProperty(obj, "level", { enumerable: false });
  console.log(obj);
}

// role 프로퍼티는 읽기전용으로 설정하시오. // Object.defineProperty
function q7() {
  Object.freeze(obj);
  console.log(obj);
}

// 배열을 객체로 만드시오. (makeObjectFromArray)
// { 'A': [10, 20], 'B': [30, 40], 'C': [50, 60, 70] }
function q8() {
  const data = [
    ["A", 10, 20],
    ["B", 30, 40],
    ["C", 50, 60, 70],
  ];

  const dataObj = {};

  function makeObjectFromArray(arr) {
    for (const [key, ...values] of arr) {
      dataObj[key] = values;
    }
  }

  makeObjectFromArray(data);
  console.log(dataObj);
}

// 위에서 만든 객체를 다시 배열로 만드시오. (makeArrayFromObject)
// [['A', 10, 20], ['B', 30, 40], ['C', 50, 60, 70]]
function q9() {
  const dataObj = { A: [10, 20], B: [30, 40], C: [50, 60, 70] };
  const data = [];

  function makeArrayFromObject(obj) {
    for (const [key, values] of Object.entries(obj)) {
      data.push([key, ...values]);
    }
  }

  makeArrayFromObject(dataObj);
  console.log(data);
}

// 원시값(primitive)만을 갖는 객체 kim을 복사하는 프로그램을
// Object의 클래스 메소드 또는 spread(...) 연산자를 사용하지 말고 작성하시오.
function q10() {
  // 1) shallow copy
  const kim = { nid: 3, nm: "Kim", addr: "Pusan" };
  const newKim1 = shallowCopy(kim);
  newKim1.addr = "Daegu";
  console.log(kim.addr !== newKim1.addr); // true면 통과!

  function shallowCopy(obj) {
    return Object.create(obj); // true
    return { ...obj }; // true
    // return Object.assign(obj); // false
  }

  // 2) 이하 deep copy
  const kim2 = {
    nid: 3, // shallow copy나 deep copy나 결과 같음
    nm: "Kim", // shallow copy나 deep copy나 결과 같음
    addr: { city: "Pusan", road: "Haeundaero", zip: null }, // shallow copy와 deep copy의 결과가 다름
  };

  const newKim2 = deepCopy(kim2);
  newKim2.addr.city = "Daegu";
  console.log(kim2.addr.city !== newKim2.addr.city); // true면 통과!

  function deepCopy(obj) {
    const copied_obj = {};

    for (const [key, value] of Object.entries(obj)) {
      if (value !== null && typeof value === "object") {
        copied_obj[key] = deepCopy(value);
      } else {
        copied_obj[key] = value;
      }
    }

    return copied_obj;
  }
}

console.log("\n----------1----------");
q1();
console.log("\n----------2----------");
q2();
console.log("\n----------3----------");
q3();
console.log("\n----------4----------");
q4();
console.log("\n----------5----------");
q5();
console.log("\n----------6----------");
q6();
console.log("\n----------7----------");
q7();
console.log("\n----------8----------");
q8();
console.log("\n----------9----------");
q9();
console.log("\n----------10----------");
q10();
