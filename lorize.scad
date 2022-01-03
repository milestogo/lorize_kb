include <part-POS.scad>;

$fn=30;

angle=14; //Total opening angle
splita=angle/2; 
colstep=19; // horizontal center to center distance between switches
rowstep=18; // ibid, vertical
m3=3.1/2;//radius of m3 hole

/* [Hole Type:] */
// Pick layer to set hole type. 0 = debug, 1 = switchplate
layer = 0; // [0:caps_debug, 1:switchplate, 2:pcb_frame, 3:pcb_shim, 4:palm_mid, 5: palm_rest] 

caps_debug=0;
switchplate=1;
pcb_frame=2;
palm_mid=4; 
palm_rest=5;

/* [ Enum of board types ] */
desktop = 0; //60% best overall ergos, custom PCB shape. 
maxreform = 1; // option with as many keys as we can cram in. 
reform = 2; // 60% that fits well enough for a reform sized PCB
smallreform_thumb =3 ;// 30% option with more thumbs for reform.  
long=1; // used to flag if switch has long or standard cap. 


/* [ Board Type:] */
board = 0; // [ 1:maxreform, 2:reform, 0:desktop, 3:smallreform_thumb]



/* [ PCB Size]*/
reform_pcbx = 275.9;
reform_pcby = 102.24;




// mcu board size
mcu_x= 34; // pro micro 33, feather 51
mcu_y= 19.5; // pro micro 19 /bluepill 22.6 / feather 23
mcu_z=8;





module rtate(x,y, a) {

	newx= x*cos(a) - y*sin(a);
	newy= x*sin(a) + y*cos(a);
}

//// Functions

/// x_origin,y_origin, angle of orgin from horizontal, x increment ,y increment, additional angle of column, separation between hands, do_longkey, per_key_rotation
module debugkey(x_o,y_o,a_o,x,y,a_col, separation,long,a_key,is_mirror) {

// even if we are mirroring motions, don't want to mirror parts. So mirror them again. 

	translate([separation,0,0]) {
		rotate(a_o)
			translate([x_o,y_o,0])
				rotate(a_col)
				translate([x,y,0])
					
						if(long) {
							if(a_key) {
								rotate(a_key) 
									if(is_mirror) {
										mirror([1,0,0])
											dolongkey();
									} else {
										dolongkey();
									}
							} else {
								if(is_mirror) {
										mirror([1,0,0])
											dolongkey();
									} else {
										dolongkey();
									}
							}
						} else {
							if(a_key) {
								rotate(a_key) 
									if(is_mirror) {
										mirror([1,0,0])
											dokey();
									} else {
										dokey();
									}
							} else {
								if(is_mirror) {
										mirror([1,0,0])
											dokey();
									} else {
										dokey();
									}
							}
						}

	}

	innerx=(x*cos(a_col) - y*sin(a_col));

	innery=(x*sin(a_col) + y*cos(a_col));

	outangle=a_key+a_col+a_o;
	out_x= separation + ( (x_o+innerx)*cos(a_o) - (y_o+innery)*sin(a_o))  ;
	out_y=  ( (x_o+innerx)*sin(a_o) + (y_o + innery) * cos(a_o))   ;

	if ( 0 == layer) { // debug caps 
		color ("blue")
			translate([out_x,out_y,0])
				rotate(outangle)
					circle(4/2);

	}
		echo ("Right at ",out_x +130 , 100-out_y, outangle) ;
		//echo ("Left at ",130-out_x , 100-out_y, outangle) ;
}	


module do_mcu_under(angle){

for (y=[-7.62,7.62]) {
	hull(){
		for(x=[-14,14])
			translate([x,y])
				circle(r=3.25/2);
		}
	}
}



module do_choc_under(){

	hull(){

		circle(r=3.7/2); // stem

		translate([-5.5,0,0]) // left peg
				circle(r=2/2);

		hull(){ // link connectors connector
			translate([-5,-3.75])
				circle(r=3.5/2);

			translate([0,-5.95])
				circle(r=3.5/2);

		}
			translate([-5,-3.75])
				square([4.8 ,5],center=true);

			translate([0,-5.95])
				square([4.4,5],center=true);

	}

		/*	pcb mount choc pin. Remove if not needed
			translate([5.5,0,0])
				circle(r=1.9/2);
		*/

