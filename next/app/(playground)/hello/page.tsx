export const dynamic = 'force-dynamic';

const Hello = () => {
  const d = new Date();
  return (
    <h3 className='font-bold'>
      Hello Page <strong>{`${d}`}</strong>
    </h3>
  );
};

export default Hello;
