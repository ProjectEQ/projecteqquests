# Khati Sha Event
# Created by Gonner

sub EVENT_SPAWN {
	quest::settimer(9,60);
	quest::settimer(10,2100);
# Room A
	quest::spawn2(154157,0,0,356.00,-250.00,-7.00,260); # 
	quest::spawn2(154157,0,0,328.00,-250.00,-7.00,260); # 
	quest::spawn2(154157,0,0,356.00,-219.00,-7.00,260); # 
	quest::spawn2(154157,0,0,328.00,-219.00,-7.00,260); # 
# Room B	
	quest::spawn2(154157,0,0,356.00,-337.00,-7.00,260); # 
	quest::spawn2(154157,0,0,329.00,-337.00,-7.00,260); # 
	quest::spawn2(154157,0,0,329.00,-305.00,-7.00,260); # 
	quest::spawn2(154157,0,0,356.00,-305.00,-7.00,260); # 
}


sub EVENT_TIMER {
	if($timer == 9) {
	# Room A
		quest::spawn2(154157,0,0,356.00,-250.00,-7.00,260); # 
		quest::spawn2(154157,0,0,328.00,-250.00,-7.00,260); # 
		quest::spawn2(154157,0,0,356.00,-219.00,-7.00,260); # 
		quest::spawn2(154157,0,0,328.00,-219.00,-7.00,260); # 
	# Room B	
		quest::spawn2(154157,0,0,356.00,-337.00,-7.00,260); # 
		quest::spawn2(154157,0,0,329.00,-337.00,-7.00,260); # 
		quest::spawn2(154157,0,0,329.00,-305.00,-7.00,260); # 
		quest::spawn2(154157,0,0,356.00,-305.00,-7.00,260); #
	}
	
	if($timer == 10) {
		quest::stoptimer(9);
		quest::stoptimer(10);
		quest::signalwith(154130,5,10);
		quest::depop();
}
}

sub EVENT_DEATH {
	quest::stoptimer(9);
	quest::stoptimer(10);
	quest::signalwith(154130,1,10);
}

#END of FILE zone:acrylia ID:154154 -- #Ward_of_Life.pl

