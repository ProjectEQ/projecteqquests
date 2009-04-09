# Chalex The Redeemed
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
# spawned by Warrior_Spirit_Chalex.pl

sub EVENT_SPAWN {
  quest::settimer(1,600); # Depop after 10m
}

sub EVENT_TIMER {
  if ($timer == 1) {
    quest::depop();
   quest::stoptimer(1);
    quest::emote("waves goodbye and disappears just as quickly as he appeared."); #Text modified as quest::echo not working.
   }
}

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::emote("looks at you longingly, hand outstretched.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,67020 => 1)) {  ##Give him Marr's Retribution.
    quest::emote("takes the sword and begins to change. Old becomes new right before your eyes as the touch of Mithanial reshapes the warrior spirit."); #Text modified as quest::echo not working
    quest::npcrace(330);
    quest::npcgender(0);
    quest::npcsize(5);
    quest::npctexture(1); #My personal touch - changes the undead frog into a Guktan.
    quest::say("Thank you again $name. Your kindness has allowed my spirit to go home. Please show this to my people so they will have a memory of what you have done.");
    quest::settimer(1,6);
    quest::summonitem(67018);
    }
    else {
      plugin::return_items(\%itemcount); # return unused items
    }
}