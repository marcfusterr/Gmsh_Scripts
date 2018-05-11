// Created by Marc Fuster

lc=0.2;  //Length of the points, reduce to refine mesh.
R=0.25; //Radius of the circle
L=1.0; //Length of the cylinder

Point(1) = {0,0,-L/2,lc};

Point(2) = {R,0,-L/2,lc};
Point(3) = {0,R,-L/2,lc};
Point(4) = {-R,0,-L/2,lc};
Point(5) = {0,-R,-L/2,lc};

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


