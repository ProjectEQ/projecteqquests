#modified by greenbean 03/23/2010

sub EVENT_SPAWN {
   $mob_id = $npc->GetID();
   #Tell the agents I'm alive
   quest::signalwith(201075,1,2);   
}

sub EVENT_DEATH_COMPLETE {
   #Tell the agents I'm dead (unlock return)
   quest::signalwith(201075,11,2);
   
   #Tell the Tribunal the trial was a success
   quest::signalwith(201078,1,2);
   
   #Tell the controller it's over.
   quest::signalwith(201425,2,2);
   
   quest::ze(15, "An unnatural silence falls around you. The justice of the Tribunal has been pronounced once again. The defendants have been found...worthy.");
}

sub EVENT_SIGNAL {
   if ($signal == 0) {
      quest::depop();
   }
} 