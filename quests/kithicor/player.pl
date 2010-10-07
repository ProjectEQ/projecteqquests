sub EVENT_TASK_STAGE_COMPLETE {
	if($task_id == 212) {
		quest::summonitem(87319,5);
		quest::exp(100);
		quest::setglobal("halloween_zomebie",1,0,"H3");
		$client->Message(15,"The zombie presence seems somewhat lessened, and perhaps they have been quelled . . . for the time being.");
	}
}