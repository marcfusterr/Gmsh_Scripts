// Created by Marc Fuster

lc=0.1;  //Length of the points, reduce to refine mesh.
R=2.; //Radius of the circle

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

Physical Surface ("Circle", 1) = {6};

