sub EVENT_SPAWN {
  $counter=0;
  quest::spawn_condition($zonesn,1,0);
  quest::settimer(1,120);

}

sub EVENT_TIMER {
   quest::spawn_condition($zonesn,1,1);

}

sub EVENT_SIGNAL {
  if($signal == 1) { 
         $counter += 1;
}
  if($counter == 8 ) {			
quest::spawn2(206077,0,0,-266,-879,3,4); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-314,-880,3,510); # NPC: a_manaetic_device
quest::spawn2(206079,0,0,-406,-783,3,130); # NPC: a_manaetic_gadget
quest::spawn2(206077,0,0,-405,-735,3,126); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-312,-644,3,250); # NPC: a_manaetic_device
quest::spawn2(206077,0,0,-263,-642,3,254); # NPC: a_manaetic_contraption
quest::spawn2(206079,0,0,-171,-734,3,376); # NPC: a_manaetic_gadget
quest::spawn2(206078,0,0,-172,-785,3,386); # NPC: a_manaetic_device
}
  if($counter == 16 ) {			
quest::spawn2(206078,0,0,-266,-879,3,4); # NPC: a_manaetic_device
quest::spawn2(206077,0,0,-314,-880,3,510); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-406,-783,3,130); # NPC: a_manaetic_device
quest::spawn2(206079,0,0,-405,-735,3,126); # NPC: a_manaetic_gadget
quest::spawn2(206077,0,0,-312,-644,3,250); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-263,-642,3,254); # NPC: a_manaetic_device
quest::spawn2(206079,0,0,-171,-734,3,376); # NPC: a_manaetic_gadget
quest::spawn2(206077,0,0,-172,-785,3,386); # NPC: a_manaetic_contraption
}
 if($counter == 24 ) {			
quest::spawn2(206077,0,0,-266,-879,3,4); # NPC: a_manaetic_contraption
quest::spawn2(206077,0,0,-314,-880,3,510); # NPC: a_manaetic_contraption
quest::spawn2(206079,0,0,-406,-783,3,130); # NPC: a_manaetic_gadget
quest::spawn2(206079,0,0,-405,-735,3,126); # NPC: a_manaetic_gadget
quest::spawn2(206078,0,0,-312,-644,3,250); # NPC: a_manaetic_device
quest::spawn2(206078,0,0,-263,-642,3,254); # NPC: a_manaetic_device
quest::spawn2(206077,0,0,-171,-734,3,376); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-172,-785,3,386); # NPC: a_manaetic_device
}
 if($counter == 32 ) {			
quest::spawn2(206078,0,0,-266,-879,3,4); # NPC: a_manaetic_device
quest::spawn2(206079,0,0,-314,-880,3,510); # NPC: a_manaetic_gadget
quest::spawn2(206079,0,0,-406,-783,3,130); # NPC: a_manaetic_gadget
quest::spawn2(206078,0,0,-405,-735,3,126); # NPC: a_manaetic_device
quest::spawn2(206077,0,0,-312,-644,3,250); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-263,-642,3,254); # NPC: a_manaetic_device
quest::spawn2(206078,0,0,-171,-734,3,376); # NPC: a_manaetic_device
quest::spawn2(206079,0,0,-172,-785,3,386); # NPC: a_manaetic_gadget
}
 if($counter == 40 ) {			
quest::spawn2(206082,0,0,-266,-879,3,4); # NPC: a_manaetic_contraption
quest::spawn2(206083,0,0,-314,-880,3,510); # NPC: a_manaetic_device
quest::spawn2(206082,0,0,-406,-783,3,130); # NPC: a_manaetic_contraption
quest::spawn2(206084,0,0,-405,-735,3,126); # NPC: a_manaetic_gadget
quest::spawn2(206082,0,0,-312,-644,3,250); # NPC: a_manaetic_contraption
quest::spawn2(206084,0,0,-263,-642,3,254); # NPC: a_manaetic_gadget
quest::spawn2(206082,0,0,-171,-734,3,376); # NPC: a_manaetic_contraption
quest::spawn2(206083,0,0,-172,-785,3,386); # NPC: a_manaetic_device
}
 if($counter == 48 ) {			
    quest::spawn2(206080,0,0,-289,-760,2,500); # NPC: #Assistant_Kelrig
}
 if($counter == 56 ) {			
quest::spawn2(206078,0,0,-266,-879,3,4); # NPC: a_manaetic_device
quest::spawn2(206077,0,0,-314,-880,3,510); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-406,-783,3,130); # NPC: a_manaetic_device
quest::spawn2(206079,0,0,-405,-735,3,126); # NPC: a_manaetic_gadget
quest::spawn2(206078,0,0,-312,-644,3,250); # NPC: a_manaetic_device
quest::spawn2(206079,0,0,-263,-642,3,254); # NPC: a_manaetic_gadget
quest::spawn2(206078,0,0,-171,-734,3,376); # NPC: a_manaetic_device
quest::spawn2(206078,0,0,-172,-785,3,386); # NPC: a_manaetic_device
}
if($counter == 64 ) {			
quest::spawn2(206078,0,0,-266,-879,3,4); # NPC: a_manaetic_device
quest::spawn2(206079,0,0,-314,-880,3,510); # NPC: a_manaetic_gadget
quest::spawn2(206078,0,0,-406,-783,3,130); # NPC: a_manaetic_device
quest::spawn2(206077,0,0,-405,-735,3,126); # NPC: a_manaetic_contraption
quest::spawn2(206077,0,0,-312,-644,3,250); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-263,-642,3,254); # NPC: a_manaetic_device
quest::spawn2(206077,0,0,-171,-734,3,376); # NPC: a_manaetic_contraption
quest::spawn2(206077,0,0,-172,-785,3,386); # NPC: a_manaetic_contraption
}
if($counter == 72 ) {
quest::spawn2(206082,0,0,-266,-879,3,4); # NPC: a_manaetic_contraption
quest::spawn2(206083,0,0,-314,-880,3,510); # NPC: a_manaetic_device
quest::spawn2(206082,0,0,-406,-783,3,130); # NPC: a_manaetic_contraption
quest::spawn2(206084,0,0,-405,-735,3,126); # NPC: a_manaetic_gadget
quest::spawn2(206082,0,0,-312,-644,3,250); # NPC: a_manaetic_contraption
quest::spawn2(206084,0,0,-263,-642,3,254); # NPC: a_manaetic_gadget
quest::spawn2(206082,0,0,-171,-734,3,376); # NPC: a_manaetic_contraption
quest::spawn2(206083,0,0,-172,-785,3,386); # NPC: a_manaetic_device
}
if($counter == 80 ) {			
  quest::signalwith(206080,1,1); # NPC: #Assistant_Kelrig
}
}