		// choc mount
		translate([-8.275,-3.8]) // pad left
			square([2.8,2.8],center=true);
		translate([3.275,-5.95]) // pad right
			square([2.8,2.8],center=true);
	
}

module dokey(){
/* how big is a 1u choc cap?
generic black keycap set, x=17.6 y=16.65
PLUM keyboard 18x18
per key white 17.6x16.65
transparent 17.45 x 17.82
mbk 17,48 x 16.43
*/

	if ( 0 == layer) { // debug caps 
		difference(){
			square([17.75,17],center=true);
			circle(r=3);
		}
	} else if ( 1 == layer) { // switch plate
		square([14,14],center=true);

	} else { // PCB - replace with choc pcb footprint some day - useful for kicad conversion later?
		do_choc_under();
	}
}


module dolongkey(){
/* how big is a 1.5u?

generic nylon 26.6x16.6
generic white 26.7x16.65
generic black 26.55x16.5
mbk 26.6 x 16.5

*/
	if ( 0 == layer) {
		difference(){
			square([26.75,17],center=true);
			circle(r=3);
		}
	} else if ( 1 == layer) {
		square([14,14],center=true);

	} else { // PCB
		 do_choc_under();
	}
}



//  Punch out one half of the shape. 
module doright(	angles, vfudge,hfudge,rowlow,rowhi, separation, is_mirror ){	
			for (x=[1:5]) { // starting with middle finger towards pinky

				for(y=[rowlow[x]:rowhi[x]]) {
					debugkey (  (x-2)*colstep,0, splita,
								hfudge[x],vfudge[x]+(y)*rowstep, angles[x] ,separation, 0,0,is_mirror);
						
				}

				if (5==x) { // pinky shift key is special. 
					
					if (board == smallreform_thumb ) { // why can't the laptop have a big key too?
						debugkey ( 1+(x-2)* colstep, 0 , splita, 
								-0.5,  vfudge[x]+(-1)*rowstep , angles[x],separation,0,0,is_mirror);
					} else {
					
						debugkey ( (x-2+0.25)* colstep, 0 , splita, 
								-0.5,  vfudge[x]+(-1)*rowstep , angles[x],separation,1,0,is_mirror);
					}
				

				// pinky menu key	
						// small reform uses 1u keys, mostly for aesthetics. others use larger 1.5U
						if  (board != smallreform_thumb ) {
							debugkey ( (colstep*2.25), 0 , splita ,
								-0.75, -0.25+ vfudge[x] -2*rowstep, angles[x-1], separation, 1, 0,is_mirror);
						}
		
					// pinky ctrl key  
					if ( (board == maxreform) || board == desktop ) {				
						debugkey ( (3.5-.125)* colstep, 0 , splita, 
							2,   -1.5 - vfudge[x] -(2)*rowstep , angles[x], separation,0,0,is_mirror);
							}
				}

			
			}

			// x=0 index fingers have extra rotation to bring up spacebar y location. 
	 		for (x=0) {
				for(y=[rowlow[x]:rowhi[x]]) {
						debugkey ( (x-2)*colstep, 0 , splita ,
								hfudge[x], vfudge[x]+(y)*rowstep, angles[x], separation,0, -splita*0.55,is_mirror);
				}
			}


			// Far reach pinky keys 
			if ( (board == maxreform) || (board == reform)) {
								
				for (x=6) { // weird pinky keys

						if (board == maxreform || (board == reform) ) {
						for(y=[rowlow[x]]) {
							debugkey ( (x-2)*colstep, 0 , splita ,
								hfudge[x], vfudge[x]+(y-.5)*rowstep, angles[x], separation,0, 90,is_mirror);
						}

					}
				


				}
			}
}




module do_mcu(a){
//		[0,-4+66-mcu_y/2,0]	

// Pro micro
	color("blue")
		translate([0,-4+66-mcu_y/2,0]	) { // board+diameter
			rotate(a)
				hull()
					for(ix=[-1,1])
						for(iy=[-1,1])
							translate([ix*mcu_x/2,iy*mcu_y/2,0])
								circle(r=0.1);

				}
						


}





// desktop shape functions. 

