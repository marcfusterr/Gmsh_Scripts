// Created by Marc Fuster

lc=0.1;  //General mesh density, reduce to refine mesh.
L=1.; // Edge length
refinementdistance=2.; // Reduce to increase the refinement area.
refinementdensity=10.; // Increase to increase the local refinement density.

// lower surface
Point(1) = {0, 0, 0, lc};
Point(2) = {L, 0,  0, lc} ;
Point(3) = {0, L, 0, lc} ;
Point(4) = {L, L, 0, lc} ;

Line(1) = {1,2} ;
Line(2) = {2,4} ;
Line(3) = {4,3} ;
Line(4) = {3,1} ;

Line Loop(1) = {1,2,3,4} ; 

Plane Surface(1) = {1} ;

//uper surface
Point(5) = {0, 0, L, lc};
Point(6) = {L, 0,  L, lc} ;
Point(7) = {0, L, L, lc} ;
Point(8) = {L, L, L, lc} ;

Line(5) = {5,6} ;
Line(6) = {6,8} ;
Line(7) = {8,7} ;
Line(8) = {7,5} ;

Line Loop(2) = {5,6,7,8} ; 
// minus since line2 is 3-2 and not 2-3
Plane Surface(2) = {2} ;


//join both surface

Line(9) = {1,5} ;
Line(10) = {2,6} ;
Line(11) = {3,7} ;
Line(12) = {4,8} ;

Line Loop(3) = {9,5,-10,-1};  Plane Surface(3) = {3};
Line Loop(4) = {2,12,-6,-10}; Plane Surface(4) = {4};
Line Loop(5) = {3,11,-7,-12}; Plane Surface(5) = {5};
Line Loop(6) = {-4,11,8,-9};  Plane Surface(6) = {6};

Surface Loop(100) = {1,2,3,4,5,6};
Volume(101) = {100};
Physical Volume ("Cube", 1) = {101}; // This line is necessary for 
 
// #################################################################
// #               Refine a Point and or a line                    #
// #################################################################

// points to increase density
Point (11) = {0.5*L,L,0.5*L,lc};

Field[1] = Attractor;
//list of the points where to have a higher density
Field[1].NodesList = {11};
//list of lines where to have a higher density 
Field[1].EdgesList = {9};  

Field[2] = Threshold;
Field[2].IField = 1;
Field[2].LcMin = lc / refinementdensity;
Field[2].LcMax = lc;
Field[2].DistMin = lc / refinementdistance;
Field[2].DistMax = 2.*lc;

// #################################################################
// #           Refine a rectangle and or a solid box               #
// #################################################################

Field[3] = Box;
Field[3].VIn = lc / 10;
Field[3].VOut = lc;
Field[3].XMin = 0.25;
Field[3].XMax = 0.75;
Field[3].YMin = 0.25;
Field[3].YMax = 0.75;
Field[3].ZMin = 1.; 
Field[3].ZMax = 1.;

//by setting Min=Max in 1 dimension, we get a rectangle
//if for all dimensions Min different Max, one gets
//a solid cube

// #################################################################
// #                       Join all Fields                         #
// #################################################################


// Use minimum of all the fields as the background field
Field[11] = Min;
Field[11].FieldsList = {2,3};
Background Field = 11;



