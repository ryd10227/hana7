function trycatch() {
  try {
    throw new Error("error!");
  } catch (err) {
    console.log(err);
  } finally {
    console.log("finally");
  }
}

const promiseThrow = () =>
  new Promise((resolve, reject) => {
    try {
      //setTimeout은 Task Queue에 들어갔다가 try-catch문이 다 실행되고 나서 실행됨
      setTimeout(() => {
        reject(new Error("setTimeout 오류났어요 "));
      }, 1000);
      throw new Error("error!");
    } catch (err) {
      console.log(err);
    } finally {
      console.log("finally");
    }
  });

// promiseThrow()
//   .then(console.log)
//   .catch((err) => console.log("Promise catch", err));

const asyncThrow = async () => {
  try {
    throw new Error("오류또남");
  } catch (err) {
    console.error(err);
  } finally {
    console.log("finally");
  }
};

// asyncThrow();

const afterTime = (sec) =>
  new Promise((resolve) => setTimeout(resolve, sec * 1000, sec));

// console.time("maptime");
// const mapResult = [1, 2, 3].map(async (val, idx) => {
//   const r = await afterTime(val);
//   console.log(r, idx);
//   if (idx === 2) console.timeEnd("maptime", idx);
//   return r;
// });

// console.log(mapResult);

// 다음과 같이 출력되도록 병렬 실행하는 코드를 작성하시오.
// const odds = await Promise.all([1, 2, 3].map((val) => afterTime(val))).filter(
//   (val) => val % 2
// );
// console.log("odds=", odds);
// 왜 2는 짝수인데 출력될까?

// const rrr = ;
// console.log('odds=', rrr);

const f = async () => {
  const res = await fetch("https://jsonplaceholder.typicode.com/users/1");

  if (!res.ok) throw new Error("Failt to Fetch!!");

  // <2초 sleep하도록 이 부분을 작성해 보세요!>
  await new Promise((resolve) => setTimeout(resolve, 2000));

  const data = await res.json();

  return data.name;
};

console.log(await f());
