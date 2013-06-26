my $sphere = undef;
my $raid = undef;
my $group = undef;
my $pc = undef;
my $count = undef;

sub EVENT_SPAWN {
	$sphere = undef;
}

sub EVENT_SIGNAL {
	#Signal from KoS on death event
	quest::depop_withtimer();
}

sub EVENT_SAY {
	
	if ($pop_pot_shadyglade == 1) {
		if ($text=~/Hail/i && $sphere == undef) {
			quest::emote("doesn't move, but struggles to whisper, '...help ...end this torment ...will you come? I can show you the pain... it moves in the shadows of my mind... will you assist me?'");
		}
		if ($text=~/will assist you/i) {
			quest::say("I..I don't want anyone else to suffer my fate... If you are certain you can help, show me your Screaming Sphere as proof of your strength.");
		}
		if ($text=~/ready/i && $sphere == 1) {
			$raid = $entity_list->GetRaidByClient($client);
			$group = $entity_list->GetGroupByClient($client);
			#move the person who triggered as they may not be in range (z axis) 
			#of the spot on the floor directly under the cage.
			$client->MovePC(207,-175,815,-955,0);
			if ($raid) {
				for ($count = 0; $count < $raid->RaidCount(); $count++) {
					$pc = $raid->GetMember($count);
					#using z-15 to calculate from the spot on the floor under Tylis not from Tylis
					#and only move players within 15 units of the spot directly under Tylis
					if ($pc->CalculateDistance($x,$y,$z-15) <= 15) { 
						$pc->MovePC(207,-175,815,-955,0);
					}
				}
			}
			elsif ($group) {
				for ($count = 0; $count < $group->GroupCount(); $count++) {
					$pc = $group->GetMember($count);
					#using z-15 to calculate from the spot on the floor under Tylis not from Tylis
					#and only move players within 15 units of the spot directly under Tylis
					if ($pc->CalculateDistance($x,$y,$z-15) <= 15) { 
						$pc->MovePC(207,-175,815,-955,0);
					}
				}
			}
		}
	}
}

sub EVENT_ITEM {

	if ($pop_pot_shadyglade == 1 && plugin::check_handin(\%itemcount, 22954 => 1)) {
		quest::summonitem(22954);
		quest::say("Please tell me when you are ready. I do not know if I have enough energy to channel all of you, but I can try. When you are ready, I will channel you into my pain.");
		quest::settimer(1,300);
		$sphere = 1;
	}
  plugin::return_items(\%itemcount);
}


sub EVENT_TIMER {
	if ($timer == 1) {
		quest::stoptimer(1);
		$sphere = undef;
	}
}

# End of File  Zone: PoTorment  ID: 207014 -- Tylis_Newleaf
# Written by Romai, so you have someone to blame if I botch it