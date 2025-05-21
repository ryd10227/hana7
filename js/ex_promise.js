const assert = require("assert");

// 다음 코드를 Promise를 이용하여 refactoring 하시오.
function q1() {
  setTimeout(function () {
    console.log("depth1", new Date());
    setTimeout(function () {
      console.log("depth2", new Date());
      setTimeout(function () {
        console.log("depth3", new Date());
        throw new Error("Already 3-depth!!");
      }, 3000);
    }, 2000);
  }, 1000);

  console.log("START!", new Date());

  //   depthTimer(1).then(depthTimer).then(depthTimer).catch(console.error);

  // refactor
  const depthTimer = (sec) => {
    console.log("depthTimer sec", sec);
    return new Promise((resolve) =>
      setTimeout(() => resolve(sec + 1), sec * 1000)
    );
  };

  depthTimer(1)
    .then((res) => {
      console.log(res);
      return depthTimer(res);
    })
    .then(depthTimer)
    .catch((err) => console.error(err));

  // const r1 = await depthTimer(1);
}

const randTime = (value) =>
  new Promise((resolve) => setTimeout(resolve, 1000 * Math.random(), value));

// 다음 코드에서 promiseAll 함수를 직접 작성하시오.
function q2() {
  //promise를 여러 개 받아서 return하는
  const promiseAll = (promises) =>
    new Promise((resolve, reject) => {
      const results = [];
      for (let i = 0; i < promises.length; i++) {
        let runCnt = 0;
        promises[i]
          .then((res) => {
            results[i] = res;
            runCnt += 1;
            if (promises.length === runCnt) {
              resolve(results);
            }
          })
          .catch(reject);
      }
    });

  console.time("X");

  promiseAll([randTime(1), randTime(2), randTime(3)])
    .then((arr) => {
      console.table(arr);
      assert.deepStrictEqual(arr, [1, 2, 3]);
      console.timeEnd("X");
    })
    .catch(console.error);

  promiseAll([randTime(11), Promise.reject("RRR"), randTime(33)])
    .then((array) => {
      console.log("여긴 과연 호출될까?!", array);
    })
    .catch((error) => {
      console.log("reject!!!!!!>>", error);
    });
}

function q3() {
  const allSettledResults = [
    {
      status: "fulfilled",
      value: 11,
    },
    {
      status: "rejected",
      reason: "RRR",
    },
    {
      status: "fulfilled",
      value: 33,
    },
  ];

  const promiseAllSettled = (promises) =>
    new Promise((resolve) => {
      const results = [];
      let runCnt = 0;
      for (let i = 0; i < promises.length; i++) {
        promises[i]
          .then((value) => {
            const status = "fulfilled";
            results[i] = { status, value };
          })
          .catch((reason) => {
            const status = "rejected";
            results[i] = { status, reason };
          })
          .finally(() => {
            if (++runCnt === promises.length) {
              resolve(results);
            }
          });
      }
    });

  promiseAllSettled([randTime(11), Promise.reject("RRR"), randTime(33)])
    .then((array) => {
      console.table(array);
      console.log(JSON.stringify(array, null, "  "));
      console.log("여긴 과연 호출될까?!");
      assert.deepStrictEqual(array, allSettledResults);
    })
    .catch((error) => {
      console.log("reject!!!!!!>>", error);
    });
}

// console.log("\n----------1----------");
// q1();
// console.log("\n----------2----------");
// q2();
console.log("\n----------3----------");
q3();
