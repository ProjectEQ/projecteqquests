# Halloween male gnome costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54697){
		quest::playerrace(338);
		quest::playergender(0);
	} 
}