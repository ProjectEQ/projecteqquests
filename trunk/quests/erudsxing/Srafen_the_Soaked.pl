sub EVENT_SPAWN {
  quest::settimer("DillonSpawn",180);
  quest::settimer("AskDillon",840);
  quest::settimer("SrafenDepart",1020);
  quest::settimer("FrohamSpawn",1200);
  quest::settimer("SrafenDepop",1201);}

sub EVENT_SAY {
 if($text=~/hail/i){ #Part of Shaman Epic 1.0
  quest::say("Why hello there! Ahh, it's good to see a new face down [here]. So you've come to [wait] with [us] eh? That is splendid! It's been getting very boring lately.");
  }
 elsif($text=~/here/i){ #Part of Shaman Epic 1.0
  quest::say("Oh! Well this is where [we wait]. It's not much for looks but if you're lucky, a pretty fish will swim by. Oh, and once Dillon said he saw one of those fish women, a mermaid, he called it! Although, I'm not so sure of his state of mind, hehehe. He's been waiting here much longer than I.");
  }
 elsif($text=~/\bus\b/i){ #Part of Shaman Epic 1.0
  quest::say("Well, there's me, Srafen. I've been down here for, can't quite remember, a number of years, I guess. If my wife saw the condition my clothes are in, she'd whack me, I'm sure, heheh. Although I'd bet she's long since dead, probably. Then there's Dillon. He says he's been here since those people up top in Erud blew that big hole in the ground. Not sure what happened but I guess it was a long time ago. Hmmmm, who [else]?");
  }
 elsif($text=~/wait/i){ #Part of Shaman Epic 1.0
  quest::say("We've been waiting quite some time, really. I have been here the least amount of time, but that doesn't help keep the boredom away, heheh. What are we waiting for, you ask? HehehHAahahah! What are we waiting for?? Heheheh, what a silly question! It's quite obvious if you take the time to think about it. Heh. Ummm.. I'm really not sure.");
  }
 elsif($text=~/else/i){ #Part of Shaman Epic 1.0
  quest::say("Ahh, yes, there's also a really old guy I've only seen a couple times, name's Froham. Whew, he is really old, and not much of a talker. Mostly mumbles from time to time. Dillon says he's been here since Erud first took his people across the sea. Not sure who this Erud feller is but Froham isn't in the best of shape, so it must have been a LONG time ago. Froham did mention there's one other guy but we've never seen him. He apparently had something to do with the Combine Empire, no idea what that is though.");
  }
 elsif($text=~/not an illusion/i){ #Part of Shaman Epic 1.0
  quest::say("Awww, well that's too bad. Although illusions and real people don't seem to be much different at times, so, please stay and keep Dillon and me company. We could use it, right Dillon?");
  quest::signalwith(98051,1,0);
 }
}

sub EVENT_SIGNAL {
 if($signal == 0) {
quest::say("Hey there, Dillon! Good to see you again, I think.");
 }
 if($signal == 1) {
  quest::emote("looks around frantically a moment then laughs and says, 'Ohhh, them! Hehehe! This is a friend of mine come to wait with us. Isn't that exciting, Dillon? And it's not just an illusion, I don't think! Say, are you [an illusion], shaman?");
 }
}

sub EVENT_TIMER {
 if ($timer eq "DillonSpawn") {
  quest::spawn2(98051,0,0,4198.4,-1563.4,-291.5,152);
  quest::stoptimer("DillonSpawn");
 }
 if ($timer eq "AskDillon") {
  quest::say("Hey Dillon, why don't you tell us again about what happened up top? You know, where they blew that big hole into the ground.");
  quest::signalwith(98051,0,0);
  quest::stoptimer("AskDillon");
 }
 if ($timer eq "SrafenDepart") {
  quest::start(58);
  quest::say("'Okay, well, I've had enough. Yet again, we've waited for nothing. Sometimes I really wonder if the spirits are real after all. Well I for one am going to go find something fun to do - this is obviously a waste of time. Come with me, shaman, it'll be great fun! Fairwell Dillon.");
  quest::signalwith(98051,2,0);
  quest::stoptimer("SrafenDepart");
 }
 if ($timer eq "FrohamSpawn") {
  quest::spawn2(98047,0,0,4208.8,-1588.6,-291.7,205);
  quest::stoptimer("FrohamSpawn");
 }
 if ($timer eq "SrafenDepop") {
  quest::depop();
  quest::stoptimer("SrafenDepop");
 }
}

#Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)