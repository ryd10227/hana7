// 특정 함수의 인자 타입을 추출하는 유틸리티 타입을 작성하시오. (infer)

function add(a: number, b: string, c: boolean) {
  return `${a} - ${b} + ${c}`;
}

type A = FirstArgs<typeof add>; // number
type B = SecondArgs<typeof add>; // string
type C = Args<typeof add>; // number | string

type AX = Args<typeof String.prototype.endsWith>;
// ⇒ string | number | undefined
type BX = Args<typeof String.prototype.charAt>;
// ⇒ number

type FirstArgs<F> = F extends (first: infer First, ...rest: any) => any
  ? First
  : never;
type SecondArgs<F> = F extends (first: any, second: infer Second) => any
  ? Second
  : never;
type Args<F> = F extends (...args: infer P) => any ? P[number] : never;

type MyFirstArgs<F> = F extends (...args: infer U) => any ? U[0] : never;
type MySecondArgs<F> = F extends (...args: infer U) => any ? U[1] : never;
type MyArgs<F> = F extends (args: infer U) => any ? U : never;
