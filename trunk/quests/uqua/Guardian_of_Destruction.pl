sub EVENT_SPAWN {
  $npc->WipeHateList(); 
  plugin::SetAnim(dead);
}