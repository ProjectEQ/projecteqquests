sub EVENT_SPAWN {
quest::delglobal("ZSB_Door");
quest::setglobal("ZSB_DoorExit", 1, 7, "F");
}

sub EVENT_COMBAT {
 
  if ($combat_state == 1) {
quest::say("Who will be my first victim!");
quest::setnexthpevent(98);
}

if ($combat_state == 0) {
quest::delglobal("ZSB_Door");
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
}
}

sub EVENT_HP  { 

if ($hpevent == 98) {
quest::setnexthpevent(91);
quest::setglobal("ZSB_Door", 1, 7, "F");
}
}
sub EVENT_DEATH {
quest::say ("Perhaps it was my time to die...");
$timestamp = localtime(time);
quest::write("text_files/Tacvi.txt","[$timestamp]:$mname was killed by $name the $class.");
quest::delglobal("ZSB_Door");
quest::delglobal("ZSB_DoorExit");
}


