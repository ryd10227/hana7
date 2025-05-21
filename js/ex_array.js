const assert = require("assert");

function q1() {
  // 원래 js 인터페이스와 다르게 순수함수임
  function push(array, ...args) {
    return [...array, ...args];
  }

  const pop = (array, count) => (count ? array.slice(-count) : array.at(-1));

  const arr = [1, 2, 3, 4];

  const unshift = (array, ...args) => [...args, ...array];

  const shift = (array, count = 1) => [
    array.slice(0, count),
    array.slice(count),
  ];
  console.log(shift(arr));

  assert.deepStrictEqual(push(arr, 5, 6), [1, 2, 3, 4, 5, 6]);
  assert.deepStrictEqual(pop(arr), 4);
  assert.deepStrictEqual(pop(arr, 2), [3, 4]); // 2개 팝!
  assert.deepStrictEqual(unshift(arr, 0), [0, 1, 2, 3, 4]);
  assert.deepStrictEqual(unshift(arr, 7, 8), [7, 8, 1, 2, 3, 4]);
  assert.deepStrictEqual(shift(arr), [[1], [2, 3, 4]]); // [shift되는 원소들, 남은 원소들]
  assert.deepStrictEqual(shift(arr, 2), [
    [1, 2],
    [3, 4],
  ]); // 2개 shift
  assert.deepStrictEqual(arr, [1, 2, 3, 4]);
}

// deleteArray() 함수를 순수함수로 작성하시오
function q2() {
  const arr = [1, 2, 3, 4];

  //   const deleteArray = (arr, ...args) => arr.slice(0, ...args);
  //   assert.deepStrictEqual(deleteArray(arr, 2), [1, 2]); // 2부터 끝까지 지우고 나머지 리턴

  //   const deleteArray = (arr, start, end) =>
  //     arr.filter((_, i) => i < start || i >= end);

  //   assert.deepStrictEqual(deleteArray(arr, 1, 3), [1, 4]); // 1부터 3미만까지 지우고 나머지 리턴
  //   assert.deepStrictEqual(arr, [1, 2, 3, 4]);

  const Hong = { id: 1, name: "Hong" };
  const Kim = { id: 2, name: "Kim" };
  const Lee = { id: 3, name: "Lee" };
  const users = [Hong, Kim, Lee];

  //   const deleteArray = (arr, ...args) =>
  //     arr.filter((user) => user !== arr.slice(...args)[0]);
  //   assert.deepStrictEqual(deleteArray(users, 2), [Hong, Kim]);
  //   assert.deepStrictEqual(deleteArray(users, 1, 2), [Hong, Lee]);

  //   const deleteArray = (arr, prop, value) =>
  //     arr.filter((user) => user[prop] !== value);
  //   assert.deepStrictEqual(deleteArray(users, "id", 2), [Hong, Lee]);
  //   assert.deepStrictEqual(deleteArray(users, "name", "Lee"), [Hong, Kim]);
}

// 아래 users 배열에 대하여 추가/수정/삭제하는 순수 함수를 작성하시오.
function q3() {
  const hong = { id: 1, name: "Hong" };
  const choi = { id: 5, name: "Choi" };
  const kim = { id: 2, name: "kim" };
  const lee = { id: 3, name: "Lee" };
  const park = { id: 4, name: "Park" };
  const users = [kim, lee, park]; // 오염되면 안됨!!

  const addUser = (user) => [...users, user];
  assert.deepStrictEqual(addUser(hong), [kim, lee, park, hong]);
  assert.deepStrictEqual(users, [kim, lee, park]);

  //   const removeUser = (user) => users.filter((u) => u !== user);
  const removeUser = ({ id: pid }) => users.filter(({ id }) => id !== pid);
  assert.deepStrictEqual(removeUser(lee), [kim, park]);
  assert.deepStrictEqual(users, [kim, lee, park]);

  //   const changeUser = (...user) => {
  //     const [userBefore, userAfter] = user;
  //     return [userAfter, ...users].filter((user) => user !== userBefore);
  //   };

  // 3명이 들어가고 3명이 나오니까 map으로
  const changeUser = (before, after) =>
    users.map((user) => (user.id === before.id ? after : user));

  assert.deepStrictEqual(changeUser(kim, choi), [choi, lee, park]);
  assert.deepStrictEqual(users, [kim, lee, park]);
}

