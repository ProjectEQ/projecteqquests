sub EVENT_SPAWN {
	quest::spawn_condition($zonesn,3,0);
}

sub EVENT_DEATH {
       	quest::spawn2(217076,0,0,-1499,-935,-182.8,126.0);
       	quest::spawn2(217087,0,0,-855.2,-1652.9,-211.5,61.6);
	quest::spawn2(217087,0,0,-695.3,-1432.5,-150.5,37);
	quest::spawn2(217087,0,0,-539.5,-1601.4,-170.5,212.5);
	quest::spawn2(217088,0,0,-704.2,-1066.6,-150.5,27.5);
	quest::spawn2(217088,0,0,-608.0,-1195.1,-120.5,232.4);
	quest::spawn2(217088,0,0,-581.7,-1345.3,-120.9,251.9);
	quest::spawn_condition($zonesn,3,1);
      	quest::signal(217076,0);
}


#End of File  Zone: PoFire  ID: 217050  -- Guardian_of_Doomfire