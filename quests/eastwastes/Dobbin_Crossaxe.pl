sub EVENT_SIGNAL {

	if($signal == 1)
	{
	$ring_seven_final=1;
	quest::say("We thought it was too late, the Dain will be very pleased!");
	quest::say("Please friend, show me your Mithril ring and I will show you our gratitude.");
	}

	if($signal == 2)
	{
	$ring_seven_final=undef;
	}

}

sub EVENT_ITEM { 
		if($itemcount{30162} == 1 && $ring_seven_final == 1){

			quest::say("Thank you. $name. your deeds will be mentioned to  the Dain. Please take this note from Corbin to Garadain. it may help him to achieve victory over the enemy.");
			$ring_seven_final=undef;
			quest::summonitem(1047);
			quest::faction(49,5);
			quest::faction(67,5);
			quest::faction(188,-10);
			quest::faction(189,-10);
		 }


}

#END of FILE Zone:eastwastes  ID:116129 -- Dobbin_Crossaxe 

