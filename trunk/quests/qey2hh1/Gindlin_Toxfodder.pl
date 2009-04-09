#Gindlin's Poison

sub EVENT_SAY
{
 if($text=~/Hail/i)
  {
   quest::say("What do you want?");
  }
 if($text=~/what poison/i)
  {
   quest::emote("grins");
   quest::say("So your here about poison eh? I can make it for ya. Get me a snakes venom sac and the Special Brew made by Crow in Crow's Bar in Qeynos, and of course, a fee of 20 gold.");
  }
}

sub EVENT_ITEM
{
  if(plugin::check_handin(\%itemcount, 14017 => 1, 13901 => 1) && $gold == 20)
  {
   quest::emote("grins slyly");
   quest::say("Why thank you good sir. One moment please.");
   quest::summonitem(14015);
  }
plugin::return_items(\%itemcount);
}
#END of FILE zone: ID:12011 -- Gindlin_Toxfodder.pl 