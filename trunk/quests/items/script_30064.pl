# Halloween female dark elf costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54702){
		quest::playerrace(339);
		quest::playergender(1);
	} 
}