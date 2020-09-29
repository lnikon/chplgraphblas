use BlockDist;


// These functions are taken from "Towards a GraphBLAS Library in Chapel. Ariful Azad, Aydın Buluc",
// https://crd.lbl.gov/assets/Uploads/GraphBLAS-Chapel.pdf 

proc Apply1(spArr, unaryOp)
{
    forall a in spArr do
        a = unaryOp(a);
}

proc Apply2(spArr, unaryOp)
{
    var locArrs = spArr._value.locArr;
    coforall locArr in locArrs do
    on locArr {
        forall a in locArr!.myElems._value do
            a = unaryOp(a);
    }
}
// End of functions

proc UnaryOp1(a: int)
{
    return a+1;
}

proc main()
{
    var n = 6;
    var D = {0..n-1, 0..n-1} dmapped Block({0..n-1,0..n-1});

    var spD: sparse subdomain(D);
    spD = ((0,0), (2,3));
    var A: [spD] int;

    for (i,j) in spD {
        A(i,j) = i*j + 1;
    }

    for (i,j) in spD {
        write(A(i,j), " ");
        if (j == n) then writeln();
    }
    writeln();

    // Apply1(A, UnaryOp1);
    Apply2(A, UnaryOp1);
    
    for (i,j) in spD {
        write(A(i,j), " ");
        if (j == n) then writeln();
    }
    writeln();
}
