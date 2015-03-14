# Kutin's Key
# created by Gonner
# live text added by Jaekob

sub EVENT_SAY {
  if ($text=~/hail/i){
    quest::emote("looks you over with an appraising glance. 'Hail, yerself. What news have you of the lands outside this void? Did you come from [Taelosia] or from someplace [pleasant]?");
  }
  if ($text=~/taelosia/i) {
    quest::say("Aye, mighty brave of ye. I can respect anyone with the guts ta go out there. You must be someone of note if ye went out there and came back. Next time ye catch me in the tavern I'll buy ye a drink.");
  }
  if ($text=~/pleasant/i) {
    quest::say("Well, I hope for yer sake yer goin' back there, not on to Taelosia. I've been there and it's a terrible place. If there was anything pure there, it's long been corrupted. I could smell it in the stones and earth of the place. I'll never go back there.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55612 => 1)) { # Kutin's Key
    quest::say("You found my key! Where was it? Now how did it get there? No matter, you have returned it.");
    quest::summonitem(59794); # Potion of Transformation (Troll)
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279234 -- Kutin_Pyskar.pl