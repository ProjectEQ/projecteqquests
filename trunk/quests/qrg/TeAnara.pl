sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class eq "Druid")) { 
		$client->Message(15,"As you orient yourself amongst the peacefulness of the Surefall Glade, a melodic, peaceful voice seems to float on the wind. 'I am Te'Anara, Master of the Woods. Read the note in your inventory and when you wish to begin your training, hand it to me. We must preserve the heart of the Jaggedpine lest all of Norrath will perish!'");
  }
}

sub EVENT_SAY { 
	if ($text=~/Hail/i){
		quest::say("Welcome, friend! I hope your stay in Surefall Glade will ease your mind and soothe your soul. While you are here, we ask you to abide by the [laws of the Jaggedpine].");
	}
	if ($text=~/laws of the jaggedpine/i) {
		quest::say("We ask that you do not start campfires on our land. Do not litter our land with any items. Do not chop down our pines or tread upon any foliage. Please do not take more than a bellyful of fish. Do not harm any other wildlife and stay clear of [the great bear]!");
	}
	if ($text=~/great bear/i) {
		quest::say("The great bear I speak of is Mammoth. He has lived among us for over a century. Tunare has truly blessed us with his presence. As long as Mammoth lives, so too does Surefall Glade. We are currently worried. Corun has reported that there is something [wrong with Mammoth].");
	}
	if ($text=~/wrong with Mammoth/i) {
		quest::say("Mammoth is not eating. We believe something is lodged in his throat. We require a young druid to [fetch a special potion].");
	}
	if ($text=~/fetch a special potion/i) {
		quest::say("Go to the gnome city of Ak'Anon on the continent of Faydwer. With their great zoo, you will find a gnome named Kimble Nogflop. Give him this flask of nitrates and he shall hand you a special potion which will force Mammoth to cough up whatever may be stuck inside his throat. Be sure to show me what you find inside his throat upon your return.");
		quest::summonitem(13945);
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18809 => 1)) {
		quest::say("Oh my, this must belong to Antonius Bayle! I shall see that he receives it. You have done a great service to Qeynos and Surefall Glade. I rewards you with this. May it be of good use in your future deeds.");
		quest::summonitem(15222);
		quest::faction(159, 10);
		quest::faction(265, 10);
		quest::faction(267, 10);
		quest::faction(135, 10);
		quest::faction(347, -30);
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 18713 => 1)) {  # Tattered Note
		quest::say("Well met, friend of the forest. You will find power and enlightenment amidst these woods. Here, wear this tunic and represent the Jaggedpine with pride. Gerael Woodone will help train you and teach you the duties of Jaggedpine Treefolk. The forests, being the soul and heart of Norrath, depend on you and your actions from this day forth.");
		quest::ding();
		quest::summonitem(13510);
		quest::faction(159, 10);#Jaggedpine Treefolk
		quest::faction(265, 10);#Protectors of Pine
		quest::faction(267, 10);#QRG Protected Animals
		quest::faction(347, -15);#Unkempt Druids
		quest::faction(135, 10);#Guards of Qeynos		
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 18807 => 1)) { #Sealed Letter [Note To Jaggedpine - real]
		quest::say("Aye! This is good news. We shall try to supply Qeynos with a limited number of acres to begin their lumberyard. Here, my good messenger. A token to share in the good news.");
		quest::faction(159, 10);#Jaggedpine Treefolk
		quest::faction(265, 10);#Protectors of Pine
		quest::faction(267, 10);#QRG Protected Animals
		quest::faction(347, -20);#Unkempt Druids
		quest::faction(135, 10);#Guards of Qeynos
		quest::exp(16000);
		quest::givecash(0, 8, 2, 0);#8sp, 2gp
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
		plugin::return_items(\%itemcount);
	}
}

# Quest by mystic414
#End of File zone:qrg ID: 3035 -- Te-Anara.pl