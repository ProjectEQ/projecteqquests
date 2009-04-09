## Changes by Kagehi.
## $Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
## Since we don't want to hand people things that they can't normally get, or
## stuff they haven't earned, we need to track which stage in the quest they
## are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
## 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
## and 7 = Initiate's Cloak.

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name. are you one of our new recruits?"); }
##Non-canon, for fixmes if you lose certain items (which are needed for this quest line and others).
##No idea if Live does this now or not. If these do exist there, feel free to adjust it.
if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
  quest::say("Luckily for you someone found it.");
  quest::summonitem(2873);}
if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
  quest::say("Someone found a rockhopper chewing on this in the pit. Try not to lose it this time.");
  quest::summonitem(2878);}
}

sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18849 => 1)) { 
quest::say("$name. welcome to the Animist's guild. You have grown strong in the safety of our city and it is now time for you to register for official citizenship of Shar Vahl. The Khati Sha. explorers of this hostile land. have granted your request of inclusion and deem you to be worthy of our training. Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
## We don't care at this point who gives you the application, cloak, etc.
## Only later, when we get into class specific quests will the person you
## come to, in order to recover lost items, matter.
## Using "all npc, this player, and all zones", since some later stuff in
## the class quest lines, linked to the cloak, are in other zones, should we
## use this to track cloak progress as well.
quest::setglobal("Shar_Vahl_Cit",1,5,"F");
quest::summonitem("2873");
}
if (plugin::check_handin(\%itemcount, 2897 => 1)) {
quest::say("Allow me to be the first to welcome you to the Khati Sha. lords of the beasts. Accept this cloak. young initiate. It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Animist Poren and he will give you instruction. May the spirits of the beasts guide you and keep you safe.");
quest::setglobal("Shar_Vahl_Cit",7,5,"F");
quest::summonitem("2878");
}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
  plugin::return_items(\%itemcount);
}
