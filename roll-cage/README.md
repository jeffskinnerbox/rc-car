<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.0.1
-->

![work-in-progress](http://worktrade.eu/img/uc.gif "These materials require additional work and are not ready for general use.")

---

# HexBar Structural Framing System
This project originated from a plan to create an OpenSCAD script
to construct a roll cage for a radio controlled (RC) car.
I wanted the roll-cage design to easily conform to the irregular shape of the RC cars body,
be adjustable for adaptations like holding/housing cameras & sensors,
and of course be mechanically strong to protest the electrical components of the RC car.

## Hexagonal Bar Structural Framing System
I refer to this computer aided design (CAD) tools as a "HexBar Structural Framing System".
The CAD tool used is [OpenSCAD][02], an open source constructive solid geometry (CSG)
CAD modeling tool.
The term [structural system][01] or structural frame in structural engineering
refers to the load-resisting sub-system of a building or object.
The purpose of a structural system is to transfers loads through interconnected elements or members.
HexBar because the primary elements of the framing system are hexagon shape bars.

## Framing System Elements
Hex Bar
3-way corner brackets - https://www.amazon.com/Bracket-Connector-Aluminum-Extrusion-Profile/dp/B0794XMPG4
T connector
4-way connector
5-way connector

## OpenSCAD
OpenSCAD is an open source constructive solid geometry (CSG)
computer aided design (CAD) modeling tool.
Unlike most CAD tools,
OpenSCAD is not an interactive modeler,
but instead a script-only based modeler that uses its own description language.
It can render output, such as a stereolithography file (STL),
which can be used by a 3D printer to create a physical object.

## OpenSCAD CheatSheet
https://www.openscad.org/cheatsheet/


* [Knurled Surface Library v2](https://www.thingiverse.com/thing:32122)
* [Knurled Surface Finishing Library](https://cdn.thingiverse.com/assets/2b/5b/29/12/5c/knurledFinishingLib.pdf)
* [Generating Nice Threads In OpenSCAD](https://hackaday.io/page/5252-generating-nice-threads-in-openscad)

### Step X:
This Linux package install only brings in the the installation library
(located at `/usr/share/openscad/libraries/MCAD/`).
The [OpenSCAD MCAD Library][15] ([documentation][16])
contains components commonly used in designing and moching up mechanical designs.

Next we'll install some additional libraries.

### Step X: Installing OpenSCAD Libraries
There are many other OpenSCAD libraries you could choose to install,
many of which can be found [listed here][17] and [listed here][18].

Others that I have come accross that may be of some general use are:

* In mechanical engineering, a fillet is a rounding of an interior or exterior corner of a part design. - https://en.wikipedia.org/wiki/Fillet_(mechanics)   https://github.com/StephS/i2_xends/blob/master/inc/fillets.scad
* [Belfry OpenScad Library](https://github.com/revarbat/BOSL/wiki)


## OpenSCAD Documentation & Tutorals
Documentation
* [Utility libraries for OpenSCAD](https://github.com/OskarLinde/scad-utils)
* [dotSCAD - Helpful modules and functions when playing OpenSCAD](https://github.com/JustinSDK/dotSCAD)
* [OpenSCAD User Manual](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual)
* [ShimonBox is an OpenSCAD project aiming at providing semi-automatically generated 3D printable cases for development boards.](https://github.com/ubitux/shimonbox)
* [OpenSCAD General Library of Relativity](https://github.com/davidson16807/relativity.scad)
* [Raspberry-PI-OpenSCAD-Model](https://github.com/TomHodson/Raspberry-Pi-OpenSCAD-Model)
* [nutsnbolts](https://github.com/JohK/nutsnbolts)
* [ScrewsMetric](https://github.com/More-Wrong/ScrewsMetric)

Tutorials
* [Languagelessness: OpenSCAD](https://openhome.cc/eGossip/OpenSCAD/)
    * [dotSCAD - Helpful modules and functions when playing OpenSCAD](https://github.com/JustinSDK/dotSCAD)
* [Know only 10 things to be dangerous in OpenSCAD](https://cubehero.com/2013/11/19/know-only-10-things-to-be-dangerous-in-openscad/)
* [3D modeling a real world object in OpenSCAD](https://raymii.org/s/articles/3D_modelling_a_real_world_object_in_OpenSCAD.html)
* [Openscad : how to do a chamfered hole](https://www.youtube.com/watch?v=EuzOxNo2fe0&app=desktop)
* [Fillet Mounts](https://www.youtube.com/watch?v=xwHybCZK-6k&app=desktop)
* [OpenSCAD Tieing It Together With Hull](https://hackaday.com/2018/02/13/openscad-tieing-it-together-with-hull/)

# Clearance and Tap Hole
A clearance hole is a hole through an object which is large enough to enable threads of a screw or bolt
to pass through but not the head of the screw or bolt.
There are generally two specifications: Close Fit and Free Fit (aka Standard Fit).
Free fit has a larger allowance while Close Fit has a tighter allowance.

* [Metric Tap and Clearance Drill Sizes](https://www.datametal.com/wp-content/uploads/2018/03/Metric-Tap-and-Clearance-Drill-Sizes.pdf)

# New Idea
* [Bay-Window Curtain Rod Connector](https://www.thingiverse.com/thing:2034462)



[01]:https://en.wikipedia.org/wiki/Structural_system
[02]:https://www.openscad.org/
[03]:
[04]:
[05]:
[06]:
[07]:
[08]:
[09]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:https://github.com/openscad/MCAD
[16]:https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/MCAD
[17]:https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Libraries#Other_Libraries
[18]:https://github.com/openscad/openscad/wiki/Libraries
[19]:
[20]:

