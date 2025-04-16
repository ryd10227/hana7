const assert = require("assert");

// 다음과 같이 부서와 직원 객체가 있을 때, deptMap과 empDept를 만들고, 개발팀 직원 이름 목록을 출력하시오. (key: id)
function q1() {
  const hrTeam = { id: 1, dname: "인사팀" };
  const devTeam = { id: 2, dname: "개발팀" };
  const depts = [hrTeam, devTeam];
  const hong = { id: 1, name: "Hong", dept: 1 }; // hong.dept.dname ⇒ deptMap.get(hong.dept)?.dname
  const kim = { id: 2, name: "Kim", dept: 2 };
  const emps = [
    hong,
    kim,
    { id: 3, name: "Park", dept: 2 },
    { id: 4, name: "Choi", dept: 2 },
  ];

  // const deptMap = new Map()([
  //   [1, hrTeam],
  //   [2, devTeam],
  // ]);

  const deptMap = new Map(depts.map((dept) => [dept.id, dept]));

  const empMap = new Map(emps.map((emp) => [emp.id, emp]));

  const empDept = new Map(
    emps.map((emp) => {
      const tmpDept = emp.dept;
      delete emp.dept;
      return [emp, deptMap.get(tmpDept)];
    })

    //   emps.map(({ id, name, dept }) => [{ id, name }, deptMap.get(dept)])
  );

  console.log(deptMap); // Map(2) { 1 => { id: 1, dname: '인사팀' }, 2 => { id: 2, dname: '개발팀' } }  ⇐ deptMap.get(2)
  console.log(empMap); // Map(2) { 1 => {id: 1, name: 'Hong', dept: 1}, 2 => {id: 2, name: 'Kim', dept: 2}, … }
  console.log(empDept); // Map(4) { { id: 1, name: 'Hong' } => { id: 1, dname: '인사팀' }, { id: 2, name: 'Kim' } => { id: 2, dname: '개발팀' }, { id: 3, name: 'Park' } => { id: 2, dname: '개발팀' }, { id: 4, name: 'Choi' } => { id: 2, dname: '개발팀' } }

  console.log(empDept.get(kim).dname); // '개발팀'
  // 개발팀 직원 목록 출력 ⇒ Kim, Park, Choi

  assert.deepStrictEqual(
    [...empDept.keys()],
    emps.map(({ id, name }) => ({ id, name }))
  );
  assert.strictEqual(empDept.get(kim)?.dname, devTeam.dname);
}

// 이전 Array.prototype에 Set을 이용하여 uniqBy() 함수도 추가하시오.
function q2() {
  Array.prototype.uniqBy = function (prop) {
    // 중복을 없애고 (Set) 자료형을 배열로 바꿔줌 [... ]
    return [...new Set(this.map((a) => a[prop]))];
  };

  const hong = { id: 1, name: "Hong", dept: "HR" };
  const kim = { id: 2, name: "Kim", dept: "Server" };
  const lee = { id: 3, name: "Lee", dept: "Front" };
  const park = { id: 4, name: "Park", dept: "HR" };
  const ko = { id: 7, name: "Ko", dept: "Server" };
  const loon = { id: 6, name: "Loon", dept: "Sales" };
  const choi = { id: 5, name: "Choi", dept: "Front" };
  const users = [hong, kim, lee, park, ko, loon, choi];
  const uniqDepts = users.uniqBy("dept"); // [ 'HR', 'Server', 'Front', 'Sales' ]

  assert.deepStrictEqual(uniqDepts, ["HR", "Server", "Front", "Sales"]);
}

// console.log("\n----------1----------");
// q1();
console.log("\n----------2----------");
q2();

console.log(
  "🚀 ~ MAX_SAFE_INTEGER:",
  Math.abs(Boolean({})),
  Boolean({ sdf: 12 })
);
