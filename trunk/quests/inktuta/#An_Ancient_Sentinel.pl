sub EVENT_SAY {
  if (($text=~/hail/i) && (!defined $qglobals{ink_final})) {
    $client->Message(4,"The sentinel nods solemnly and reaches toward you with a closed palm. His clenched fist opens and an unusual splinter of stone falls into your possession.");
    quest::summonitem(60253);
    quest::setglobal("ink_final",1,0,"F");
  }
}