sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18848)) { 
		$client->Message(15,"As your reptilian eyes adjust to the darkness of the room, an imposing Iksar turns towards you, addressing you with a sharp hiss. 'I am Prime Patriarch Vuzx. The time has come young one. You have chosen the path of the Beastlord. Open your inventory and read the note within. Once you are ready to begin your training, hand the note to me and we will continue.'");
  }
}
 
sub EVENT_SAY {
	if($text =~ /hail/i) {
		quest::say("Greetings. I only train those who follow the path of the Patriarchs of Cabilis and have yet to develop their [powers] over the beasts of the wild, or maybe you are trained and are here to [help aid in our cause]?");
	}
	if($text =~ /powers/i) { #Armor of the Patriarch Quest
		quest::say("Good. In order to develop your powers over the beasts of the wild, you must complete several [tests] which will prove your loyalty to our cause. ");
	}
	if($text =~ /tests/i) { #Armor of the Patriarch Quest (part 1 - Patriarch's Bracer)
		quest::say("In order to develop your powers you will need to collect various items which will serve to me as proof of your continued training. When you return the items to me, I will reward you with a piece of armor to help protect you from the dangers found outside our city walls. Go now and bring me four leech husks as proof of growing powers. ");
	}
	if($text =~ /aid/i) { #Claw of the Cub Quest (Claw of the Spiritual Elder Quest Line 1/6)
		quest::say('Good. Well we shall see how well you match up with our needs with this first mission. Go out beyond the safety of our city walls and bring back proof of your inner strength and training. This proof will be in the form of a sarnak raider brain, a froglok bounder javelin, an Iksar bandit mask, and a mandible from a rogue shaman.');
	}
}
 
sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 12686 => 4)) { #Armor of the Patriarch Quest (part 2 - Patriarch's Cap)
		quest::say("You have done well in your first test young patriarch! Wear these bracers to help protect you from the dangers you may find in your journey. Now for your next test you shall bring me three spiderling silks and one scarab carapace as continued proof our your growing powers. ");
		quest::summonitem(7827);
		quest::exp(20000);
		quest::ding();
		quest::faction(282,20);
		quest::faction(193,10);
	}
	elsif(plugin::check_handin(\%itemcount, 13099 => 3, 13849 => 1)) { #Armor of the Patriarch Quest (part 3 - Patriarch's Leggings)
		quest::say("You have done well again young patriarch. Wear this cap proudly. Now for your next test, you shall bring me four watcher signal torches as proof of your growing powers. ");
		quest::summonitem(7828);
		quest::exp(20000);
		quest::ding();
		quest::faction(282,20);
		quest::faction(193,10);
	}
	elsif(plugin::check_handin(\%itemcount, 12441 => 4)) { #Armor of the Patriarch Quest (part 4 - Patriarch's Claw)
		quest::say("You are doing very well in your training young patriarch! Wear these leggings proudly. For your next text, you will need to bring me two Sarnak Broodling fangs and two Goblin Hunter javelins. When you have completed this test, I will reward you with the Patriarch's claw. ");
		quest::summonitem(7829);
		quest::exp(20000);
		quest::ding();
		quest::faction(282,20);
		quest::faction(193,10);
	}
	elsif(plugin::check_handin(\%itemcount, 14599 => 2, 12432 => 2)) { #Armor of the Patriarch Quest (part 5 - Patriarch's Leather)
		quest::say("You have made me proud young patriarch! Here is your Patriarch's claw, which will help you against the dangers you will find in your journeys. Now there is one final task that you will need to complete. For this task, you will need to bring me four froglok tuk buckers. When you have completed this final task, you will indeed be a true Patriarch of Cabilis. ");
		quest::summonitem(7830);
		quest::exp(20000);
		quest::ding();
		quest::faction(282,20);
		quest::faction(193,10);
	}
	elsif(plugin::check_handin(\%itemcount, 8999 => 4)) { #Armor of the Patriarch Quest
		quest::say("Congratulations young Patriarch, you have proven yourself to be worthy of our cause. Wear your armor proudly, as it is the symbol of a true Patriarch of Cabilis. ");
		quest::summonitem(7831);
		quest::exp(20000);
		quest::ding();
		quest::faction(282,20);
		quest::faction(193,10);
	}
	elsif(plugin::check_handin(\%itemcount, 12409 => 1, 12431 => 1, 12428 => 1, 12727 => 1)){ #Claw of the Cub Quest (Claw of the Spiritual Elder Quest Line 1/6)
		quest::say("You have done well on your way to becoming a great patriarch. Now I must tend to other pressing issues. Take your reward and wear it proudly.");
		quest::summonitem(48045);
		quest::exp(80000);
		quest::ding();
		quest::faction(282,20);
		quest::faction(193,10);
	}
	elsif (plugin::check_handin(\%itemcount, 18848 => 1)) { #A tattered note
		quest::say("The Hierophants have sensed that your spirit is strong with obedience inspiring fear! You must learn to harness your [powers] over the scaled wolves! Wear this tunic so that the Legion of Cabilis will recognize you as a Scaled Spiritist."); #Proper text still needed
		quest::summonitem(13577); #Dusty Green Tunic
		quest::ding();
		quest::faction(282,10); #Scaled Mystics
		quest::faction(193,10); #Legion of Cabilis
		quest::exp(100);
	}
	plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
	plugin::return_items(\%itemcount);
}
 