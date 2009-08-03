my $check = 0;
my $counter = 0;

sub EVENT_SPAWN {
   $check = 0;
   $counter = 0;
}    

sub EVENT_SIGNAL {
     if ($signal == 1 && defined($qglobals{$smoke_event_start}) && !defined($qglobals{$smoke_done})) {
        $counter+=1;
     	if ($signal == 1 && $counter == 4 && defined($qglobals{$smoke_event_start}) && !defined($qglobals{$smoke_done})) {
        quest::spawn2(215454,0,0,-445.6,-1291.9,317.6,70.1);
        }
     }
     if ($signal == 2 && defined($qglobals{$smoke_event_start}) && !defined($qglobals{$smoke_done})) {
        quest::spawn2(215435,0,0,1395.9,-681.3,15.1,255.1);
        quest::depop(215055);
     }
     if ($signal == 3  && !defined($qglobals{$smoke_done})) {
        quest::setglobal("smoke_done",1,3,"D2");
     }
	if ($signal == 4 && !defined($qglobals{$smoke_event_start}) && !defined($qglobals{$smoke_done})) {
		$check_boss = $entity_list->GetMobByNpcTypeID(215012); #A_Confused_Air_Elemental
		if ($check_boss) {
		  $check = 1
		}
		if($check == 0 && !defined($qglobals{$smoke_event_start}) && !defined($qglobals{$smoke_done})) {
		quest::spawn2(215066,0,0,-403.1,-1375.5,320.8,234.9); 
		quest::spawn2(215066,0,0,-501.9,-1205.9,318.6,99.0);
		quest::spawn2(215066,0,0,-341.1,-1245.2,317.6,182.8);
		quest::spawn2(215066,0,0,-523.3,-1288.2,321.7,63.0);
		quest::setglobal("smoke_event_start",1,3,"H2");
		$counter=0;
		}
		if ($check == 1) {
		  
		}
	}
}