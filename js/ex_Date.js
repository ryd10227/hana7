// 1970년 1월 1일과 1970년 1월 2일의 차이를 초로 나타내시오.
function q1() {
  const now = new Date();
  now.setTime(0);
  console.log("🚀 d:", now);

  const time1 = now.getTime();
  now.setDate(5);
  console.log("🚀 d:", now, (now.getTime() - time1) / 1000);
}

// 이 달의 날짜 5개를 무작위로 만들어 역순으로 정렬하시오.
// 중복 제거, 2025-04-16 형식으로 출력
function q2() {
  const rand = (s, e) => s + Math.floor((e - s + 1) * Math.random());

  const today = new Date();
  today.setMonth(today.getMonth() + 1);
  today.setDate(0);

  const lastDayOfThisMonth = today.getDate();
  console.log(lastDayOfThisMonth);

  const days = [];

  do {
    const r = rand(1, lastDayOfThisMonth);
    if (!days.includes(r)) days.push(r);
  } while (days.length < 5);

  console.log(days.sort((a, b) => b - a));

  //   for (let i = 0; i < 5; i++) {
  //     days.push(rand(1, lastDayOfThisMonth));
  //   }

  const yyyy = today.getFullYear();
  const mm = (today.getMonth() + 1).toString().padStart(2, 0);

  const result = days.map(
    (day) => `${yyyy} - ${mm} - ${day.toString().padStart(2, 0)}`
  );

  console.log(result);
}

// 내년(2026년) 오늘의 요일을 출력하시오.
function q3() {
  const today = new Date();
  today.setFullYear(today.getFullYear() + 1);
  console.log("일월화수목금토"[today.getDay()]);
}

// 오늘로 부터 100일 후의 날짜는?
function q4() {
  const today = new Date();
  today.setDate(today.getDate() + 100 - 1);
  console.log("🚀 ~ q4 ~ today:", today);
}

console.log("\n----------1----------");
q1();
// console.log("\n----------2----------");
// q2();
// console.log("\n----------3----------");
// q3();
// console.log("\n----------4----------");
// q4();
