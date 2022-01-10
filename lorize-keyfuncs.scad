// Lorize-keyfuncs.scad
// All of the switch & MCU descriptions & wrapper functions. 


module dokey() {
  /* how big is a 1u choc cap?
  generic black keycap set, x=17.6 y=16.65
  PLUM keyboard 18x18
  per key white 17.6x16.65
  transparent 17.45 x 17.82
  mbk 17,48 x 16.43
  */

  if (0 == layer) { // debug caps
    difference() {
      square([ 17.75, 16.75 ], center = true);
      circle(r = 3);
    }
  } else if (1 == layer) { // switch plate
    square([ 14, 14 ], center = true);

  } else { // PCB - replace with choc pcb footprint some day - useful for kicad
           // conversion later?
    do_choc_under();
  }
}

module dolongkey() {
  /* how big is a 1.5u?

  generic nylon 26.6x16.6
  generic white 26.7x16.65
  generic black 26.55x16.5
  mbk 26.6 x 16.5

  */
  if (0 == layer) {
    difference() {
      square([ 26.75, 17 ], center = true);
      circle(r = 3);
    }
  } else if (1 == layer) {
    square([ 14, 14 ], center = true);

  } else { // PCB
    do_choc_under();
  }
}



//// DebugKey
/// Wrapper for keys that outputs X,Y, rotation, so that it is easy to import to SCAD. 
/// 
/// Inputs x_origin,y_origin, angle of orgin from horizontal, x increment ,y increment,
/// additional angle of column, separation between hands, do_longkey,
/// per_key_rotation, mirror key, row, col
module debugkey(x_o, y_o, a_o, x, y, a_col, separation, long, a_key,
                is_mirror,col,row) {

  // even if we are mirroring motions, don't want to mirror parts. So mirror
  // them again.

  translate([ separation, 0, 0 ]) {
    rotate(a_o) translate([ x_o, y_o, 0 ])
       rotate(a_col) translate([ x, y, 0 ])

        if (long) {
      if (a_key) {
        rotate(a_key) if (is_mirror) { mirror([ 1, 0, 0 ]) dolongkey(); }
        else {
          dolongkey();
        }
      } else {
        if (is_mirror) {
          mirror([ 1, 0, 0 ]) dolongkey();
        } else {
          dolongkey();
        }
      }
    }
    else {
      if (a_key) {
        rotate(a_key) if (is_mirror) { mirror([ 1, 0, 0 ]) dokey(); }
        else {
          dokey();
        }
      } else {
        if (is_mirror) {
          mirror([ 1, 0, 0 ]) dokey();
        } else {
          dokey();
        }
      }
    }
  }

  innerx = (x * cos(a_col) - y * sin(a_col));
  innery = (x * sin(a_col) + y * cos(a_col));

  outangle = a_key + a_col + a_o;
  out_x = separation + ((x_o + innerx) * cos(a_o) - (y_o + innery) * sin(a_o));
  out_y = ((x_o + innerx) * sin(a_o) + (y_o + innery) * cos(a_o));

  if (0 == layer) { // debug caps
    color("blue") translate([ out_x, out_y, 0 ]) rotate(outangle) circle(4 / 2);
  }

// export offsets from center of PCB/DXF. 
 pcbX=276.9/2 +5; // 130 for desktop
 pcbY=30.74+(134-30.74)/2; //100 for desktop 

// Switch diode near lower left of switch
diodeX=-14/2-2 ;// offset for diode
diodeY=-2+14/2;

  // SMD led near center of switch hole. This may need adjustment due to stairsteps + rottion
ledX=-0.036;
ledY= -4.762;


switch_layout = [ // layout for switches & diodes
[ "72",   "5", "11","17", "23", "29", "35", "41", "47", "53", "59", "65", "71","73"], // top row, row4
[ "",   "4", "10","16", "22", "28", "34", "40", "46", "52", "58", "64", "70"],
[ "",   "3", "9", "15", "21", "27", "33", "39", "45", "51", "57", "63", "69"],
[ "",   "2", "8", "14", "20", "26", "32", "38", "44", "50", "56", "62", "68"], // row 1
[ "", "1", "7", "13", "19", "25", "31", "37", "43", "49", "55", "61", "67"], // row 0
];

led_layout = [ // layout for LEDs, which is based on contiguous verticals
[ "",   "84", "93","94", "103", "104", "113", "114", "123", "134", "143", "144", "153"], // top row, row4
[ "",   "85", "92","95", "102", "105", "112", "115", "122", "135", "142", "145", "152"],
[ "",   "86", "91", "96", "101", "106", "111", "116", "121", "136", "141", "146", "151"],
[ "",   "87", "90", "97", "100", "107", "110", "117", "120", "137", "140", "147", "150"], // row 1
[ "",   "88", "89", "98", "99", "108", "109", "118", "119", "138", "139", "148", "149"], // 
];




 // KiCad's Y axis is opposite Scads, so flip
  if (is_mirror == 0)  { // right side
    switch_kicad = str ( "(at ",pcbX+out_x, " " ,pcbY-out_y, " " ,outangle, ")" );
    DiS = str ("D" ,  switch_layout[row+centerrow][col+7]);
    diode_kicad =  str ( "(at ",pcbX+out_x + diodeX, " " ,pcbY-out_y + diodeY, " " ,90+outangle, ")" );
    LeS = str ("D" ,  led_layout[row+centerrow][col+7]);
    led_kicad =  str ( "(at ",pcbX+out_x + ledX, " " ,pcbY-out_y + ledY, " " ,outangle, ")" );
    SwS= str ("SW" ,  switch_layout[row+centerrow][col+7]);
    echo("R",6-col, row+centerrow,   SwS, switch_kicad, LeS, led_kicad, "DiS", diode_kicad );
  } else {
     /// left side   
        DiS = str ("D" ,  switch_layout[row+centerrow][6-col]);
    diode_kicad =  str ( "(at ",pcbX-out_x + diodeX, " " ,pcbY-out_y +diodeY, " " , 90 - outangle, ")" );
        LeS = str ("D" ,  led_layout[row+centerrow][6-col]);
    led_kicad =    str ( "(at ",pcbX-out_x + ledX,   " " ,pcbY-out_y +ledY , " " ,- outangle, ")" );
      SwS= str ("SW" ,  switch_layout[row+centerrow][6-col]);
    switch_kicad = str ( "(at ",pcbX-out_x,          " " ,pcbY-out_y, " " ,-outangle, ")" );
    echo ( "L",  6-col,row+centerrow, SwS,switch_kicad, LeS, led_kicad, DiS, diode_kicad) ;
  }

}

