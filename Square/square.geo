// Created by Marc Fuster

lc=0.5;  //Length of the points, reduce to refine mesh.
L=10; //Edge length

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
Plane Surface(101) = {1} ;

Physical Surface ("Square", 1) = {101};










