#     #Phantasmal_Priest.pl
#quest text needed
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("looks around with a glint of madness in his eyes.");
    quest::say("Are you here to help [cleanse] the temple?");
  }
  if ($text=~/cleanse/i) {
    quest::emote("pushes something dry and brittle into your hands");
    quest::say("take these and see if you can piece them together.  If so give them back and maybe I can help you.");
    quest::summonitem(60241);
    quest::summonitem(60241);
    quest::summonitem(60241);
    quest::summonitem(60241);           
  }
 if ($text=~/north/i) {
  if ($qglobals{ikkymove} == 1) {
     $InInstanceIkky7 = quest::GetInstanceID("ikkinz",6);
     quest::MovePCInstance(294,$InInstanceIkky7,195,-86,21,0);
  }
  else {
       quest::say("Fool, I can not help you if you do not help me.");
       }
 } 
 if ($text=~/south/i) {
  if ($qglobals{ikkymove} == 1) {
    $InInstanceIkky7 = quest::GetInstanceID("ikkinz",6);
    quest::MovePCInstance(294,$InInstanceIkky7,206,-154,20,0);
  }
  else {
       quest::say("Fool, I can not help you if you do not help me.");
       }
 } 
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60242 =>1 )) {
    quest::say("Ah this is what I need.");
    quest::emote("takes the piece of parchment and whispers softly.  The piece flares with magic and he turns to look at you.");
    quest::say("What you need is both [north] and [south], speak return and it shall be so.");
    if(!defined($qglobals{ikkymove})) {
   quest::spawn2(294614,0,0,213,-100,20,0);
   quest::setglobal("ikkymove",1,5,"H6");
   }
  }
  plugin::return_items(\%itemcount);
}
sub EVENT_SIGNAL {
  if($signal == 1 && ($entity_list->GetMobByNpcTypeID(294610) == 0)) {
         quest::setglobal("ikkyfourdoor",1,3,"H6");
   }
}