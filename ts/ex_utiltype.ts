interface IUser {
    id: number;
    age: number;
    name: string;
}

interface IDept {
    id: number;
    age: string;
    dname: string;
    captain: string;
}

type Combine<T, U> = < 이 부분을 작성하세요 >
type ICombineExclude 
        = CombineExclude<IUser, IDept, 'name' | 'dname'>;