module walkpoints(radius, start, count, nodes){
	for ( c=[start:count]) {
		translate(nodes[c])
			circle(r=radius);
	}
}


RightCorners=[ [0,0],
			[0,58],  // center top
					[62,64], //  outsidetop of mcu holder 192,36
					[72,48],// near u key // 205,49.5
					[112.5,49],// upper right
					[125,3], // bump on side
					[129,-35], //bottom right
					[27,-53], // side of spacebar
					[0,-53], // bottom center	
					[0,0],					
	];




/*raw, center at x=130,y=100
130,42
130,100
130, 153
200,49
60,49
254,98
6,98
148,135
112,135
*/

MountingHoles= [
[0,58],
[0,0],
[0,-53],
[70,51], [-70,51],
[-124,2], [124,2],
[18,-36],[-18,-35],
]
;


front=140;
gap=-20;
PalmrestMid =[  // middle ones, no gap added to allow access to keys
					[142,10-front],
					[129,-35], //bottom right
					[27,-53], // side of spacebar
					[0,-53], // bottom center
					[40,5-front],
					[00,5-front],
	];


PalmrestTop =[  // middle ones, no gap added to allow access to keys
					[142,10-front],
					[129,-35], //bottom right
					[40,-53], // side of spacebar
					[70,-53], // bottom center
					[50,5-front],
				
	];


LowerPalmrestCorners =[ 
					[145,10-front],
					[129,-35], //bottom right
					[27,-53], // side of spacebar
					[0,-53], // bottom center
					[50,-front],
					[0,-front],
			
	];


module hullpalms_mid() {  // upper palms
// no fancy angles, so we can do both sides. 
	difference() { 
			union() {
				hull()
					walkpoints(5, 0, 5, PalmrestMid);
		
				mirror([1,0,0])
					hull()
						walkpoints(5, 0, 5, PalmrestMid);
			
			}


		scale(1.01)
			hullaplate();

			// centering holes for palmrest. 
		for (x=[100,80,-80,-100]) 
			translate([x,-100,0])
				circle(r=3/2);

	}
}


	module hullpalms_top() {  // upper palms
// no fancy angles, so we can do both sides. 
	difference() { 
			union() {
				hull()
					walkpoints(5, 0, 4, PalmrestTop);
		
				*mirror([1,0,0])
					hull()
						walkpoints(5, 0, 5, PalmrestTop);
			
			}

		translate([0,-18,0])
		scale(1.05)
			hullaplate(0);


		translate([0,-150])
			rotate(45)
				square([150,150]);

			// centering holes for palmrest. 
		for (x=[100,80]) 
			translate([x,-100,0])
				circle(r=3/2);


	}
	
}

module hullpalms() { 
// no fancy angles, so we can do both sides. 
	difference() { 
			union() {
				hull()
					walkpoints(5, 0, 5, LowerPalmrestCorners);
		
				mirror([1,0,0])
					hull()
						walkpoints(5, 0, 5, LowerPalmrestCorners);
			
			}
		// always cut out mounting holes
		for ( c=[0:8]) {
				translate(MountingHoles[c])
					circle(r=m3);
			}


	
			// centering holes for palmrest. 
		for (x=[100,80,-80,-100]) 
			translate([x,-100,0])
				circle(r=3/2);



	}
}






module hullaplate(doholes) {
	difference() {
		union(){ // need to do two different hull points. 
			hull()
				walkpoints(5, 0, 3, RightCorners);
			hull()
				walkpoints(5, 3,9, RightCorners);
						
			mirror([1,0,0]) {
				hull()
					walkpoints(5, 0, 3, RightCorners);
				hull()
					walkpoints(5, 3,9, RightCorners);
			}
		}

	
	
		if (doholes) { 
	// always cut out mounting holes
		for ( c=[0:8]) {
				translate(MountingHoles[c])
					circle(r=m3);
			}

		}

	}
}





module do_both_sides( angles, vfudge,hfudge,rowlow,rowhi,separation) {
		doright( angles, vfudge,hfudge,rowlow,rowhi,separation,0);
		mirror([1,0,0])
			doright( angles, vfudge,hfudge,rowlow,rowhi,separation,1);
}


module do_reform_pcb(){

	union(){
		square([reform_pcbx,reform_pcby],center=true);
		translate([0,+10.92])
			square([reform_pcbx-2*33.510, reform_pcby],center=true);

	}
}

