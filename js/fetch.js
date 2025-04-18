const sampleUrl = "https://jsonplaceholder.typicode.com/users/1";
// const myFetch = (url) => fetch(url).then((res) => res.json());

fetch(sampleUrl)
  .then((res) => {
    console.log("🚀 ~ res:", res);
    return res.json();
  })
  .then((data) => console.log(data));

const myFetchAsync = async (url) => {
  const res = await fetch(url);
  const data = await res.json();
  return data; //data를 return해도 Promise객체가 반환됨
};

const res2 = await myFetchAsync(sampleUrl);
console.log(res2);
