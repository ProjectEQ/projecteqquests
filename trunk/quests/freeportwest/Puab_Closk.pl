sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
    if(plugin::check_hasitem($client, 18746)) {
        $client->Message(15, "As you get your bearings, a lightly armored man that appears to be in incredible shape turns to greet you. 'Welcome traveller. I am Puab Closk. If you wish to learn the ways of the Ashen Order, read the note in your inventory and hand it to me to begin your training.'");
    }
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Greetings. I am Puab Closk, Master of the Ashen Order.  Our home is your home, friend. Feel free to stay as long as you like.  Learn our ways as many have done in the past.  To fight like the tiger and strike like the cobra are your goals.");
	}
	if($faction < 4) {
		if($text=~/treant fists/i) {
			quest::say("You desire the treant fists?  I have them and I will offer them to any [skilled monk of the Ashen House].");
		}
		if($text=~/skilled monk of the ashen house/i) {
			quest::say("Then you shall aid our family. My former pupil [Clawfist] has been banished by his people. You will go to him and hand him this token as proof of your origin. He shall be expecting you.");
			quest::summonitem("12369"); # Puab's Token
		}
		if($text=~/clawfist/i) {
			quest::say("Clawfist is a Kerran, a catman. He braved the dangers of Norrath to reach the Ashen Order. He sought knowledge of our disiples. He learned well.");
		}
		if($text=~/where is clawfist/i) {
			quest::say("Clawfist has been banished by the Kerrans of Odus. Where they have sent him I am unsure");
		}
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18746 => 1)) { # A tattered note
		quest::say("Welcome to the house of the Ashen Order. We are a small guild of monks who have devoted our lives to refining our minds, souls, and physical beings to their maximum potential. Please see Brother Torresk as soon as you get a chance. He is in charge of helping our newer members begin their training. Good luck, $name.");
		quest::summonitem(13570); # Torn Brown Shirt*
		quest::ding();
		quest::faction(12,30); # Ashen Order
		quest::faction(184,10); # Knights of Truth
		quest::faction(300,10); # Silent Fist Clan
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 28055 => 1)) { # Tattered Parchment ID-28055
		quest::ding();
		quest::say("You have performed a great service to one who is your brother. Your loyalty shines brightly, as does your skill. Take the treant fists. They are yours now.");
		quest::summonitem("12344"); # Treant Fists ID-12344
		quest::faction("12","10"); # Ashen Order Faction ID-12
		quest::faction("184","10"); # Knights of Truth Faction ID-184
		quest::faction("300","10"); # Silent Fist Clan Faction ID-300
		quest::exp("100");
	}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Monk');
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:freportw  -- Puab_Closk