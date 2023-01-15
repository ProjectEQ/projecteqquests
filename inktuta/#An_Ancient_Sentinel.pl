# items: 60253
sub EVENT_SAY {
	if (($text=~/hail/i) && (!defined $qglobals{ink_final}) && !plugin::check_hasitem($client, 60253)) {
		$client->Message(15,"The sentinel nods solemnly and reaches toward you with a closed palm. His clenched fist opens and an unusual splinter of stone falls into your possession.");
		quest::summonitem(60253); # Item: Splinter of the High Temple
		quest::setglobal("ink_final",1,0,"F");
	}
}