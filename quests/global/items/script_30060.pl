# Halloween female gnome costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54698){
		quest::playerrace(338);
		quest::playergender(1);
	} 
}