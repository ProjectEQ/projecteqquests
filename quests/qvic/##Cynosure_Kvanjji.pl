sub EVENT_SIGNAL {
  if($signal == 1) {
    $npc->SetHP($npc->GetHP() + ($npc->GetMaxHP() / 10));
    }
}
