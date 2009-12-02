#Tonmerk_Plorsin.pl
#Cure Disease, Cure Poison, Heal Yourself, Errand for Tonmerk

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Hello. child.  Welcome to the Temple of Life. Here. you may pay homage to the [Prime Healer]. [Rodcet Nife].  If you are in need of [healing] or require me to [cure disease] or [cure poison]. please inform me.  I am the resident healer of all Qeynos citizens.");
	}
	
	if($text=~/cure disease/i) {
		quest::say("Yes. we can do that.  First. you must fetch me some bandages and brew me some bog juice.  I.. err.. require the bog juice to.. to dampen the bandages.. Yes that's it!  To dampen the bandages.");
	}
  
	if($text=~/cure poison/i) {
		quest::say("To cast the poison from your body I require one snake fang.  The fang will contain a hint of poison which will help me focus my casting.");
	}
	
	if ($text=~/healing/i) {
		quest::say("You must pay a tribute of five gold coins before I perform the binding of your wounds.");
	}
	
	if($text=~/prime healer/i) {
		quest::say("He is the sustaining force of all life.  It is in honor of Him that the Temple of Life was built.  Engineered with the help of the [Academy of Arcane Science].");
	}

	if($text=~/academy of arcane science/i) {
		quest::say("The Academy of Arcane Science is the greatest school of magic in Antonica.  It houses a wealth of resources and knowledge pertaining to any of the circles of magic.  It is also a marvel of magical engineering.  If you should ever visit Freeport. be sure to let me know.  I seek a faithful cleric to [pickup a reagent].");
	}
	
	if($text=~/pickup a reagent/i) {
		quest::say("Please deliver this potion to Serna Tasknon in The Academy of Arcane Science, she will know what it is that I require.");
		quest::summonitem(13983);#Inert Potion
	}
	
	if($text=~/rodcet nife/i) {
		quest::say("He is the sustaining force of all life.  It is in honor of Him that the Temple of Life was built.  Engineered with the help of the [Academy of Arcane Science].");
	}
}

sub EVENT_ITEM
{
	if (plugin::check_handin(\%itemcount, 12125 => 1)) {#Shark Powder
		quest::say("Rodcet Nife bless you, child.  I thank you for this service.");#Text made up
		quest::faction(9, 10);#Antonius Bayle
		quest::faction(135, 10);#Guards of Qeynos
		quest::faction(183, 10);#Knights of Thunder
		quest::faction(257, 10);#Priests of Life
		quest::faction(21, -20);#Bloodsabers
		quest::exp(10000);
	}
	
	elsif(plugin::check_handin(\%itemcount, 16581 => 1, 13009 => 1)) {#Bog Juice, Bandages
		quest::say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		quest::selfcast(96);#Counteract Disease
	}
	
	elsif(plugin::check_handin(\%itemcount, 13067 => 1)) {#Snake fang
		quest::say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		quest::selfcast(95);#Counteract Poison
	}
	
	elsif($gold + ($silver/10) + ($copper/100) >= 5) {
		quest::say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		quest::selfcast(17);#Light Healing on self.
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:qeynos2  ID:2081 -- Tonmerk_Plorsin