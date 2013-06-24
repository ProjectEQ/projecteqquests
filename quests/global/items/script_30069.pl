# Halloween male human costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54707){
		quest::playerrace(341);
		quest::playergender(0);
	} 
}