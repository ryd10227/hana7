const DC_RATE = 0.5;

function discount() {
  const dcRate = 0.5;
  return function (price) {
    return price * dcRate;
  };
}

const discount2 = () => (price) => price * DC_RATE;

const MENU = { chinese: ["짜장면", "탕수육"], italian: ["피자", "파스타"] };

function restaurant(kind) {
  const menu = MENU[kind];
  return function (menuIndex) {
    return menu[menuIndex];
  };
}

const lunch = restaurant("chinese");
console.log(lunch(0));

const dinner = restaurant("italian");
console.log(dinner(0), dinner(1));

// 출입자 수를 게이트별로 구하는 함수 작성
function getCounter() {
  let currCount = 0;
  return {
    plus() {
      currCount += 1;
    },
    minus() {
      currCount -= 1;
    },
    count() {
      return currCount;
    },
  };
}

class Counter {
  #currCount = 0;
  plus() {
    this.#currCount += 1;
  }
  minus() {}
}

const gate1 = getCounter();
const gate2 = getCounter();

gate1.plus();
gate2.plus();
gate2.minus();

console.log("gate1>>", gate1.count());
console.log("gate2>>", gate2.count());

function factorial(n) {
  if (n === 1) return 1;
  return n * factorial(n - 1);
}

function factorial_TCO(n, acc = 1) {
  if (n === 1) return acc;
  return factorial_TCO(n - 1, acc * n);
}

console.log(factorial_TCO(3));

const factorial3 = factorial(3);
console.log("🚀 ~ factorial3:", factorial3);

let n = 3;
let sum = 1;
for (let i = n; i > 0; i -= 1) {
  sum = sum * i;
}
