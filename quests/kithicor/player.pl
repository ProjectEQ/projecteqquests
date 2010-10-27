sub EVENT_TASK_STAGE_COMPLETE {
	if($task_id == 212) {
		quest::summonitem(87319,5);
		$client->AddLevelBasedExp(10, 0);
		quest::setglobal("halloween_zombie",1,0,"H3");
		$client->Message(15,"The zombie presence seems somewhat lessened, and perhaps they have been quelled . . . for the time being.");
	}
}

sub EVENT_SIGNAL {
        if($signal == 666){
                quest::updatetaskactivity(212,0,1);
                quest::faction(98,-30);
        }
        if($signal == 667){
                quest::updatetaskactivity(213,0,1);
        }
}