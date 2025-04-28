type Xid = { id: number };
type Xname = { name: string } & Xid;
type Xage = { age: number } & Xid;
type X = Xname | Xage;
type Y = Xname & Xage;
type Z = string & number;

type P = Xid | (Xname & Xage);
type Q = Xid & (Xname | Xage);

let xx: X = { name: "Hong", id: 1 };

xx = { age: 33, id: 1 };

let yy: Y = { name: "Hong", age: 33, id: 3 };

let pp: P = { id: 1 };

pp = { id: 1, name: "asdf", age: 3 };

let qq: Q = { id: 2, age: 33 };

// type TT = { id: number; name?: string };

interface TT {
  readonly id: number;
  name?: string;
}

let tt: TT = { id: 1 };
// tt.id = 100;
tt.name?.toUpperCase();

interface globalThis {
  x: string;
}

function f(this: globalThis) {
  console.log(this.x);
}

// f.bind(globalThis){

// }
export {};
