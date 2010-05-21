sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 138, $x + 138, $y - 138, $y + 138);
}

sub EVENT_ENTER {
   if(!plugin::check_hasitem($client, 19719) && !$client->KeyRingCheck(19719)) {
        quest::movepc(162,0,0,2.2,65);
} 
 }