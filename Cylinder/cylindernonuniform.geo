// Created by Marc Fuster

lc=0.5;  //Length of the points, reduce to refine mesh.
R=1.; //Radius of the circle
L=3.; //Length of the cylinder
refinementdistance=2.; // Reduce to increase the refinement area.
refinementdensity=10.; // Increase to increase the local refinement density.

Point(1) = {0,0,0,lc};

Point(2) = {R,0,0,lc};
Point(3) = {0,R,0,lc};
Point(4) = {-R,0,0,lc};
Point(5) = {0,-R,0,lc};

Circle(1) = {2,1,3};
Circle(2) = {3,1,4};
Circle(3) = {4,1,5};
Circle(4) = {5,1,2};

Line Loop(5) = {1,2,3,4};
Plane Surface(6) = {5};

Extrude {0,0,L} {
  Surface{6};
}

Physical Volume("Cylinder", 1) = {1};

// #################################################################
// #                        Refining part                          #
// #################################################################

Point(20) = {0, 0,  L, lc} ;

Line(1001) = {1, 20};

Field[1] = Attractor;
//list of the points where to have a higher density

//list of lines where to have a higher density 
Field[1].EdgesList = {1001};  

Field[2] = Threshold;
Field[2].IField = 1;
Field[2].LcMin = lc / refinementdensity;
Field[2].LcMax = lc;
Field[2].DistMin = lc / refinementdistance;
Field[2].DistMax = 2.*lc;

// Use minimum of all the fields as the background field
Field[11] = Min;
Field[11].FieldsList = {2,3};
Background Field = 11;



