## Changes by Kagehi.
## $Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
## Since we don't want to hand people things that they can't normally get, or
## stuff they haven't earned, we need to track which stage in the quest they
## are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
## 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
## and 7 = Initiate's Cloak.

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings citizen... you are very brave to approach me in this manner.  That sort of bravery warrants my respect.  How may I help you?"); }
##Non-canon fixme if you lose note.
if(($text=~/note/i) && ($qglobals{Shar_Vahl_Cit} == 5)){
  quest::say("I guess I can write you a new note. Try not to lose it this time.");
  quest::summonitem("18304");
}
}
sub EVENT_ITEM { 
if(plugin::check_handin(\%itemcount, 18299 => 1)){
quest::say("Your humility and willingness to serve shall not be wasted. There is much to be done. $name. and our people thank you in advance for your selfless service.");
quest::setglobal("Shar_Vahl_Cit",5,5,"F");
quest::summonitem("18304");
quest::ding();
quest::exp(100); }
plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155154 -- King_Raja_Kerrath 
