#      Plaque name: COMS10mm
#
#   Copyright (C) 2021, Rowan M Thomson
#
# This file is part of the egs_brachy package to be used with EGSnrc
#
#  egs_brachy is free software: you can redistribute it and/or modify it
#  under the terms of the GNU Affero General Public License as published
#  by the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  egs_brachy is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Affero General Public License for more details:
#  <http://www.gnu.org/licenses/>.
#
# If you use this file, please cite
#       M Chamberland, R E P Taylor, D W O Rogers and R M Thomson
#       egs_brachy: a versatile and fast Monte Carlo code for brachytherapy
#       Phys Med Biol 61(2016) 8214 - 8231
# and
#      H Safigholi, Z Parsons, S G Deering, and R M Thomson,
#     Update of the CLRP eye plaque brachytherapy database for
#     photon-emitting sources, Medical Physics 48(2021) 3373 - 3383.
#
#
:start geometry definition:

    :start geometry:
        name = two_spheres
        library = egs_spheres
        midpoint = 0,0,0
        radii = 1.455, 1.505

        :start media input:
            media = SILASTIC, MODULAY
            set medium = 0 0
            set medium = 1 1
        :stop media input:
    :stop geometry:

    :start geometry:
        name = middle_sphere
        library = egs_spheres
        midpoint = 0,0,0
        radii = 1.455

        :start media input:
            media = SILASTIC
            set medium = 0 0
        :stop media input:
    :stop geometry:

    :start geometry:
        name = middle_cylinder
        library = egs_cylinders
        type = EGS_ZCylinders
        radii = 0.550

        :start media input:
            media = MODULAY
            set medium = 0 0
        :stop media input:
    :stop geometry:

    :start geometry:
        name = middle
        library = egs_gunion
        geometries = middle_sphere middle_cylinder
    :stop geometry:

    :start geometry:
        name = coll_lip_cylinders
        library = egs_cylinders
        type = EGS_ZCylinders
        radii = 0.500, 0.550

        :start media input:
            media = SILASTIC, MODULAY
            set medium = 0 0
            set medium = 1 1
        :stop media input:
    :stop geometry:

    :start geometry:
        name = plaque_planes
        library = egs_planes
        type = EGS_Zplanes
        positions =  -1.505, -1.400901495, -1.366391232, -1.123788236   
         		 
    :stop geometry:

    :start geometry:
        name = plaque_not_hollow
        library = egs_cdgeometry
        base geometry = plaque_planes
        set geometry = 0 two_spheres
        set geometry = 1 middle
        set geometry = 2 coll_lip_cylinders
    :stop geometry:

    :start geometry:
        name = base_sphere
        library = egs_spheres
        type = shell
        radii = 1.23, 1.505
    :stop geometry:

    :start geometry:
        name = the_plaque
        library = egs_cdgeometry
        base geometry = base_sphere
        set geometry = 0 plaque_not_hollow
    :stop geometry:

    simulation geometry = the_plaque

:stop geometry definition:

:start view control:
    xmin = -2
    xmax = 2
    ymin = -2
    ymax = 2
    zmin = -2
    zmax = 2
:stop view control:
