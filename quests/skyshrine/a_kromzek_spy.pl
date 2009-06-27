sub EVENT_AGGRO {
  quest::say("Your bones will be crushed by the Kromzek of Kael Drakkel!");
}

sub EVENT_COMBAT {
     if($combat_state ==  1){
          quest::npcrace(189);
     }
     if($combat_state ==  0){
          quest::npcrace(127);
     }
}

# Quest by mystic414