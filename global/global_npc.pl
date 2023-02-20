sub EVENT_DEATH_COMPLETE {
    my @hate_list = $npc->GetHateListClients();
    my $hate_count = @hate_list;

    if ($hate_count > 0) {
        foreach $ent (@hate_list) {
            quest::debug($npc->GetCleanName() . " was killed by " $ent->GetCleanName());
        }
    }
}