// ex1) 배열의 각 원소를 String으로 변환하시오.
function q4() {
  const arr = [1, 2, 3, true];

  //   const ret1 = arr.map((n) => String(n)); // String(n)
  const ret1 = arr.map(String); // String(n)

  assert.deepStrictEqual(ret1, ["1", "2", "3", "true"]);
}

// ex2) 다음과 같이 작동하는 classNames 함수를 작성하시오.
function q5() {
  //   const classNames = (...args) => args.filter((arg) => arg !== "").join(" ");
  //   const classNames = (...args) => args.filter((arg) => !!arg).join(" ");
  //   const classNames = (...args) => args.filter((arg) => Boolean(arg)).join(" ");
  const classNames = (...args) => args.filter(Boolean).join(" ");

  const ret2 = classNames("", "a b c", "d", "", "e");

  assert.strictEqual(ret2, "a b c d e");
  //   주의: ' a b c d  e'면 안됨!!
  // cf. example in React
  // <div classNames=({x ? 'a b' : ''}, {'' ? 'c' : ''}, {z && 'e f'})
}

// Array.reduce 함수를 고차 함수로 직접 구현하시오.
function q6() {
  const kim = { id: 2, name: "kim" };
  const lee = { id: 3, name: "Lee" };
  const park = { id: 4, name: "Park" };
  const users = [kim, lee, park];

  // reduce( acc, fn, accInitialValue )
  // fn의 결과값이 acc에 쌓이고, acc가 return됨
  const reduce = (arr, fn, initValue = "") => {
    arr[0] = fn(arr[0], initValue);
    for (let i = 1; i < arr.length; i++) {
      arr[0] = fn(arr[0], arr[i]);
    }
    return arr[0];
  };

  // 강사님 ver
  //   const reduce = (arr, fn, initValue) => {
  //     let i = 0;
  //     let acc = initValue ?? (i++, arr[0]);
  //     for (; i < arr.length; i++) {
  //       acc = fn(acc, arr[i], i, arr);
  //     }
  //     return acc;
  //   };

  reduce([1, 2, 3], (a, b) => a + b, 0); // 6이면 통과!
  reduce([1, 2, 3, 4, 5], (a, b) => a + b); // 15면 통과!
  reduce([1, 2, 3, 4, 5], (a, b) => a * b, 1); // 120이면 통과!
  reduce([2, 2, 2], (a, b) => a * b); // 8이면 통과!
  reduce([3, 3, 3], (a, b) => a * b, 0); // 0이면 통과!
  reduce(users, (acc, user) => acc + user.name); // [object Object]LeePark

  const a10 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  //   assert.deepStrictEqual(
  //     reduce(a10, (acc, cur) => acc + cur, 0),
  //     a10.reduce((acc, cur) => acc + cur, 0)
  //   );

  //   assert.deepStrictEqual(
  //     reduce(users, (acc, user) => acc + user.name),
  //     users.reduce((acc, user) => acc + user.name)
  //   );

  //   assert.deepStrictEqual(
  //     reduce(a10, (acc, cur) => acc + cur, 0),
  //     a10.reduce((acc, cur) => acc + cur, 0)
  //   );
  //   assert.deepStrictEqual(
  //     reduce(a10, (acc, cur) => acc + cur),
  //     a10.reduce((acc, cur) => acc + cur)
  //   );
  //   assert.deepStrictEqual(
  //     reduce([1, 2, 3, 4, 5], (a, b) => a * b, 1),
  //     [1, 2, 3, 4, 5].reduce((a, b) => a * b, 1)
  //   );

  //   assert.deepStrictEqual(
  //     reduce(users, (acc, user) => acc + user.name),
  //     users.reduce((acc, user) => acc + user.name)
  //   );
}

function q7() {
  // 다음과 같은 정수 배열이 주어졌을 때, reduce를 이용하여, 각 요소를 다음의 순서로 처리하시오. (1회전으로 처리!)
  //  → 배열의 각 요소를 제곱   n => n ** 2            [square]
  //  → 배열 각 요소의 제곱근   n => Math.sqrt(n)      [sqrt]
  //  → 배열의 각 요소를 세제곱  n => n ** 3            [cube]

  const square = (n) => n ** 2;
  //   const sqrt = (n) => Math.sqrt(n);
  const sqrt = Math.sqrt;
  const cube = (n) => n ** 3;

  const arr = [1, 2, 3, 4, 5];
  //   cf.arr
  // .map((a) => a ** 2)
  // .map((a) => Math.sqrt(a))
  // .map((a) => a ** 3);
  // ⇒⇒⇒ 결과 => [ 1, 8, 27, 64, 125 ]
  // TryThis. 수행 순서를 자유롭게 변경하도록 해보세요.
  //   [square, sqrt, cube].reduce;
  //   [(cube, square, sqrt)].reduce;
}

