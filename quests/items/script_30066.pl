# Halloween female troll costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54704){
		quest::playerrace(331);
		quest::playergender(1);
	} 
}