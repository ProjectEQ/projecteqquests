## Changes by Kagehi.
## $Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
## Since we don't want to hand people things that they can't normally get, or
## stuff they haven't earned, we need to track which stage in the quest they
## are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
## 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
## and 7 = Initiate's Cloak.

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. friend.  May I be of assistance?");}
##Non-canon, for fixmes if you lose certain items (which are needed for this quest line and others).
##No idea if Live does this now or not. If these do exist there, feel free to adjust it.
if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
  quest::say("Luckily for you someone found it.");
  quest::summonitem(2873);}
if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
  quest::say("Someone found this stuck in the top of a palm tree in the center of the plaza. I don't even want to know how it got there, just try not to lose it this time.");
  quest::summonitem(2878);}
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18553 => 1)) {
quest::say("Good $name. I am pleased to see you. You have come of age and it is time for you to register as a citizen of Shar Vahl. Your invitation indicates that the Khala Dun. defenders of our society. have noticed you and consider your potential to be worthy of our training. First. take this application to Registrar Bindarah and return to me with proof of your citizenship.");
quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
quest::summonitem("2873");
## We don't care at this point who gives you the application, cloak, etc.
## Only later, when we get into class specific quests will the person you
## come to, in order to recover lost items, matter.
## Using "all npc, this player, and all zones", since some later stuff in
## the class quest lines, linked to the cloak, are in other zones, should we
## use this to track cloak progress as well.
quest::setglobal("Shar_Vahl_Cit",1,5,"F");
} 
elsif (plugin::check_handin(\%itemcount, 2897 => 1)) {
  quest::setglobal("Shar_Vahl_Cit",7,5,"F");
  quest::summonitem(2878);
}
else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
}
plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155170 -- High_Armsman_Trukhanah 

