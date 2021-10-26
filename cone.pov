#include "colors.inc"
#declare Ball =
sphere{<0,0,0>,0.5
     texture{pigment{color White}
             finish {phong 1}}}
#declare Radius0=1.0;
#declare NR=50;
#declare NpR=15;
#declare Scale=0.9; 
#declare HpR=0.8;
 
camera {
   location <10, 10, -10>
   direction <0, 0, 2>
   look_at <-1, 4, 1>
}

light_source {<800, 600, -200> colour White}

#local Hd       = HpR/NpR;
#local Scale_p  = pow(Scale,1/360);
#local Scale_pE = pow(Scale_p,360/NpR);
#local Old_S = Scale_pE;
#local Old_H = Hd;
#declare Nr = 0;         
#declare EndNr = NR*NpR; 
#while (Nr< EndNr)
 object{Ball
        translate<Radius0,0,0>
        scale Old_S
        translate<0,Old_H,0>
        rotate<0,Nr*360/NpR,0>}
 #declare Nr = Nr+1;
 #declare Old_S =Scale_pE*Old_S;
 #declare Old_H =Old_H+Hd*Old_S;
#end   

object {
    plane{y,0.5}
    pigment {checker color rgb <0,1,1> color rgb <1,0,0>}
    scale 4
}