#The Prophets of Brazz by Osirous

sub EVENT_SPAWN    { 
	my $rand = quest::ChooseRandom(300..1200);
    quest::set_proximity($x - 15,$x + 15,$y - 15,$y + 15,$z - 15,$z + 15);
	quest::settimer("depop", $rand);
} 

sub EVENT_ENTER {
    quest::whisper("Psst! $name, come here for a moment.");

}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		if(plugin::check_hasitem($client, 147497)) {
			quest::say(" have you read through the tome that I gave you already? Well, have you? I don't have time for those who cannot read...");
		} elsif ($ulevel > 50) {
			quest::emote(" coughs harshly in your ear, shoving a book into your hands.");
			quest::summonitem(147497); #Hastily Scribbled Tome
			quest::whisper("take this tome, deliver it to fisherman.");
			quest::emote(" holds up his hand to keep you from speaking, coughing harshly once again.");
			quest::depop(2000046);
		} else {
			quest::emote(" stares at you long and hard before looking past you.");
		}
	}
}

sub EVENT_TIMER {
	
	if ($timer eq "depop"){
		quest::stoptimer("depop");
		quest::depop(2000046);
	}
	
}

sub EVENT_ITEM {
	# consume item script for custom AA Stalwart Hardiness

my $key = $client->CharacterID() . "-Stalwart_AA";
my $value = quest::get_data($key);

	if (plugin::check_handin(\%itemcount, 300002 => 1)) {
		if(!defined($client->CharacterID() . "-Stalwart_AA") == 1){
			quest::set_data($key, 0);
		}
		if ($value == 0){
			$client->IncrementAA(6119);
			quest::set_data($key, $value+1);
		} else {
			$client->Message(14, "You have learned nothing new!");
		}
	}

	if (plugin::check_handin(\%itemcount, 300001 => 1)) {
		if(!defined($client->CharacterID() . "-Stalwart_AA") == 1){
			quest::set_data($key, 0);
		}
		if ($value == 1){
			$client->IncrementAA(6119);
			quest::set_data($key, $value+1);
		} elsif ($value < 1) {
			$client->Message(14, "You cannot use this item yet!");
		} else {
			$client->Message(14, "You have learned nothing new!");
		}
	}

	if (plugin::check_handin(\%itemcount, 300000 => 1)) {
		if(!defined($client->CharacterID() . "-Stalwart_AA") == 1){
			quest::set_data($key, 0);
		}
		if ($value == 2){
			$client->IncrementAA(6119);
			quest::set_data($key, $value+1);
		} elsif ($value < 2) {
			$client->Message(14, "You cannot use this item yet!");
		} else {
			$client->Message(14, "You have learned nothing new!");
		}
	}
}
