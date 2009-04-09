# EPIC CLERIC

sub EVENT_SPAWN {
  quest::shout("The Triumvirate of Water has decreed your fate, Shmendrik Lavawalker!! I am here to deliver said fate!!");
  quest::signalwith(51012,99,2000);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("The Riptide goblins must have their crown returned to them. If you would be so kind as to give me the crown I will make sure that it reaches them. Hopefully they are capable enough to repair the damage that has been done to it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,28046=>1)) { # damage goblin crown
    quest::say("I will have this crown returned to the Riptide Goblins immediately! Should you ever come across an Erudite named Omat Vastsea, give him this sea shell. The waters of Norrath shimmer with awareness of your deeds here today!"); 
    quest::summonitem(28047); # Ornate Sea Shell (I)
    quest::depop();
  } 
  
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if ($signal == 199) {
    quest::say("Enough!! Your existence has come to an end!");
    quest::signalwith(51012,299,2000);
  }
  if ($signal == 399) {
    quest::say("This conflict has been destined by the waters of the Triumvirate!");
    quest::signalwith(51012,499,2000);
  }
  if ($signal == 599) {
   quest::spawn2(51145,0,0,33,3619,51,0);
   # $mob = $entity_list->GetMobID($entid);
   # $mobnpc = $mob->CastToNPC();
   # $mobnpc->AddToHateList($npc, 1);
  }
}

#End of File, Zone:lakerathe  NPC:51138 -- Natasha Whitewater

