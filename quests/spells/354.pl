# Script for Shadowstep spell

sub EVENT_SPELL_EFFECT_NPC {
  my $mob_caster = $entity_list->GetMobByID($caster_id);
  my $npc_id = $mob_caster->GetNPCTypeID();

  quest::signalwith($npc_id, 354, 0);
}