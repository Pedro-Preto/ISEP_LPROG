/*********************************
 * AutomataEditor v 2.0          *
 * --------------------          *
 * Milan Kriz, FEL CTU in Prague *
 *  krizmil2@fel.cvut.cz         *
 *  milan.kriz@centrum.cz        *
 *                               *
 * README      Jicin, 2. 1. 2011 *
 *********************************/
 
Intro
-----
AutomataEditor is vector editor for drawing finite automata according to VauCanSon-G format (LaTeX package).
Editor supports export to several vector formats, e.g. EPS, VauCanSon-G, GraphML.
Then implements basic operations over finite automata, including simulation of DFA/NFA, basic algorithms
(determinization, minimalization, ...) and transition table export.

Prerequisities
--------------
    * for GraphViz positioner support is required GraphViz 2.26.3
    
    * in some systems it's required to install vcredist_x86.exe before running application,
      it will install C++ runtime and some manifest files
      
    * a binary is compiled with Qt 4.6.3, keep it's libararies in the same folder as the binary

Includes
--------
It's possible to implement custom algorithm plugin, for more info see plugin_howto in sources.
    
