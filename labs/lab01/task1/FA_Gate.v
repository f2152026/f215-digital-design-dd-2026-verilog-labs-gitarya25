// FA_Gate.v
// Gate-level model of a 1-bit full adder. No delays yet -- that starts in
// Task 2. This task is purely about gate ordering.
//
// Part (a): leave this file exactly as it is, compile, and simulate.
// Part (b): AFTER completing part (a), come back and reorder the five gate
//           instantiations below into any different sequence, then
//           re-simulate with the same tb.v and compare.

module FA_Gate(
  input  a,
  input  b,
  input  cin,
  output sum,
  output cout
);
  wire ps, pc1, pc2;

or #(2) (cout, pc1, pc2);
and #(2) (pc2,  cin, ps);
xor #(2) (sum,  cin, ps);
and #(2) (pc1,  a,   b);
xor #(2) (ps,   a,   b);




endmodule

/*
Task 1 answer:
In part (b), reordering the gate instantiations does not change the final
logic or waveform behavior, because Verilog gate primitives are executed concurrenttly. 
They are not executed sequentially like C/C++ statements.

In part (c), adding gate delays does change the timing of the waveform.
The final sum and cout values are still the correct full-adder truth-table values,
but internal signals and outputs settle after delays.
*/