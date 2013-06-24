# Halloween female ogre costume

sub EVENT_ITEM_CLICK {
	if($itemid == 54706){
		quest::playerrace(340);
		quest::playergender(1);
	} 
}