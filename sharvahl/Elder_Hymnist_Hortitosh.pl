# items: 2873, 2878, 18324, 5991, 18552, 2897, 3920, 3921
sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18552)) { 
		$client->Message(15,"You enter a room filled with the sound of soothing music. A noble looking Vah Shir turns to greet you. 'Hello. Welcome, friend. I am Elder Hymnist Hortitosh. Read the note in your inventory and then hand it to me to begin your training.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Hail. are you here to assist with something specific or just looking for something to do.");
	}
	if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
		quest::say("Luckily for you someone found it.");
		quest::summonitem(2873); # Item: Application for Citizenship
	}
	if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
		quest::say("Someone found this under a table at the one of the pubs. Try not to lose it this time.");
		quest::summonitem(2878); # Item: Initiate's Cloak of Shar Vahl
	}
	if ($text=~/essence of sonnet/i) {
		quest::emote("stops what he is doing and looks at you, most surprised");
		quest::say("An essence of sonnet? I have never produced such a thing my friend, though the fact that you would even request one from me is very flattering.' His eyes leave your face and settle off in the distance somewhere as he continues, 'I was present once when one was created... it was beautiful. I was only a child, but there was no mistaking the significance. Oh how I would love to produce such a thing myself- an accomplishment without peer for one of my art. They say that the inspiration must be genuine, should you know of something that could inspire me so then by all means, I will see if I have an essence of sonnet within me.");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18324 =>1 )) {
		quest::say("Thanks, $name!  That is a wonderful story of inspiration.");
		quest::summonitem(5991); # Item: Essence of Sonnet
	}
	elsif(plugin::check_handin(\%itemcount,18552 => 1)) { # Hymnist Guild Summons
		quest::say("Our newest instrumentalist arrives! You have grown strong in the safety of our city and it is time now for you to repay our society. The Jharin. keepers of our history. accept you and deem you to be worthy of our training. Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
		quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
		quest::setglobal("Shar_Vahl_Cit",1,5,"F");
		quest::summonitem(2873); # Application for Citizenship
		quest::ding();
		quest::exp(20);
	}
	elsif (plugin::check_handin(\%itemcount, 2897 => 1)) {
		quest::say("This item. by itself. means nothing to me.");
		quest::say("$name. citizen of Shar Vahl. accept this cloak as a symbol of your loyalty and service to our noble people. It will grow with you. young initiate. and like you it has incredible potential. Present your slate of citizenship to Gherik and he will guide you through your early training. May your songs inspire us all!");
		quest::setglobal("Shar_Vahl_Cit",7,5,"F");
		quest::summonitem(2878); # Item: Initiate's Cloak of Shar Vahl
		quest::ding();
		quest::exp(100);
	} 
	elsif(plugin::check_handin(\%itemcount, 3920=>1)){
		quest::say("These are finely crafted indeed, $name. Merchant Fahaar told me you were quite the prodigy, but don't tell him I told you that. Take this receipt and show it to Fahaar and tell him the king is quite pleased with both your work, and his teaching!");
		quest::exp(1000);
		quest::ding();
		quest::summonitem(3921); # Item: Order Receipt
	} 
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155166 -- Elder_Hymnist_Hortitosh 
