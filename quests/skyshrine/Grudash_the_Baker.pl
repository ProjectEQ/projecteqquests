sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Ah, welcome stranger. Perhaps I could interest you in one of my famous Boysenberry pies, the delight of Sky Shrine.");
    quest::signalwith(114496,1,1); #Ruru the Cook
  }
  if($text=~/boysenberry pie/i) {
    quest::say("chuckles, 'I thought you might, what say you now Ruru? Who is the better cook between us now?'");
    quest::signalwith(114496,4,1); #Ruru the Cook
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("Why would I admit to such a lie? Everyone loves my pies. I rarely see anyone come in here asking for your Roasted Walrus.");
    #quest::signalwith(114496,2,1); #Ruru the Cook
  }
  if($signal == 2) {
    quest::say("Please ignore my friend Ruru here. He is a bit delusional.");
    quest::signalwith(114496,3,1); #Ruru the Cook
  }
  if($signal == 3) {
    quest::emote("laughs, 'I'm sure they'd prefer my Boysenberry pie to your Roasted Walrus with Plum Sauce any day.'");
    quest::signalwith(114496,5,1); #Ruru the Cook
  }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Grudash_the_Baker