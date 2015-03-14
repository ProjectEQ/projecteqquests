# Halloween male troll costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54703){
		quest::playerrace(331);
		quest::playergender(0);
	} 
}