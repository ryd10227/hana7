import assert from "assert";
import moment from "moment";
import { aaf, PI } from "./aa.js";
// const assert = require("assert");

const hello = "Hello Module";

assert.equal(hello, "Hello Module");

console.log(hello, moment().startOf("day").fromNow());

console.log(aaf());

console.log(PI);

export { PI };
