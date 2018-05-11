// Created by Marc Fuster

lc=0.5;  //Length of the points, reduce to refine mesh.
L=2*3.1415; //Edge length
refinementdistance=0.5; // Reduce to increase the refinement area.
refinementdensity=4.; // Increase to increase the local refinement density.

// lower surface
Point(1) = {0, 0, 0, lc};
Point(2) = {L, 0,  0, lc} ;
Point(3) = {0, L, 0, lc} ;
Point(4) = {L, L, 0, lc} ;
//to refine
Point(10) = {L/2, L/2, 0, lc} ;

Line(1) = {1,2} ;
Line(2) = {2,4} ;
Line(3) = {4,3} ;
Line(4) = {3,1} ;

Line Loop(1) = {1,2,3,4} ; 
Plane Surface(101) = {1} ;

Physical Surface ("Square", 1) = {101};


Field[1] = Attractor;
//list of the points where to have a higher density

//list of lines where to have a higher density 
Field[1].NodesList = {10};  

Field[2] = Threshold;
Field[2].IField = 1;
Field[2].LcMin = lc / refinementdensity;
Field[2].LcMax = lc;
Field[2].DistMin = lc / refinementdistance;
Field[2].DistMax = 2.*lc;

// Use minimum of all the fields as the background field
Field[11] = Min;
Field[11].FieldsList = {2,3,4};
Background Field = 11;

