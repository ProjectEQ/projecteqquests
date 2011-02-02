sub EVENT_SPAWN {
if(!defined $qglobals{gaschmb2complete}) {
    quest::set_proximity($x-20,$x+20,$y-30,$y+20);
   }
}
sub EVENT_ENTER {
    quest::ze(15,"From somewhere behind the walls there is a deep rumbling.");
    quest::settimer(1,20);
}
sub EVENT_TIMER {
quest::ze(15,"From somewhere behind the walls there is a deep rumbling.");
quest::ze(15,"Out of the corner of your eye you perceive movement. Within the recession on the door a mechanical lock rotated
counter-clockwise. It was visible for only a fraction of a second, but that was long enough to make an educated
guess to which key it now accepts.");
	  @list = $entity_list->GetClientList();
	  $size = @list;
	  $index = int(rand($size)) -1;
	  $player = @list[$index];
		$ranmessage = int(rand(4)) +1;
if($ranmessage == 1) {
  $player->Message(15,"The Cracked Key must unlock the door to the next room.");
    quest::setglobal("gaschmb2",1,3,"M5"); 
}
if($ranmessage == 2) {
  $player->Message(15,"The Dusty Key must unlock the door to the next room."); 
    quest::setglobal("gaschmb2",2,3,"M5");
}
if($ranmessage == 3) {
  $player->Message(15,"The Polished Key must unlock the door to the next room."); 
    quest::setglobal("gaschmb2",3,3,"M5");
}
if($ranmessage == 4) {
  $player->Message(15,"The Jagged Key must unlock the door to the next room."); 
    quest::setglobal("gaschmb2",4,3,"M5");
}
}
