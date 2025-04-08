// 이 user 객체를 받아서 id와 name을 출력하는 함수를 작성하시오.
function q1() {
  const user = { id: 1, name: "Hong", addr: { city: "Seoul" } };
  const hong = { id: 1, name: "Hong" };
  const lee = { id: 2, name: "Lee" };

  function f1(userInfo) {
    const { id, name } = userInfo;
    console.log(id, name);
  }

  function f2({ id, name }) {
    console.log(id, name);
  }

  f1(hong);
  f2(lee);
}

// 다음 user 객체에서 passwd 프로퍼티를 제외한 데이터를 userInfo 라는 변수에 할당하시오.
function q2() {
  const user = { id: 1, name: "Hong", passwd: "xxx", addr: "Seoul" };

  const { passwd, ...userInfo } = user;

  console.log(userInfo);
}

// 다음 arr에서 3개의 id를 id1, id2, id3로 할당하시오.
function q3() {
  const arr = [[{ id: 1 }], [{ id: 2 }, { id: 3 }]];

  const [[{ id: id1 }], [{ id: id2 }, { id: id3 }]] = arr;

  console.log(id1, id2, id3);
}

console.log("\n----------1----------");
q1();
console.log("\n----------2----------");
q2();
console.log("\n----------3----------");
q3();
