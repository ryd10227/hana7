console.log("1", zz);
// let, const는 freshness 상태가 있음.
// 값은 undefined인데 내부적으로는 unInitializedYet 상태.
// 뒤에 Initialize 할 것.
// 본인 scope의 최상단에 선언부만 올림
// (if, while 등) 블록이 실행될 수도 있고 안 될 수도 있기 때문에 실행될 때 인정을 받는다

// var는 undefined 상태로 올라가고
// let, const는 unInitializedYet 상태로 올라감.


zz = 9; // 암묵적 var
console.log(zz);
console.log(globalThis["zz"]);

console.log(this);
// console.log(globalThis);
// 노드에서는 전역객체를 global, 브라우저에서는 window라고함
// 이걸 통일한 게 globalThis

var zz = undefined;

let num = 99;
// 최상단에 let num;이 올라가고 . undefined인데 내부적으로는 not Initialized yet 상태 == 호이스팅
// 밑에 원래위치에 let num = 99; 에서 num = 99;로 남음