# RoF Event

my $guard_khataruss_id = 48250;
my $guard_scithiss_id = 48251;
my $guard_thrasciss_id = 48249;

my $high_priest_id = 48041;

# npcId = 48249
sub EVENT_SPAWN {
    quest::emote("attacks with eerie speed!");
}

sub EVENT_DEATH_COMPLETE {
    if (!$entity_list->IsMobSpawnedByNpcTypeID($guard_khataruss_id)
        && !$entity_list->IsMobSpawnedByNpcTypeID($guard_scithiss_id)
        && !$entity_list->IsMobSpawnedByNpcTypeID($guard_thrasciss_id)
        && $entity_list->IsMobSpawnedByNpcTypeID($high_priest_id)) {

            quest::spawn2($guard_khataruss_id, 0,0, 594, 955, -80, 0);
            quest::spawn2($guard_scithiss_id, 0,0, 594, 955, -80, 0);
            quest::spawn2($guard_thrasciss_id, 0,0, 594, 955, -80, 0);
        }
}
