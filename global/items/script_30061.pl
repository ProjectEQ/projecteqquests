# Halloween male erudite costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54699){
		quest::playerrace(342);
		quest::playergender(0);
	} 
}