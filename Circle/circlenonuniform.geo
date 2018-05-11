// Created by Marc Fuster

lc=0.2;  //Length of the points, reduce to refine mesh.
R=1.; //Radius of the circle
refinementdistance=0.75; // Reduce to increase the refinement area.
refinementdensity=5.; // Increase to increase the local refinement density.

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

Physical Surface ("Seds", 1) = {6};

// #################################################################
// #               Refine a Point and or a line                    #
// #################################################################



Field[1] = Attractor;
//list of the points where to have a higher density
Field[1].NodesList = {1};
//list of lines where to have a higher density 
 

Field[2] = Threshold;
Field[2].IField = 1;
Field[2].LcMin = lc / refinementdensity;
Field[2].LcMax = lc;
Field[2].DistMin = lc / refinementdistance;
Field[2].DistMax = 2.*lc;


// #################################################################
// #                       Join all Fields                         #
// #################################################################


// Use minimum of all the fields as the background field
Field[11] = Min;
Field[11].FieldsList = {2};
Background Field = 11;

