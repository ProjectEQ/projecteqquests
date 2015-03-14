#Quests covered in this file:
#Shaman Skull Quest 8

sub EVENT_ITEM {
  if((defined($qglobals{shmskullquest}) && ($qglobals{shmskullquest} >= 13)) && plugin::check_handin(\%itemcount, 30995 => 1, 5148 => 1)) { #Skull of Rile, Skyiron Cudgel of the Arison
    quest::say("Use your cudgel to unite my soul with my body $name");
    quest::emote("begins to shudder and shake, the bones fly from your hands to meet their rightful soul. The spirit and bones being to glow and meld into one another, forming a swirling mass of ethereal energy. Abani begins to mouth incantations in an unfamiliar tongue. Their voice rises ever higher as mystic energy surges through the room. Then, in a suddenly flash, the spirit and corpse disappear without a trace, leaving only $name holding a Faintly glowing Cudgel in his hand.");
    quest::summonitem(5149);
    quest::setglobal("shmskullquest",1,5,"F"); #lose it and you start all over!
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}