// pcb cutouts for the solder pins of an MCU. 
module do_mcu_under(angle) {

  for (y = [ -7.62, 7.62 ]) {
    hull() {
      for (x = [ -14, 14 ])
        translate([ x, y ]) circle(r = 3.25 / 2);
    }
  }
}


// PCB layer footprint of a choc switch. 
module do_choc_under() {

  hull() {

    circle(r = 3.7 / 2); // stem

    translate([ -5.5, 0, 0 ]) // left peg
        circle(r = 2 / 2);

    hull() { // link connectors connector
      translate([ -5, -3.75 ]) circle(r = 3.5 / 2);

      translate([ 0, -5.95 ]) circle(r = 3.5 / 2);
    }
    translate([ -5, -3.75 ]) square([ 4.8, 5 ], center = true);

    translate([ 0, -5.95 ]) square([ 4.4, 5 ], center = true);
  }

  /*	pcb mount choc pin. Remove if not needed
          translate([5.5,0,0])
                  circle(r=1.9/2);
  */

  // choc mount
  translate([ -8.275, -3.8 ]) // pad left
      square([ 2.8, 2.8 ], center = true);
  translate([ 3.275, -5.95 ]) // pad right
      square([ 2.8, 2.8 ], center = true);
}


module do_mcu(a) {
  // Pro micro size
  color("blue") translate([ 0, -4 + 66 - mcu_y / 2, 0 ]) { // board+diameter
    rotate(a) hull() for (ix = [ -1, 1 ]) for (iy = [ -1, 1 ])
        translate([ ix * mcu_x / 2, iy * mcu_y / 2, 0 ]) circle(r = 0.1);
  }
}