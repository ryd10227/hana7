import type { Meta, StoryObj } from "@storybook/react";
import { Button } from "./Button";

const meta: Meta<typeof Button> = {
  title: "MyButton",
  component: Button,
  tags: ["autodocs"],
};

type Story = StoryObj<typeof meta>;

export const Primary: Story = {
  args: {
    variant: "primary",
    size: "md",
    onClick: () => alert("primary story test"),
    children: "asdfasdf",
  },
};

export const Danger: Story = {
  args: {
    variant: "danger",
    size: "lg",
    children: "dan",
    onClick: () => alert("danger~~~~~~~~~~~"),
  },
};

export default meta;
