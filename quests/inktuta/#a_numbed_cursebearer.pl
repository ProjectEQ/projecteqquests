sub EVENT_SPAWN {
  @list = $entity_list->GetClientList();
  $size = @list;
  $index = int(rand($size)) - 1;
  $player = @list[$index];
  $player->Message(15,"The thoughts of a cursed trusik invade your mind, 'You will share my fate. Do not attempt to resist. I am coming for you.'");
  quest::attack($player->GetName());
}

sub EVENT_SLAY {
  quest::depop();
}
