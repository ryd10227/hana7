const assert = require("assert");

// id를 부여해서 실행하는 findId 함수를 작성하시오.

const hong = { id: 1, name: "Hong" };
const kim = { id: 2, name: "Kim" };
const lee = { id: 3, name: "Lee" };
const park = { id: 4, name: "Park" };
const users = [hong, kim, lee, park];

const find3 = (a) => a.id === 3;
const idxId2 = users.findIndex(find3);

console.log(idxId2);

const findId = (pid) => (a) => a.id === pid;

function f(pid) {
  return function (a) {
    return a.id === pid;
  };
}

Array.prototype.push = function (x) {
  this[this.length] = x;
};
users.push({ id: 100, name: "킹 세종" });

console.log("🚀 ~ users:", users);

//forEach는 return을 안 함, map은 함
Array.prototype.forEach = function (f) {
  for (let i = 0; i < this.length; i++) {
    f(this[i], i, this);
  }
};

// js 내부에서 이렇게 구현돼있음
// 화살표함수 안 쓰는 이유는 this를 Array prototype과 바인딩하기 위해
Array.prototype.map = function (f) {
  const results = [];
  for (let i = 0; i < this.length; i++) {
    results[i] = f(this[i], i, this);
  }
  return results;
};

// 위에서 커스텀한 map 사용
const ids = users.map((a) => a.id);
console.log("🚀 ~ ids:", ids);

const ff = f(2);
console.log("🚀 ~ ff:", ff(1));

const idxId11 = users.findLastIndex(findId(4));
console.log("🚀  idxId11:", idxId11);

Array.prototype.mapBy = function (k) {
  const results = [];
  for (let i = 0; i < this.length; i++) {
    results.push(this[i][k]);
  }
  return results;
};

const ids2 = users.mapBy("id");
console.log("🚀 ~ ids2:", ids2);

const names = users.mapBy("name");
console.log("🚀 ~ names:", names);

Array.prototype.filter = function (f) {
  const results = [];
  for (let i = 0; i < this.length; i++) {
    if (f(this[i], i, this)) results.push(this[i]);
  }
  return results;
};

const oddIds = users.filter((a) => a.id % 2);
console.log("🚀 ~ oddIds:", oddIds);

const arr2 = [1, 2, 3, 4, 5];

const a1 = arr2.slice(1, 3);
console.log("🚀 ~ a1:", a1);

// 3부터 끝까지 다 추출
const a2 = arr2.slice(2);
console.log("🚀 ~ a2:", a2);

// splice는 제거하고, 제거한 걸 반환. 2번째 인자가 개수를 나타내니 유의
const d3 = arr2.splice(1, 3);
console.log("🚀 ~ d3:", d3, "d3이 삭제된 배열: ", arr2);

arr2.splice(1, 0, ...d3);
console.log("🚀 ~ arr2:", arr2);

// 3부터 끝까지 제거
const d5 = arr2.splice(2);
console.log("🚀 ~ arr2:", arr2);

// 복원
arr2.splice(2, 0, ...d5);
console.log("🚀 복원 ~ arr2:", arr2);

// [ 1,   2, 'X', 'Y', 'Z', 4, 5 ] 만들기
arr2.splice(2, 100, "X", "Y", "Z", 4, 5);
console.log("🚀 ~ arr2:", arr2);

arr2.splice(2, 3, 3);
console.log("🚀 ~ arr2:", arr2);

arr2.splice(2, 1, "X", "Y", "Z");
console.log("🚀 ~ arr2:", arr2);

// 를 splice 안 쓰고 해보기. splice는 비순수함수이기 때문.
const arr3 = [1, 2, 3, 4, 5];
const a8 = [...arr3.slice(0, 2), "X", "Y", "Z", ...arr3.slice(-2)];
console.log("🚀 ~ a8:", a8);
// assert.deepStrictEqual(a8, [1, 2, "X", "Y", "Z", 4, 5]);

// js의 reduce는 return값을 acc에 저장하기 때문에 따로 acc += acc*2 이렇게 할당해주지 않아도 됨
