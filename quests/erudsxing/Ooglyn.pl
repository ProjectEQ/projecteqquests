sub EVENT_SAY {
 if($text=~/hail/i){ #Part of Shaman Epic 1.0
  quest::say("Ooooh, it you, $name. Me's been waitin for you cuz our frenz say you comin an need da test. So's I gib you da test. Hmm, now where me put it? Ooglyn been waiting for sign for so long dat me forget where me put test. Keep your eyes out for sign while me look for test. Oh, hey, $name, they gib you gem? I need dat gem, please, heheh.");
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 1666 => 1)){ #Part of Shaman Epic 1.0
  quest::say("Ahhh, tank you, now me can...OH LOOK!! DA SIGN!!!! Oh, sorry you missed it. The sign show you where to wait for da test. Follow me...I like you so I take you there. We goin for a swim, $name!");
  quest::faction(342,50);
  quest::exp(1000);
  quest::say("Ok shaman, let us be off.");
  quest::start(57);
  quest::settimer("Speak",105);
 }
}

sub EVENT_TIMER {
 if ($timer eq "Speak") {
  quest::say("Ok, here is place for you to for waiting. Hab fun shaman!");
  quest::stoptimer("Speak");
  quest::settimer("Depart",120);
  }
 if ($timer eq "Depart") {
  quest::start(58);
  quest::stoptimer("Depart");
  quest::settimer("OoglynDepop",241);
  quest::settimer("SrafenSpawn",240);
  
 }
 if ($timer eq "SrafenSpawn") {
  quest::spawn2(98046,0,0,4209.4,-1575.5,-289.4,181);
  quest::stoptimer("SrafenSpawn");
 }
 if ($timer eq "OoglynDepop") {
  quest::depop_withtimer();
  quest::stoptimer("OoglynDepop");
 }
}

#Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)
