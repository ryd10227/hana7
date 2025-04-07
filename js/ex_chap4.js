// 1.
for (let i = 0.1; i < 1; i = i + 0.1) {
  console.log(i.toFixed(1));
}

// 2.
for (let i = 1; i <= 10; i++) {
  const sqrtt = Math.sqrt(i).toFixed(3);
  if (sqrtt.toString().endsWith("000")) {
    continue;
  } else {
    console.log(sqrtt);
  }
}

// 3.
// 문자열 + 연산보다는 string 리터럴로 변경
const WEEK_NAMES = "일월화수목금토";
const today = new Date().getDay();
// console.log("오늘은 " + WEEK_NAMES[day] + "요일입니다.");
console.log(`오늘은 ${WEEK_NAMES[today]}요일입니다.`);

// 4.
function addPoints(a, b) {
  a = a / 10;
  b = b / 10;
  return (a + b) * 10;
}

addPoints1(0.21354, 0.1); // 0.31354
addPoints1(0.14, 0.28); // 0.42
addPoints1(0.34, 0.226); // 0.566
addPoints1(10.34, 200.226); // 210.566
addPoints1(0.143, -10.28); // -10.137
addPoints1(0.143, -10); // -9.857

//////////////// 풀이 ////////////////

// 1.
// +i 또는 Number(i)로 형변환
// toFixed()가 string을 return하기 때문
for (let i = 0; i < 1; i = i + 0.1) {
  console.log(+i.toFixed(1));
}

// 2.
// i++ 보다 i += 1 이 명확함
for (let i = 1; i <= 10; i += 1) {
  const root = Math.sqrt(i);
  if (root % 1) {
    console.log(i, root.toFixed(3));
  }
}

// 4.
function addPoints1(a, b) {
  const p = 10 ** 15;
  // 또는 p = 10 ** 10;

  const a_int = a * p;
  const b_int = b * p;

  const result = Math.trunc(a_int + b_int) / p;

  console.log(`${a} + ${b} = ${result}`);
}

// 4.
// for ... of 는 values를 반복
function addPoints2(...args) {
  p = 10 ** 10;

  let result = 0;

  for (const n of args) {
    result += Math.trunc(n * p);
  }

  result = result / p;

  console.log(`${args[0]} + ${args[1]} = ${result}`);
}
