pragma circom 2.1.4;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

include "../node_modules/circomlib/circuits/comparators.circom";

template Equality() {
   signal input a[3];
   signal output c;
   
   // cant use c <== (a[0] == a[1]) && (a[1] == a[2]); as its not a quadratic constraint
   
   signal t1 <== a[0] - a[1];
   signal t2 <== a[1] - a[2];

   component z1 = IsZero();
   z1.in <== t1;

   component z2 = IsZero();
   z2.in <== t2;

   c <== z1.out * z2.out;
}

component main = Equality();