///////// Main functions
if ( board == maxreform) {

	angles=[-1.5   ,-1.5 ,-.75, 0,0, -1.5,-1.5];// inner to outer(pinky)
	vfudge=[2.5   ,1    ,   0,  0,0, -0.5, 0];// inner to outer
	hfudge=[-1.25,-0.75,-.33,  0,0, .6, 0.25];

	rowlow = [-1,-1,-2,-2,-1, 0,1];
	rowhi =  [ 2, 2, 2, 2, 2, 1,1];

	separation=53;
	pcbx=reform_pcbx;
	pcby=reform_pcby;
	pcb_y_shift=0;

	difference() {
		translate([0,pcb_y_shift,0])
	      do_reform_pcb();

	do_both_sides( angles, vfudge,hfudge,rowlow,rowhi,separation);

		/* put key in upper corners 
		translate([(pcbx-colstep)/2,(pcby-rowstep)/2,0]) {
			dokey();
			translate([0,-rowstep,0])	
				dokey();
		}

		*/
		
			desktop_thumbs(separation,-2.5,3.5);
	}

}





if ( board == smallreform_thumb) { //  power button on left, LCD goes on right. 
/* 40% board, with 1u keys, more thumb buttons */

	q=-0.3; // relax angles because of wider spacing, or you could increase, there's room. 
	angles=[-1.5   ,-1.5 ,-0.75, 0 ,0, -1.5, -1.5];// inner to outer(pinky)
	vfudge=[2.5   ,1    ,   0,  0,0, -0.5, -2];// inner to outer
	hfudge=[-1.25,-0.75,-.33,  0,0, .6, 0.25];

	rowlow = [-1,-2,-2,-2,-2, 0,0];
	rowhi =  [ 1, 1, 1, 1, 1, 1,1];

	pcbx=reform_pcbx;
	pcby=reform_pcby;
	pcb_y_shift=15;

	separation = 53+4.75; // probably best with angle = 13?

	difference() {
		translate([0,-pcb_y_shift,0])
	      	translate([0,pcb_y_shift,0])
	      	  do_reform_pcb();
	
		translate([0,pcb_y_shift,0])
			do_both_sides( angles, vfudge,hfudge,rowlow,rowhi,separation);

		for (y=[3,4]){
			translate([0,-pcby/2-pcb_y_shift + (y)*rowstep,0]) {
				dokey();
			}
		}

		translate([0,-pcby/2-pcb_y_shift+rowstep/2,0]) {
				dolongkey();
		}

		// thumbs
		translate([0*colstep,-2.35*rowstep,0]) 
			dolongkey();
		for(x=[-1,1])
			translate([x*1.25*colstep-x*0.5,-2.0*rowstep,0])
				dokey();
		
	
	}
}


if ( board == reform) {
/* 60 % board, with 1.5 and 1u keys, thumbs aren't perfect, but work */

	angles=[-1.5   ,-1.5 ,-.75, 0,0, -1.5,-1.5,-1.5];// inner to outer(pinky)
	vfudge=[2.5 ,1 , 0, 0, 0, -0.5, -0.5];// inner to outer
	//hfudge=[-1.25,-0.75,-.33,  0,0, .6, 0.25,0];
	hfudge=[-0.5,-0.5,-.33,      0,0, .6, 0.25];

	rowlow = [-1,-1,-2,-2,-1, 0,2];
	rowhi =  [ 2, 2, 2, 2, 2, 2,2];

	pcbx=reform_pcbx;
	pcby=reform_pcby;
	pcb_y_shift=1.5; // this is the kerf that lets the top outermost number row work... at the expense of thumb separation. 

	difference() {
		translate([0,pcb_y_shift,0])
	        do_reform_pcb();

		// palm key trial.  In practice, the edge of the bezel probably keeps it from being a good palm key
		// on a PCB, you could make this a choice of 1u or 1.5
		*for (x=[-1,1]) {
			for(y=[-pcby/2+rowstep/2+pcb_y_shift]) {
				translate([x* (pcbx/2-colstep*(0.65)) ,y,0])
						dolongkey();
			}
		}


		separation=53;

		do_both_sides( angles, vfudge,hfudge,rowlow,rowhi,separation);


		// thumbs


		desktop_thumbs(separation,-2.5,pcb_y_shift+3.75);

		do_mcu(0);

	}

}



