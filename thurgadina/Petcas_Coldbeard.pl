# items: 60290, 30145
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail to ye as well offlander. I bid you welcome to the Icy Mug, one o' the finest establishments for a drink in Thurgadin. Whether it's [" . quest::saylink("souvenirs") . "], stories, or that [" . quest::saylink("special brew") ."] yer lookin for, you've come to the right place.");
  }
  if($text=~/souvenirs/i) {
    quest::say("Here at the Icy Mug we have our own signature stein fer yer drinkin pleasure. For only 5 gold pieces ye can take one home to show yer kinfolk.");
  }
  if ($text =~ /special brew/i) {
    quest::say("Aha, you're looking for something with a kick to it, eh? Well, I'm willing to give some up to you, but it's going to cost you. Give me 350 gold pieces and I might consider parting ways with some.'");
  }
}

sub EVENT_ITEM {
  if ($gold == 350) {
    quest::say("Here ya go!");
    quest::summonitem(60290); # Item: Special Beans
  } elsif ($gold == 5) {
    quest::say("Here ya go!");
    quest::summonitem(30145); #The Icy Mug Souvenir Stein
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("What's the rush there, youngster?");
		quest::signalwith(115019,1); # NPC: Ronodun
	}
	if($signal==2) {
		quest::say("That's not good, the Grand Historian's mighty protective of his daughter. What he do after he caught ya?");
		quest::signalwith(115019,2); # NPC: Ronodun
	}
	if($signal==3) {
		quest::signalwith(115019,3); # NPC: Ronodun
	}
	if($signal==4) {
		quest::say("Well, coulda been worse. A month's worth of sermons is a far sight better than a trip to the bottom of the Dain's well.");
		quest::signalwith(115019,4); # NPC: Ronodun
	}
	if($signal==5) {
		quest::say("Here ya go, Ronodun, on the house this time. Drink fast, don't need the Grand Historian to come lookin' fer ya...");
		quest::signalwith(115019,5); # NPC: Ronodun
	}
	if($signal==6) {
		quest::say("My pleasure, son. You just remember to keep me in all those prayers you'll be sayin this month. Hahhahah!");
	}	
}

#END of FILE Zone:thurgadina  ID:Not_Found -- Petcas_Coldbeard
