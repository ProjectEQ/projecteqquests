# Attempt to limit players level 53 and over from engaging nagafen and vox.
# Banished to Lavastorm.
my $spawn_x = 0;
my $spawn_y = 0;
my $spawn_z = 0;
my $spawn_h = 0;

sub EVENT_SPAWN {
	$spawn_x = $x;
	$spawn_y = $y;
	$spawn_z = $z;
	$spawn_h = $h;
	my $range = 200;
	quest::set_proximity_range($range, $range);
	quest::setnexthpevent(96);
}

sub EVENT_HP {
	#if my HP are dropping make certain the timer is running
	#this gets around 100% pet tanking, because the owner is
	#on the aggro list but with 0's and EVENT_AGGRO isn't firing.
	quest::stoptimer(1);
	EVENT_AGGRO();
	#backup safety check
	quest::setnexthpevent(int($npc->GetHPRatio()) - 9);
}

sub EVENT_ENTER {
	if ($ulevel >= 53 && $status < 80) {
		quest::echo(0, "I will not fight you, but I will banish you!");
		$client->MovePCInstance(27, $instanceid, -64, 262, -93.96, 0); # Zone: lavastorm
	}
}

sub EVENT_AGGRO {
	# a 1 second leash timer.
	quest::settimer(1,1);
}

sub EVENT_TIMER {
	if ($timer == 1) {
		if ($x < -1000 || $x > -650 || $y < -1500 || $y > -1290) {
			WIPE_AGGRO();
		}

		my @hate_list = $npc->GetHateListClients();
		my $hate_count = @hate_list;
		if ($hate_count > 0) {
			foreach $ent (@hate_list) {
				my $h_ent = $ent->GetEnt();
				my $h_dmg = $ent->GetDamage();
				my $h_hate = $ent->GetHate();
				if ($h_ent->GetLevel() > 52 && $h_ent->CastToClient()->Admin() < 80) {
					quest::ze(0, "I will not fight you, but I will banish you!");
					$h_ent->CastToClient()->MovePCInstance(27, $instanceid, -64, 262, -93.96, 0); # Zone: lavastorm
				}
			}
		} else {
			WIPE_AGGRO();
		}
	}
}

sub WIPE_AGGRO {
	$npc->BuffFadeAll();
	$npc->WipeHateList();
	$npc->SetHP($npc->GetMaxHP());
	$npc->GMMove($spawn_x, $spawn_y, $spawn_z, $spawn_h);
	quest::stoptimer(1);
	quest::setnexthpevent(96);
}
