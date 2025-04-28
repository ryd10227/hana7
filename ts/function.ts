function add(a: number, b: number) {
  return a + b;
}

const s: string = "abc";

function factorial(n: number): number {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

const fac = (n: number) => {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
};

function tfn(this: { id: number }, x: string) {
  console.log(this.id, x);
}

tfn.bind({ id: 1 })("X");

const t = setTimeout(console.log, 1000, "1");

type ASDF = {
  [k: string]: string | number;
  // [k: number]: number; //key값은 number를 넣어도 string으로 처리되기 때문에 [k: number] ... 는 의미가 없는 코드
};

let asdf: ASDF = { 3: 6, "7": 9 };
