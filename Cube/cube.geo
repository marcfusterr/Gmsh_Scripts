// Created by Marc Fuster

lc=8.0;  //Length of the points, reduce to refine mesh.
L=100.0; // Edge length

// lower surface
Point(1) = {L/2, L/2, -L/2, lc};
Point(2) = {L/2, -L/2, -L/2, lc} ;
Point(3) = {-L/2, L/2, -L/2, lc} ;
Point(4) = {-L/2, -L/2,-L/2, lc} ;

Line(1) = {1,2} ;
Line(2) = {2,4} ;
Line(3) = {4,3} ;
Line(4) = {3,1} ;

Line Loop(1) = {1,2,3,4} ; 

Plane Surface(1) = {1} ;

//uper surface
Point(5) = {L/2, L/2, L/2, lc};
Point(6) = {L/2, -L/2, L/2, lc} ;
Point(7) = {-L/2, L/2, L/2, lc} ;
Point(8) = {-L/2, -L/2, L/2, lc} ;

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
Physical Volume ("Cube", 1) = {101};




