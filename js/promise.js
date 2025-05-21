// Promise 구현

class Promise {
  constructor(nbfn) {
    // this.nbfn = nbfn;
    nbfn(this.runSuccess.bind(this), this.runFail.bind(this));
  }

  runSuccess(ret) {
    this.thenFn(ret);
  }

  runFail(err) {
    this.catchFn(err);
  }

  then(f) {
    this.thenFn = f;
    return this;
  }

  catch(errFn) {
    this.catchFn = errFn;
  }
}
const promi = (delay) =>
  new Promise((resolve, reject) => {
    setTimeout(reject, delay, "error!");
  });

// promi(1000, () => console.log("done!"));
promi(1000).then(console.log).catch(console.log);
