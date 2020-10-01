config var vecLen: int = 1024*1024;
config var iterCount: int = 1024;

use Random;
use BlockDist;
use Math;
use Time;
var watch: Timer;

proc apply(spArr, unaryOp)
{
    forall a in spArr do
        a = unaryOp(a);
}

proc unaryOp(a: real)
{
  return sqrt(a*a);
}

proc main() {
  var D = {0..#vecLen, 0..#vecLen} dmapped Block({0..#vecLen,0..#vecLen});
  var spD: sparse subdomain(D);
  var X: [D] real;
  fillRandom(X);

  watch.start();
  for i in 0..iterCount do
    apply(X, unaryOp);
  watch.stop();

  var elapsed: real = watch.elapsed();
  writeln(elapsed);
  // writeln("For vecLen=", vecLen, " with iterCount=", iterCount, " totaly spent total=", elapsed, ", in average for each iter iterAvg=", elapsed/iterCount);
}
