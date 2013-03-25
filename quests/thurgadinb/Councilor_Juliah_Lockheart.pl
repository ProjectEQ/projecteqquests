# Councilor_Juliah_Lockheart 
# Part of the Coldain 9th Ring 


sub EVENT_SAY { 
    if($text=~/Hail/i){ 
        quest::say("Hello there, my what a nice looking $race you are, not that I've seen many of your kind mind you. I am Councilor Lockheart, representing the people of Thurgadin. Here is where we aid the Dain by presenting the peoples' will to him in the hopes that laws are made with the good interest of all our people in mind."); 
        } 
} 

sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 1464 => 1)) { # Ring of the coldain council 
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ(); 
    quest::spawn2(129063,0,0,$x,$y,$z,$h); 
    quest::depop_withtimer(); 
  } 
  plugin::return_items(\%itemcount); 
} 

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(14,883,-2,232,1);
	}
	if($signal==2) {
		quest::moveto(-25,542,65,0,1);
	}
}

#END of FILE Zone:thurgadinb  ID:129045 -- Councilor_Juliah_Lockheart 

