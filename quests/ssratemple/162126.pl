sub EVENT_SPAWN {
  my $boss1 = $entity_list->GetNPCByNPCTypeID(162227); #Emperor (Real)
  my $boss2 = $entity_list->GetNPCByNPCTypeID(162189); #Blood (Real)
  my $boss3 = $entity_list->GetNPCByNPCTypeID(162064); #Blood (Fake)

  if ($boss1) {
    quest::signalwith(162227,162126,0);
  }
  if ($boss2) {
    quest::signalwith(162189,162126,0);
  }
  if ($boss3) {
    quest::signalwith(162064,162126,0);
  }
}