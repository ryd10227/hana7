import type { Meta, StoryObj } from "@storybook/react";
import ColorTitle from "./ColorTitle";

const meta: Meta<typeof ColorTitle> = {
  title: "컬러타이틀 스토리북",
  component: ColorTitle,
  tags: ["autodocs"],
};

type Story = StoryObj<typeof meta>;

export const BigTitle: Story = {
  args: {
    size: "lg",
    color: "red",
    children: "큰 타이틀",
  },
};

export const SmallTitle = {
  args: {
    size: "sm",
    color: "blue",
    children: "작은타이틀",
  },
};

export default meta;
