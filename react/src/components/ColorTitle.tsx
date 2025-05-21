import type { CSSProperties, PropsWithChildren } from "react";

type Props = {
  color: string;
  size: "sm" | "md" | "lg";
};

const sizeVariant: Record<Props["size"], CSSProperties> = {
  sm: { fontSize: "1rem" },
  md: { fontSize: "1.3rem" },
  lg: { fontSize: "1.7rem" },
};

const ColorTitle = ({ color, size, children }: PropsWithChildren<Props>) => {
  const style = Object.assign({}, sizeVariant[size], { color });

  return <h2 style={style}>{children}</h2>;
};

export default ColorTitle;