function q8() {
  const range = (start, end, step = start > end ? -1 : 1) => {
    if (start === end || step === 0) return [start];
    // if (start > end && step > 0) return [];
    // if (start < end && step < 0) return [];
    if ((start - end) * step > 0) return [];

    if (end === undefined) {
      if (start > 0) {
        end = start;
        start = 1;
      } else if (start < 0) {
        end = -1;
      } else {
        return [0];
      }
    }

    const result = [];
    for (let i = start; start > end ? i >= end : i <= end; i += step) {
      result.push(i);
    }

    return result;
  };
  assert.deepStrictEqual(range(1, 10, 1), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  assert.deepStrictEqual(range(1, 10, 2), [1, 3, 5, 7, 9]);
  assert.deepStrictEqual(range(1, 10), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  assert.deepStrictEqual(range(10, 1), [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);

  assert.deepStrictEqual(range(5, 5, 0), [5]);
  assert.deepStrictEqual(range(1, 5, 0), [1]);
  assert.deepStrictEqual(range(5, 5, -1), [5]);
  assert.deepStrictEqual(range(5, 5), [5]);
  assert.deepStrictEqual(range(0, 0, 5), [0]);
  assert.deepStrictEqual(range(1, 5, -1), []);

  assert.deepStrictEqual(range(1, 5, 6), [1]);
  assert.deepStrictEqual(range(0, 5), [0, 1, 2, 3, 4, 5]);
  assert.deepStrictEqual(range(-3, 0), [-3, -2, -1, 0]);

  assert.deepStrictEqual(range(5, 1, 1), []);
  assert.deepStrictEqual(range(0, -1), [0, -1]);
  assert.deepStrictEqual(range(0, -3), [0, -1, -2, -3]);
  assert.deepStrictEqual(range(5, 1), [5, 4, 3, 2, 1]);
  assert.deepStrictEqual(range(10, 1, -2), [10, 8, 6, 4, 2]);

  assert.deepStrictEqual(range(5), [1, 2, 3, 4, 5]);
  assert.deepStrictEqual(range(0), [0]);
  assert.deepStrictEqual(range(0, 0), [0]);
  assert.deepStrictEqual(range(2, 1, -5), [2]);
  assert.deepStrictEqual(range(0, -1, -5), [0]);
  assert.deepStrictEqual(range(-5), [-5, -4, -3, -2, -1]);
  assert.deepStrictEqual(
    range(50),
    Array.from({ length: 50 }, (_, i) => i + 1)
  );
  assert.deepStrictEqual(
    range(1, 150, 3),
    Array.from({ length: 50 }, (_, i) => i * 3 + 1)
  );
}

function q9() {
  const keyPair1 = (arr, sum) => {
    for (let i = 0; i < arr.length; i++) {
      for (let j = i + 1; j < arr.length; j++) {
        if (arr[i] + arr[j] === sum) return [i, j];
      }
    }
  };

  const keyPair = (arr, sum) => {
    const cache = {};
    for (let i = 0; i < arr.length; i++) {
      const value = arr[i];
      if (cache[value]) return [cache[value], i];
      cache[sum - value] = i;
    }
  };

  assert.deepStrictEqual(keyPair([1, 3, 4, 5], 7), [1, 2]);
  assert.deepStrictEqual(keyPair([1, 4, 45, 6, 10, 8], 16), [3, 4]);
  assert.deepStrictEqual(keyPair([1, 2, 4, 3, 6], 10), [2, 4]);
  assert.deepStrictEqual(keyPair([1, 2, 3, 4, 5, 7], 9), [3, 4]);
}

// console.log("\n----------1----------");
// q1();
// console.log("\n----------2----------");
// q2();
// console.log("\n----------3----------");
// q3();
// console.log("\n----------4----------");
// q4();
// console.log("\n----------5----------");
// q5();
// console.log("\n----------6----------");
// q6();
// console.log("\n----------7----------");
// q7();
// console.log("\n----------8----------");
// q8();
console.log("\n----------9----------");
q9();