module desktop_thumbs(separation,yshift1,yshiftL){ 


// thumbs
		debugkey ( -2*colstep, -2.5*rowstep , 0,
					-0.75,yshiftL,0, separation, long, 0);

		debugkey ( -0.75*colstep, -2*rowstep , 0,
			-1.5,yshift1,0, separation, 0, 0);


	mirror([1,0,0]) {
		debugkey ( -2*colstep, -2.5*rowstep , 0,
					-0.75,yshiftL,0, separation, long, 0,1);

		debugkey ( -0.75*colstep, -2*rowstep , 0,
			-1.5,yshift1,0, separation, 0, 0,1);
	}
}

if ( board == desktop) { 

	angles=[-1.5   ,-1.5 ,-.75,0,    0, -1.5,-1.5];// inner index to outer(pinky)
	vfudge=[2  ,1   , 	 0,  0,0, -0.5, -0.5];// inner to outer
	hfudge=[-0.5,-0.5,-.33,  0,0, .6  , 0.25];

	rowlow = [-1,-1,-2,-2,-1, 0,1];
	rowhi =  [ 2, 2, 2, 2, 2, 2,1];
	separation=53;
	pcb_y_shift=0;
	
	if ( layer == 1 ) { // switchplate

		difference() {
			hullaplate(1);
			translate([0,pcb_y_shift,0])
				do_both_sides( angles, vfudge,hfudge,rowlow,rowhi,separation);
			

			desktop_thumbs(separation,-2.5,-2.5);
			
			// pins under MCUs
			for (i=[0]) {
				translate([mcus[i][0],mcus[i][1],0])
					rotate(mcus[i][2])
						do_mcu_under();
			}

		}
	} else if (layer==2) { // pcb pcb_frame
		difference() {
			union(){
				hullaplate(1);
				hullpalms();
			}
	

			// diode cutouts
			for (i=[0:59]) {
				translate([diodes[i][0],diodes[i][1],0])
					rotate(diodes[i][2])
						hull()
						 for(x=[-5+1,5-1])
						 	translate([x,0,0])
						 		circle(r=3/2);

						
			}

			// resistor cutouts
			for (i=[0:7]) {
				translate([resistors[i][0],resistors[i][1],0])
					rotate(resistors[i][2])
						hull()
						 for(x=[-5+1,5-1])
						 	translate([x,0,0])
						 		circle(r=3/2);

						
			}

			// make choc under footprints
			translate([0,pcb_y_shift,0])
				do_both_sides( angles, vfudge,hfudge,rowlow,rowhi,separation);

			desktop_thumbs(separation,-2.5,-2.5);


			// pins under MCUs
			for (i=[0,1]) {
				translate([mcus[i][0],mcus[i][1],0])
					rotate(mcus[i][2])
						do_mcu_under();
			}

			// free  hand a place to do RGB lighting

			hull() {
				translate([4.5,-31])
					circle(r=3);

				translate([-4.5,-31])
					circle(r=3);
				
				translate([0,-47])
					circle(r=3);
			}
				
		}

	} else if (layer==palm_mid) {

		hullpalms_mid();

	} else if (layer==palm_rest) {
		hullpalms_top();
	
	} else {
		difference() {
			hullaplate(1);
				
			translate([0,pcb_y_shift,0])
				do_both_sides( angles, vfudge,hfudge,rowlow,rowhi,separation);

			desktop_thumbs(separation,-3,-2.5);
			

/*
			// asymmetric hand keys
		for (x=[6]) { // far right pinky
				for (y=[1,2])
					debugkey ( (x-2)*colstep, 0 , 0.5*splita ,
						-1+hfudge[x], 3+ vfudge[x]+(+y)*rowstep, angles[x], separation,0, 0);
			}


			mirror([1,0,0])
			for (x=[6]) { // far right pinky
				for (y=[1,2])
					debugkey ( (x-2)*colstep, 0 , 0.5*splita ,
						-1+hfudge[x], 3+ vfudge[x]+(+y)*rowstep, angles[x], separation,0, 0);
			}
*/
		}


	}


}

