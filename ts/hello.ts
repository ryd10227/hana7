const myname: string = "seoyeon";
console.log("hello, ", myname);

type SomeType = {
  id: number | string;
  name: string;
  age: number;
  address: string;
};

const something = ({ id, name, age, address }: SomeType) => {
  console.log(id, name, age, address);
};

const user = { id: "1", name: "seoyeon", age: 5, address: "Seoul" };

something(user);

type Member = {
  name: string;
  addr: string;
  discountRate: number;
};
type Guest = {
  name: string;
  age: number;
};

type Customer = Member | Guest;

let cust: Customer;
let m: Member;
let g: Guest;

cust = { name: "ㅎ호ㅇ", addr: "용", discountRate: 40 };
m = cust;

cust = { name: "ㅎ호ㅇ", age: 40 };
g = cust;
