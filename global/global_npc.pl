sub EVENT_DEATH {

    # Global Custom Loot For Non-Greys
    my @hate_list = $npc->GetHateListClients();
    my $hate_count = @hate_list;
    if ($hate_count > 0) {
        foreach $ent (@hate_list) {
            quest::debug($ent->GetCleanName() . " killed a " . $npc->GetCleanName());
        }
    }
    
}