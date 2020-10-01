config var vecLen: int = 1024*1024;
config var iterCount: int = 1024;

use Random;
use Time;
var watch: Timer;

proc dot(X: [?DX] real, Y: [?DY] real)
{
  var sum: real = 0;
  forall (xi, yi) in zip(X, Y) with (ref sum) do
    sum += xi*yi;
  
  return sum;
}

proc main() {
  var X: [0..vecLen] real;
  fillRandom(X);
  var Y: [0..vecLen] real;
  fillRandom(Y);

  watch.start();
  for i in 0..iterCount do
    var dotXY = dot(X, Y);
  watch.stop();

  var elapsed: real = watch.elapsed();
  writeln(elapsed);
  // writeln("For vecLen=", vecLen, " with iterCount=", iterCount, " totaly spent total=", elapsed, ", in average for each iter iterAvg=", elapsed/iterCount);
}
