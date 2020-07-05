#############
#Quest Name:Bug Collection
#Author:Shaznito
#NPCs Involved:Blixkin Entopop
#Items Involved:Bug Collection Box, Complete Bug Collection, Fire Beetle Eye
#Giant Fire Beetle Leg, Giant Scarab Egg Sack, Giant Wasp Wing, 
#Spiderling Eye, Spiderling Silk
#################
# items: 17922, 18011, 13268, 14010, 13281, 13280, 14015, 16875

sub EVENT_WAYPOINT_ARRIVE{
	if(($wp eq 2) || ($wp eq 9) || ($wp eq 14) || ($wp eq 21) || ($wp eq 24)){
		quest::say("Ember?!  Ember?!  Where are you, girl?!");
		quest::signal(33065);
	}
}

sub EVENT_SIGNAL{
	quest::say("There you are!  Stay close to me, girl.");
}

sub EVENT_COMBAT{
	quest::say("What do you think you are doing?!?");
}

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Hail, $name! My name is Blixkin Entopop. Have you seen the wonderful assortment of [spiders] and [beetles] that inhabit the thicket? I have quite an extensive [bug collection]. Be careful, though. I have seen many brave halflings fall beneath a [swarm] of clicking and hissing bugs.");
  }
  if($text=~/spiders/i) {
    quest::say("There are many species of bugs out here. The most common are the fire beetles. If you are hunting them, make sure their queen is not around or you will be in deep trouble. Their eyes are a popular item for adventurers because they give off light as if they were on fire. I even had one warrior try to kill [Ember] for her eyes!!");
  }
  if($text=~/ember/i) {
    quest::say("I raised Ember from an egg. She is my faithful pet and quite smart for a beetle. There are plenty of other bugs to squish, out in the thicket, so you had best leave her alone or I will have to SQUISH you!");
  }
  if($text=~/swarms/i) {
    quest::say("Bugs tend to swarm and defend others of their species when they are attacked. So keep your eyes peeled if you intend to squish any of them.. And you'd better not even THINK of squishing [Ember] or you will be sorry!");
  }
  if($text=~/beetles/i) {
    quest::say("There are many species of bugs out here. The most common are the fire beetles. If you are hunting them, make sure their queen is not around or you will be in deep trouble. Their eyes are a popular item for adventurers because they give off light as if they were on fire. I even had one warrior try to kill [Ember] for her eyes!!");
  }
  if($text=~/collection/i) {
    quest::say("Here you go. Just follow the instructions on the [list] so you know what to collect and how to prepare the collection for me.");
    quest::summonitem(17922); # Item: Bug Collection Box
  }
  if($text=~/list/i) {
    quest::say("What did you do, lose the list? Here is another one. Hold onto it because I will want it back when you are done.");
    quest::summonitem(18011); # Item: Want List
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13268 => 1, 18011 => 1)) {
    quest::say("Excellent! Good work! I knew you were the one for this job! Thank you so much! My collection just gets better and better each day. Here is your reward as I promised.");
    quest::summonitem(quest::ChooseRandom(14010,13281,13280,14015,16875)); # Item(s): Potion of Poison Warding (14010), Silver Bracelet (13281), Bracelet of Beetlekind (13280), Spider Venom (14015), Stalking Probe (16875)
    quest::faction(292, 12); # Faction: Merchants of Rivervale
    quest::faction(241, 12); # Faction: Deeppockets
    quest::faction(263, 12); # Faction: Guardians of the Vale
    quest::faction(286, 12); # Faction: Mayor Gubbin
    quest::faction(336, -15); # Faction: Coalition of Tradefolk Underground
    quest::exp(65);
    quest::givecash(0,8,3,0);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:misty  ID:33066 -- Blixkin_Entropop
