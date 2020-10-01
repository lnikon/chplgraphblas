config var vecLen: int = 1024*1024;
config var iterCount: int = 1024;

use Random;
use Math;
use Time;
var watch: Timer;

proc nrm2(X: [?DX] real)
{
  var sum: real = 0;
  forall xi in X with (ref sum) do
    sum += xi*xi;
  
  return sqrt(sum);
}

proc main() {
  var X: [0..vecLen] real;
  fillRandom(X);

  watch.start();
  for i in 0..iterCount do
    var nrm2X = nrm2(X);
  watch.stop();

  var elapsed: real = watch.elapsed();
  writeln(elapsed);
  // writeln("For vecLen=", vecLen, " with iterCount=", iterCount, " totaly spent total=", elapsed, ", in average for each iter iterAvg=", elapsed/iterCount);
}
