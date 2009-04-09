sub EVENT_SAY { 
  if ($text=~/hail/i) {
    quest::say("I do not know what you are doing up here, but I am a busy man. Please return to the bar downstairs and enjoy the atmosphere.");
  }
  if ($text=~/oblong bottle/i) {
    quest::say("The oblong bottle is a legend. They say one drink and you're off to oblivion, but just before that you feel the best you've ever felt and relive all your finest memories in the blink of an eye. The last I heard, some guy by the name of Turgin Swillfod turned up in Freeport spouting that he had found it. He was never heard from again.");
  }
  if ($text=~/never stop chopping/i) {
    quest::say("Hey!! You must be the one I traded my axe to. Funny, I thought you were much shorter. If you have my axe then I will return my your gem to you.
Well, let's have it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12366 => 1)) { #Never Stop Chopping
    quest::say("On second thought.. You can do a little favor for me first. An associate of mine has asked me to acquire a case of spirits for him. Take this box and seek out what is needed to fill it. Inside you will combine the spirits of Lendel's Grand Lager, Gator Gulp Ale, Blackburrow Swig, Tunare's Finest, Underfoot Triple Bock, Frozen Toe Rum, Blood Spirit, Vasty Deep Ale, Clockwork Oil Stout and the legendary..[Oblong Bottle].");
    quest::summonitem(17984); #Bottle Crate
  }
  elsif (plugin::check_handin(\%itemcount, 12365 => 1)) {
    quest::say("I cannot believe you actually acquired all those drinks!! You do good work, kid. Here is the gem as I promised. And a few plat for good measure. Don't let it be said that the Axe doesn't treat his friends right.");
    quest::givecash(0,0,0,7);
    quest::summonitem(12348);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::ding();
  quest::exp(15000);
  quest::faction(48,10); #'Coalition of Tradefolk Underground'
  quest::faction(47,10); #'Coalition of Tradefolk'
  quest::faction(31,10); #'Carson McCabe'
  quest::faction(53,10); #'Corrupt Qeynos Guards'
  quest::faction(105,10); #'The Freeport Militia'
}

#END of FILE Zone:highpass  ID:5055 -- Bryan_McGee 

