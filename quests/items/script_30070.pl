# Halloween female human costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54708){
		quest::playerrace(341);
		quest::playergender(1);
	} 
}