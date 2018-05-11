SetFactory("OpenCASCADE");
// Created by Marc Fuster

lc=0.2;//Length of the points, reduce to refine mesh.
R=0.5; //Larger radius
r=0.2; //Smaller radius

Torus(1) = {0, 0, 0, R, r, 2*Pi};
// Torus creates a circle

Physical Volume ("Seds", 1) = {1};

//+
Circle(3) = {0, 0, 0, R, 0, 2*Pi};


//Field[1] = Attractor;
//list of the points where to have a higher density

//list of lines where to have a higher density 
//Field[1].EdgesList = {3};  

//Field[2] = Threshold;
//Field[2].IField = 1;
//Field[2].LcMin = lc / 2.;
//Field[2].LcMax = lc;
//Field[2].DistMin = lc / 2.;
//Field[2].DistMax = 2.*lc;

// Use minimum of all the fields as the background field
//Field[11] = Min;
//Field[11].FieldsList = {2,3};
//Background Field = 11;

