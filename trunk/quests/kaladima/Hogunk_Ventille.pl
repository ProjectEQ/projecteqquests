sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. and welcome to Stormguard Hall. home to all great warriors! Are you also a [warrior of the Stormguard] or do you [follow another guild]?");
}
if($text=~/i am a warrior of the stormguard/i){
quest::say("As I thought. You do not appear to be one who relies on wits rather than brawn. no offense. I have word that a Stormguard on duty has deserted his post at one of the guardposts in the Butcherblocks. I want you to go and seek him out. He is Guard Bundin. Return his Stormguard axe to me. along with his head. There shall be no cowards in the Stormguard!!");
}
if($text=~/i follow another guild/i){
quest::say("Then go to your guild. This is the hall of the dwarven warriors - not a place for common folk to lounge around."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladima  ID:60006 -- Hogunk_Ventille 
