const assert = require("assert");

function q1() {
  const total = { price: 45000, vat: 4500 };

  console.log(fmt`주문총액: ${total.price}원`);
  console.log(fmt`세액총액: ${total.vat}원`);

  function fmt(texts, value) {
    console.log(texts, value);
    return `${texts[0]}${value.toLocaleString().padStart(8, "_")}${texts[1]}`;
  }
}

function q2() {
  const upperToLower = (str) =>
    str.replace(/[A-Z]/g, (foundString) => foundString.toLowerCase());

  const lowStr = upperToLower("Senior Coding Learning JS");
  console.log(lowStr);
}

function q3() {
  const swapCase1 = (str) => {
    const upperToLower = (str) =>
      str.replace(/[A-Z]/g, (foundString) => foundString.toLowerCase());

    const lowerStr = upperToLower(str);

    const lowerToUpper = (str) =>
      str.replace(/[a-z]/g, (foundString) => foundString.toUpperCase());

    const upperStr = lowerToUpper(str);

    for (i in str) {
      if (str[i] === upperStr[i]) {
        str = str.replace(str[i], lowerStr[i]);
      } else {
        str = str.replace(str[i], upperStr[i]);
      }
    }

    return str;
  };

  // 최대한 적게 찾는 것
  const swapCase = (str) =>
    str?.replace(
      /([A-Z]+)([a-z]*)/g,
      (foundStr, upper, lower) => `${upper.toLowerCase()}${lower.toUpperCase()}`
    );

  assert.equal(
    swapCase("Senior Coding Learning JS"),
    "sENIOR cODING lEARNING js"
  );
  //   assert.equal(swapCase("Hanaro 7 Class"), "hANARO 4 cLASS");
}

function q4() {
  const telfmt = (telNo) => {
    const len = telNo?.length;
    if (len <= 7) return;

    if (len === 8) return `${telNo.substring(0, 4)}-${telNo.substring(4)}`;

    const first = len > 11 ? 4 : telNo.startsWith("02") ? 2 : 3;
    const middle = len - first - 4;
    const last = 4;

    const reg = new RegExp(`(\\d{${first}})(\\d{${middle}})(\\d{${last}})`);

    return telNo.replace(reg, "$1-$2-$3");
  };

  assert.deepStrictEqual(telfmt("15771577"), "1577-1577");
  assert.deepStrictEqual(telfmt("0101234567"), "010-123-4567");
  assert.deepStrictEqual(telfmt("01012345678"), "010-1234-5678");
  assert.deepStrictEqual(telfmt("0212345678"), "02-1234-5678");
  assert.deepStrictEqual(telfmt("021234567"), "02-123-4567");
  assert.deepStrictEqual(telfmt("0331234567"), "033-123-4567");
  assert.deepStrictEqual(telfmt("07012341234"), "070-1234-1234");
  assert.deepStrictEqual(telfmt("050712345678"), "0507-1234-5678");
  // return;
}

// console.log("\n----------1----------");
// q1();
// console.log("\n----------2----------");
// q2();
// console.log("\n----------3----------");
// q3();
console.log("\n----------4----------");
q4();
