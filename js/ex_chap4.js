function q1() {
  for (let i = 0.1; i < 1; i = i + 0.1) {
    // console.log(i.toFixed(1));
    // FIXME: +i 또는 Number(i)로 형변환. toFixed()가 string을 return하기 때문
    console.log(+i.toFixed(1));
  }
}

function q2() {
  // for (let i = 1; i <= 10; i++) {
  // FIXME: i++ 보다 i += 1 이 명확함
  for (let i = 1; i <= 10; i += 1) {
    const root = Math.sqrt(i);

    if (root % 1) {
      console.log(i, root.toFixed(3));
    }
  }
}

function q3() {
  const WEEK_NAMES = "일월화수목금토";
  const today = new Date().getDay();

  // console.log("오늘은 " + WEEK_NAMES[day] + "요일입니다.");
  // FIXME: 문자열 + 연산보다는 템플릿 리터럴로
  console.log(`오늘은 ${WEEK_NAMES[today]}요일입니다.`);
}

function q4() {
  function addPoints(a, b) {
    a = a / 10;
    b = b / 10;
    console.log((a + b) * 10);
  }

  function addPoints1(a, b) {
    const p = 10 ** 15; // 또는 p = 10 ** 10;

    const a_int = a * p;
    const b_int = b * p;

    const result = Math.trunc(a_int + b_int) / p;

    console.log(`${a} + ${b} = ${result}`);
  }

  function addPoints2(...args) {
    const p = 10 ** 10;

    let result = 0;

    // for ... of 는 iterable 객체의 values를 반복
    for (const n of args) {
      result += Math.trunc(n * p);
    }

    result = result / p;

    console.log(`${args[0]} + ${args[1]} = ${result}`);
  }

  addPoints2(0.21354, 0.1); // 0.31354
  addPoints2(0.14, 0.28); // 0.42
  addPoints2(0.34, 0.226); // 0.566
  addPoints2(10.34, 200.226); // 210.566
  addPoints2(0.143, -10.28); // -10.137
  addPoints2(0.143, -10); // -9.857
}

function q5() {
  const prices = [
    10.34,
    "xxx",
    5.678,
    null,
    20.9,
    1.005,
    0,
    17,
    undefined,
    "0.5",
  ];

  function avgPoints(...args) {
    let sum = 0;
    let count = 0;

    const DECIMAL_POINT = 2;
    const P = 10 ** DECIMAL_POINT;

    for (const arg of args) {
      if (isNaN(arg) || arg === null) continue;

      sum += arg * P;
      count++;
    }

    // const answer = (sum / count).toFixed(decimalPoint)
    // FIXME: toFixed() 안 쓰고?
    const answer = Math.trunc(sum / count) / P;

    console.log(answer);
  }

  avgPoints(...prices);
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
