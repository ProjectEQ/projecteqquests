sub EVENT_SAY {
  
  if ($text=~/hail/i) {
    quest::say("It is a comfort to meet you, $name. I was afraid that you might not be able to track me with weather out there being what it is. I must admit that my fondness of the snow is at an all time low right now. The sooner you release the spirit that resides in here, the sooner we can make a way back to a warmer climate.");
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 9031=>1 )) {
  quest::say("The spirit that you seek is deep within these halls. I tracked it into this lair more than a week ago. The spirit has taken up residence with the other bears in the lower chambers during that time. It should be relatively easy for your and your people to reach. Once you release the spirit, please return the totem to me. I will prepare it for the journey to Shar Vahl. May stealth and good fortune move with you.");
  quest::summonitem(9031);
  quest::emote("A large creature growls from deep within its icy lair.");
  quest::spawn(73107,0,0,-275,700,-38);
}

  if (plugin::check_handin(\%itemcount, 9036 =>1 )) {
    quest::say("Perfect work, $name! I am glad the Elders made such a wise choice in sending you. I must admit, I was rather scared during the exploration of these halls. This lair is quite foul, quite foul indeed! Take this wrapped totem and place it in the case that you were given. Once you have all of the totems, seal the case and make your way back to Shar Vahl. I work my way back as well. Thank you again. ");
    quest::summonitem(9037);
    quest::summonitem(9031);
   }
   plugin::return_items(\%itemcount);
}