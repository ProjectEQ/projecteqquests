# items: 21986, 21989, 21990, 21991, 21992, 21987
sub EVENT_SAY {
  quest::say("I do not have time to talk right now."); #need real text
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 21986 => 1)) { #Medallion of the Emerald warrior
    quest::say("What is.... By Tunare! This is from Faerik! I knew I was not forgotten, $name. I need your help to save my wife. I would do this myself, however I cannot return just yet. I need you to assist me. There is something amiss here, I believe that these trolls are planning something. I need you to gather insignias from each of the four different factions that are found in the place called Dulak's Harbor, then return them to me."); #need correct text
    quest::setglobal("Gandak",1,0,"F");
  }
  elsif (defined($qglobals{Gandak}) && ($qglobals{Gandak} == 1) && plugin::check_handin(\%itemcount, 21989 => 1, 21990 => 1, 21991=> 1, 21992 => 1)) { #Insignia of Hatred, Insignia of Slaying, Insignia of the Blackblood, Insignia of Suffering
    quest::say("Excellent work, $name! Now that I have these I need one final favor from you. I need you to continue on to the farmer in the Karanas to obtain the remedy for my wife. Take him this bag and he will fill it with what you need."); #need correct text
    quest::summonitem(21987); #Elven Medicine Bag
    quest::delglobal("Gandak");
  }
  plugin::return_items(\%itemcount);
}