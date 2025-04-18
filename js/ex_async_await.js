// 특정 유저의 정보와 게시글 목록을 리턴하는 함수를 작성하시오.
//  - 예) 1번 유저의 정보: https://jsonplaceholder.typicode.com/users/1
//  - 예) 1번 유저의 글목록: https://jsonplaceholder.typicode.com/posts?userId=1
const URL = "https://jsonplaceholder.typicode.com";

const fetchJP = (url) => fetch(url).then((res) => res.json());

const getUserInfo = (userId) => fetchJP(`${URL}/users/${userId}`);

const getPostsByUserId = (userId) => fetchJP(`${URL}/posts?userId=/${userId}`);

const getUserPosts = async (userId) => {
  //   const { id, name } = await getUserInfo(userId);
  //   const posts = await getPostsByUserId(userId);
  // await await 은 성능 저하. -> Promise.all을 써야 함

  const [{ id, name }, post] = await Promise.all([
    getUserInfo(userId),
    getPostsByUserId(userId),
  ]);

  //   console.log(userInfo, post);

  return {
    id: id,
    name: name,
    posts: post.map(({ id, title, body }) => ({ id, title, body })),
  };
};

//   ⇒ 다음 형식으로 리턴 (format 준수!)
// {
//     id: 유저ID,
//     name: 유저명,
//     posts: [
//         {id: 글ID, title: 글제목, body: 글내용},
//         // {...
//         ]
//     }
// }
const userInfo = await getUserInfo(1);
// console.log("🚀 ~ userInfo:", userInfo);
const userPosts = await getUserPosts(1);
// console.log("🚀 ~ userPosts:", userPosts);

console.log({ id: userInfo.id, name: userInfo.name, posts: userPosts });

try {
  console.log(await getUserPosts(1));
} catch (err) {
  console.error("에러", err);
}
