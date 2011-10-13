# Halloween male dark elf costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54701){
		quest::playerrace(339);
		quest::playergender(0);
	} 
}