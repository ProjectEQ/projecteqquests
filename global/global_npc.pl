sub EVENT_DEATH_COMPLETE {

    # Global Custom Loot For Non-Greys
    my @hate_list = $mob->GetHasteListClients();
    my $hate_count = @hate_list;
    if ($hate_count > 0) {
        foreach $ent (@hate_list) {
            quest::debug($ent->GetCleanName() . " killed a " . $mob->GetCleanName());
        }
    }
    
}