# Halloween male ogre costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54705){
		quest::playerrace(340);
		quest::playergender(0);
	} 
}