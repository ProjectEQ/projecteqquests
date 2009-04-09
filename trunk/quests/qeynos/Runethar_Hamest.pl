sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you [need guidance] or are you [already a follower of Karana]?"); }
}
sub EVENT_ITEM { 
 if ($item1=="18710"){quest::say("Thanks.");
	quest::summonitem("13505");
	quest::exp("100");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:qeynos  ID:1136 -- Runethar_Hamest 

