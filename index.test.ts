import { describe, it, expect } from 'vitest';
import { sum } from './index.js';

describe('sum', () => {
  it('adds 1 + 2 to equal 3', () => {
    expect(sum(1, 2)).toBe(3);
  });

  it('adds negative numbers correctly', () => {
    expect(sum(-1, -2)).toBe(-3);
  });

  it('adds floating point numbers correctly', () => {
    expect(sum(0.1, 0.2)).toBeCloseTo(0.3);
  });
});
