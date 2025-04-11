function q1() {
  const dog = {
    name: "Maxx",
    showMyName() {
      console.log(`My name is ${this.name}.`);
    },
    whatsYourName() {
      setTimeout(this.showMyName.bind(this), 1000);
      setTimeout(() => this.showMyName(), 1500);
    },
  };

  dog.whatsYourName();
}

function q2() {
  const debounce = (cb, delay) => {
    let timer;
    return (...args) => {
      if (timer) clearTimeout(timer);
      timer = setTimeout(cb, delay, ...args);
    };
  };
  //   debounce();

  const throttle = (cd, delay) => {
    let timer;
    return (...args) => {
      if (timer) return;
      timer = setTimeout(cb, delay, ...args);
      timer = null;
    };
  };
}

function q3() {
  // 오른쪽과 같이 함수를 한번만 실행하는 once 함수를 작성하시오.

  const once = (fn) => {
    let hasDone = false;
    return (...args) => {
      if (hasDone) return;
      hasDone = true;
      return fn(...args);
    };
  };

  const fn = once((x, y) => `금일 운행금지 차량은 끝번호 ${x}, ${y}입니다!`);
  console.log(fn(1, 6)); // 금일 운행금지 차량은 끝번호 1, 6입니다!
  console.log(fn(2, 7)); // undefined
  console.log(fn(3, 8)); // undefined

  function fivePart(x, y) {
    return `fivePart ${x}, ${y}, id: ${this.id}`;
  }

  //오른쪽
  const fnx = once(fivePart.bind({ id: 11 }));
  console.log(fnx(1, 2));
  const fn2 = once(fivePart);
  console.log(fn2.bind({ id: 22 })(3, 4));

  const onceAgain = (fn, rebirthDelay) => {
    let hasDone = false;

    return (...args) => {
      if (hasDone) return;
      done = true;

      setTimeout(() => (done = !done), rebirthDelay);
      return fn(...args);
    };
  };

  const fn1sec = onceAgain(fivePart, 1000);

  let cnt = 0;
  setInterval(() => console.log(`${++cnt / 10}초`, fn1sec(cnt, 0.1), 100));
  // 매 n초 후 다시 한번 실행할 수 있도록 개선해보세요.
  // (test 요령: 0.1초 한 번씩 - setInterval - 실행하게 해놓고, 1초 후에 초기화)
}

function q4() {
  const before = () => console.log("before....");
  const after = (result) => console.log("after...", result);

  const someFn = (name, greeting) => `${greeting}, ${name}`;
  const someFn2 = (id, nickname, email, level) =>
    `${id}/${nickname}/${email}/${level}`;

  // 코드를 완성하세요.
  const template = (fn) => {
    return (...args) => {
      before();

      setTimeout(() => {
        after(fn(...args));
      }, 1000);

      return fn(...args); // ?
    };
  };

  const temp = template(someFn); // before → someFn → after 실행
  const temp2 = template(someFn2); // before → someFn2 → after 실행

  console.log("temp1>>", temp("sico", "hello"));
  console.log("temp2>>", temp2(1, "sico", "sico@gmail.com", 5));
}

// getNextWeek 함수는 widx변수에 부수 효과(side effect)가 있다.
// 이를 부수 효과가 없도록 변경하시오. (hint: closure, IIFE)
function q5() {
  const getNextWeek = (() => {
    const weeks = ["일", "월", "화", "수", "목", "금", "토"];
    return (...args) => `${weeks[args]}요일`;

    // 강사님 풀이
    // let widx = -1;
    // return () => `${weeks[++widx]}요일`;
  })();

  let cnt = 0;

  const intl = setInterval(() => {
    // 강사님 풀이
    // console.log("call", cnt, getNextWeek());
    console.log("call", cnt, getNextWeek(cnt));
    if ((cnt += 1) === 7) clearInterval(intl);
  }, 1000);
}

function q6() {
  class Dog {
    constructor(name) {
      this.name = name;
    }

    getName() {
      return this.name;
    }

    fn() {
      return "FN";
    }

    static sfn() {
      // Dog.sfn
      return "SFN";
    }
  }
  const lucy = new Dog("Lucy");
  const { sfn } = Dog;
  const { fn } = Dog.prototype;
  const { name: aa, fn: fnnn, getName } = lucy;

  console.log(aa, sfn(), fnnn(), getName);
  console.log(getName.apply(lucy));
}

console.log("\n----------1----------");
q1();
console.log("\n----------2----------");
q2();
console.log("\n----------3----------");
// q3();
console.log("\n----------4----------");
q4();
console.log("\n----------5----------");
q5();
console.log("\n----------6----------");
q6();
