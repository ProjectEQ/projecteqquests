sub EVENT_SPAWN {
  $ikky1_event = 0;
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if($ikky1_event == 0){
       quest::say("You are not ready to see me, begone!");
       }
    if($ikky1_event == 1) {   
    quest::emote("can't see you nor does he know your name. He blinks as he regards you as a trusik.");
    quest::say("You have made it through the trials of this sanctuary. The Guardian of Righteousness was my creation and will be forevermore. It is a ward against those who are not worthy and a test to those trusik priests who believe they can become the highest among priests -- the Vrex. You are most talented to have made it this far. Now, though, it is time for me to rest. I left something with my creations that you should have with you, correct? Hand it to me now.");
  }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60220 => 1)) {
    quest::say("Ah, my shawl.");   #Need live text
    quest::spawn2(294577,0,0,$x,$y,$z,$h);
    quest::depop_withtimer();
  }
}
sub EVENT_SIGNAL {
  if($signal == 1) {
  quest::settimer(1,1);
}
}

sub EVENT_TIMER {
{
    quest::stoptimer(1);
    quest::settimer(1,1);
    $named_ikky1 = 0;
}
 $check_named = $entity_list->GetMobByNpcTypeID(294338);
	if ($check_named) {
		$named_ikky1 = 1;
        }
 $check_named = $entity_list->GetMobByNpcTypeID(294339);
	if ($check_named) {
		$named_ikky1 = 1;
        }
 $check_named = $entity_list->GetMobByNpcTypeID(294575);
	if ($check_named) {
		$named_ikky1 = 1;
        }
 $check_named = $entity_list->GetMobByNpcTypeID(294574);
	if ($check_named) {
		$named_ikky1 = 1;
        }        
   if($named_ikky == 0) {
   $ikky1_event = 1; 
   quest::stoptimer(1);    
   }
}