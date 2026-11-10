import { describe, expect, it } from "vitest";
import { add } from "../src/index.js";

describe("Basic", () => {
  it("adds two numbers", () => {
    expect(add(2, 3)).toBe(5);
  });
});
