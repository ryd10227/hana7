// 1 ~ n까지의 원소로 이루어진 배열을 만드는 함수를 재귀함수로 작성하시오. Loop 안 됨.
// (단, array 메소드를 사용하지 말고, destructuring을 사용하시오)
function q1() {
  function makeArray(n) {
    if (n === 1) return [1];
    return [...makeArray(n - 1), n];
  }
  console.log(makeArray(10));
}

function q2() {
  function makeReverseArray(n) {
    if (n === 1) return [1];
    return [n, ...makeReverseArray(n - 1)];
  }
  console.log(makeReverseArray(10));
}

function q3() {
  function makeArrayTCO(n, acc = []) {
    if (n === 1) return [1, ...acc];
    return makeArrayTCO(n - 1, [n, ...acc]);
  }
  console.log(makeArrayTCO(10));
}

// 피보나치 수열을 Loop를 이용하여 작성하시오.
// [0, 1, 1, 2, 3, 5, 8, 13, 21, 34];
function q4() {
  function loopFibonacci(n) {
    let fibonacciArr = [];

    for (let i = 0; i < n; i += 1) {
      if (i <= 1) {
        fibonacciArr.push(i);
        continue;
      }

      fibonacciArr.push(fibonacciArr[i - 1] + fibonacciArr[i - 2]);
    }

    return fibonacciArr[n - 1];
  }
  console.log(loopFibonacci(5));
}

// 피보나치 수열을 재귀함수만을 이용하여 작성하시오.
// [0, 1, 1, 2, 3, 5, 8, 13, 21, 34];
function q5() {
  function recurFibonacci(n, i = n, acc = []) {
    if (n < 0) return acc[i];

    const index = i - n;

    if (index <= 1) {
      return recurFibonacci(n - 1, i, [...acc, index]);
    } else {
      return recurFibonacci(n - 1, i, [
        ...acc,
        acc[index - 1] + acc[index - 2],
      ]);
    }
  }
  console.log(recurFibonacci(7));
}

// 피보나치 수열을 memoized 함수를 이용하여 작성하시오.
// [0, 1, 1, 2, 3, 5, 8, 13, 21, 34];
function q6() {
  function memoFibonacci() {}
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
