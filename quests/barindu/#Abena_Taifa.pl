sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 64007 =>1 )) {
    quest::say("Proteri sent word that you would be coming. I have bad news. It seems Ixvet has gotten wind of a plot on his life and has grown paranoid. He has started changing his personal servants on a regular basis and I was replaced by Chiaka Lerato yesterday. I'm afraid that I'm not going to be able to help you anymore. Please, keep the fruit for now.");
    quest::summonitem(64010);
  }
  if (plugin::check_handin(\%itemcount, 64009 =>1, 64010 =>1)) {
    quest::say("Just in time! Ixvet is due for his next meal in a few minutes. With Chiaka out of the way, I'll be able to serve him. I hope this poison isn't noticeable. Here, I've managed to secret this away from the guards up until now and I hate to think about those beasts getting their hands on it. Please hold onto it for me. If this goes well, I won't need it anymore.");
    quest::summonitem(64018);
    quest::start(57);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_WAYPOINT_ARRIVE {
   if($wp == 10) {
    quest::say("Ikaav Ixvet Pox, I humbly present you with your meal.");
    quest::signalwith(283050,1,10);
  }
} 
    
  
  