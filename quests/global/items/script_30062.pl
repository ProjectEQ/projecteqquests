# Halloween female erudite costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54700){
		quest::playerrace(342);
		quest::playergender(1);
	} 
}