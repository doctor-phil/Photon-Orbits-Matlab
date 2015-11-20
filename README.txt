This code numerically estimates a solution to the differential equation which determines the curvature of the
path of a light beam as it travels around a black hole. The algorithm first finds 300 orbits which begin at (3,0)
and intersect the line x=-2. The points of intersection are recorded and used to recursively define points which
begin their journey on the line x=2 and curve around the hole to converge at the point (-3,0). The goal is to find
a relationship between the directional angle alpha from the horizontal where the photon leaves the initial line
and the value of y on which the particle begins its journey. Values of alpha and y are calculated and plotted.