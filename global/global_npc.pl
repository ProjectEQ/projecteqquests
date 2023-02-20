sub EVENT_DEATH_COMPLETE {
    my @hate_list = $npc->GetHateListClients();
    my $hate_count = @hate_list;
    my $max_level = 0;

    if ($hate_count > 0) {
        foreach $ent (@hate_list) {
            quest::debug($npc->GetCleanName() . " was killed by " . $ent->GetEnt()->CastToClient()->GetCleanName());
            my $level = $ent->GetEnt()->CastToClient()->GetLevel();
            if ($level > $max_level) {
                $max_level = $level
            }
        }
    } else {
        quest::debug("No Hate List");
    }


}