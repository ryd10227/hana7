const assert = require("assert");

// 모든 Array가 다음 기능을 갖도록 구현하세요.
// 1) mapBy(), findBy(), filterBy(), rejectBy(), sortBy()
// 2) firstObject, lastObject

Object.defineProperty(Array.prototype, "len", {
  get: function () {
    return this.length;
  },
});

Object.defineProperties(Array.prototype, {
  firstObject: {
    get() {
      return this[0];
    },
    set(value) {
      this[0] = value;
    },
  },
  lastObject: {
    get() {
      return this.at(-1);
    },
    set(value) {
      this[this.length - 1] = value;
    },
  },
});

const arr = [1, 2, 3, 4, 5];
const hong = { id: 1, name: "Hing" };
const kim = { id: 2, name: "Kim" };
const lee = { id: 3, name: "Lee" };
const users = [hong, lee, kim];

Array.prototype.mapBy = function (key) {
  return this.map((a) => a[key]);
};

Array.prototype.filterBy = function (key, value, isInclude) {
  if (isInclude) {
    return this.filter((a) => a[key].includes(value));
  } else {
    return this.filter((a) => a[key] === value);
  }
};

Array.prototype.rejectBy = function (key, value, isInclude) {
  if (isInclude) {
    return this.filter((a) => !a[key].includes(value));
  } else {
    return this.filter((a) => a[key] !== value);
  }
};

Array.prototype.findBy = function (key, value) {
  return this.find((a) => a[key] === value);
};

Array.prototype.sortBy = function (prop) {
  const [key, direction = "asc"] = prop.split(":");
  if (direction === "desc") {
    return this.sort((a, b) => (a[key] > b[key] ? -1 : 1));
  } else {
    return this.sort((a, b) => (b[key] > a[key] ? -1 : 1));
    return this.sort((a, b) => a[key] - b[key]); // a[key]의 값이 Number가 아니면 작동 안 함
  }
};

assert.deepStrictEqual([arr.firstObject, arr.lastObject], [1, 5]);
assert.deepStrictEqual(users.firstObject, hong);
assert.deepStrictEqual(users.lastObject, kim);

assert.deepStrictEqual(users.mapBy("id"), [1, 3, 2]);
assert.deepStrictEqual(users.mapBy("name"), ["Hing", "Lee", "Kim"]);
assert.deepStrictEqual(users.filterBy("id", 2), [kim]);
assert.deepStrictEqual(users.filterBy("name", "i", true), [hong, kim]); // key, value일부, isInclude
assert.deepStrictEqual(users.rejectBy("id", 2), [hong, lee]);
assert.deepStrictEqual(users.rejectBy("name", "i", true), [lee]);
assert.deepStrictEqual(users.findBy("name", "Kim"), kim);
assert.deepStrictEqual(users.sortBy("name:desc"), [lee, kim, hong]);
assert.deepStrictEqual(users.sortBy("name"), [hong, kim, lee]);

users.firstObject = kim;
assert.deepStrictEqual(users.firstObject, kim);
users.lastObject = hong;
assert.deepStrictEqual(users.lastObject, hong);
