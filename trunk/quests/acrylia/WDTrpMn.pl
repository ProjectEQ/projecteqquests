# Khati Sha Event
# Created by Gonner


my $counter;

sub EVENT_SPAWN {
	quest::spawn2(154053,0,0,344.07, -323.49, -7.94,187); # Spiritist_Kama_Resan V2
	quest::spawn2(154052,0,0,342.75, -232.48, -7.94,187); # Spiritual Arcanist V1
	$counter = 0;
	}
	
sub EVENT_SIGNAL {

	if($signal == 1) {
	
		$counter += 1;
		
			if($counter == 1) {
	# Room A
				quest::spawn2(154147,0,0,356.00,-250.00,-7.00,260); # 
				quest::spawn2(154147,0,0,328.00,-250.00,-7.00,260); # 
				quest::spawn2(154147,0,0,356.00,-219.00,-7.00,260); # 
				quest::spawn2(154147,0,0,328.00,-219.00,-7.00,260); # 
	# Room B	
				quest::spawn2(154147,0,0,356.00,-337.00,-7.00,260); # 
				quest::spawn2(154147,0,0,329.00,-337.00,-7.00,260); # 
				quest::spawn2(154147,0,0,329.00,-305.00,-7.00,260); # 
				quest::spawn2(154147,0,0,356.00,-305.00,-7.00,260); # 
			}
			
			if ($counter == 9) {
	# Room A
				quest::spawn2(154147,0,0,356.00,-250.00,-7.00,260); # 
				quest::spawn2(154147,0,0,328.00,-250.00,-7.00,260); # 
				quest::spawn2(154147,0,0,356.00,-219.00,-7.00,260); # 
				quest::spawn2(154147,0,0,328.00,-219.00,-7.00,260); # 
	# Room B	
				quest::spawn2(154147,0,0,356.00,-337.00,-7.00,260); # 
				quest::spawn2(154147,0,0,329.00,-337.00,-7.00,260); # 
				quest::spawn2(154147,0,0,329.00,-305.00,-7.00,260); # 
				quest::spawn2(154147,0,0,356.00,-305.00,-7.00,260); #
				
				quest::spawn2(154155,0,0,403.10,-239.98,37.06,130); # Ward of death
			}

			if($counter == 17) {
				quest::spawn2(154154,0,0,345.00,-277.00,-6.00,260); # Ward of Life
			}	
			
			if($counter == 19) {
				quest::spawn2(quest::ChooseRandom(154095,154122),0,0,614.00,-345.00,-23.00,187); # Spawn EVinvis or #raidman
			}
			
		}
			
	if($signal == 3) { # Succed
		quest::spawn2(154145,0,0,940.00,-610.00,-41.00,0); # Spawn Kahti Sha
		quest::signal(154145,100); # Signal Khati Sha to Shout
		quest::signalwith(154129,5,20); # depops grimlings
		quest::signalwith(154151,6,10); # emotes A Spiritual Arcanist V1
		quest::signalwith(154151,7,500); # depops A Spiritual Arcanist V1
		quest::me("Fare well, warriors, and may you possess the strength to vanquish the evil beyond this doorway.");
		quest::me("The caverns rumble and shake violently as the third protective seals is broken");
		quest::depop();
	}
	
	if($signal == 4) { # Fail
		quest::signalwith(154129,5,20); # depops grimlings
		quest::signalwith(154152,7,500); # depops A Spiritual Arcanist V2
		quest::spawn2(154153,0,0,539.10,-374.98,-24.44,0); # A Spiritual Arcanist Raid. West
		quest::depop();
	}

	if($signal == 5) {
		quest::depop();
	}

}

#END of FILE zone:acrylia ID:154130 -- WDTrpMn.pl

