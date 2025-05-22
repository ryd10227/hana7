import { PropsWithChildren } from 'react';

export default function HelloLayout({ children }: PropsWithChildren) {
  return (
    <>
      <h1>Hello Layout</h1>
      <hr />
      <div>{children}</div>
    </>
  );
}
