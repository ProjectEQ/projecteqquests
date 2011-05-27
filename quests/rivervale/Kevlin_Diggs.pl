sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, $name! Welcome to my shop! We have many fine wares. The Diggses of Rivervale have always supplied halflings and travelers with the finest armor. I advise you to purchase armor only from Kevlin's Gear and not to be conned into buying from Sonsa Fromp.");
  }
  if($text=~/mangler/i) {
    quest::say("Mangler is my guard dog. I have had him since he was a pup. You had best stay far away from him - he doesn't like strangers. And don't even think about hurting him or I will KILL you. You got that?! Good. Did you have some shopping to do or did you just come here to talk about my dog?");
  }
}

sub EVENT_SIGNAL {
  quest::say("Settle down there, [Mangler].. Hey! I told you to stay off of that table!");
}
#END of FILE Zone:rivervale  ID:19053 -- Kevlin_Diggs