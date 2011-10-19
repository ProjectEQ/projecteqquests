# Thank you to Skomag over at EQTitan for this.

# handles Vibrating Gauntlets/Hammer of Infuse
# clicking the items transmutes back and forth
# script file is used to bypass the lore check error
# 
# item 11668 Vibrating Gauntlets of Infuse
# item 11669 Vibrating Hammer of Infuse
# spell 1823 Transmute Gauntlets
# spell 1824 Transmute Hammer

sub EVENT_ITEM_CLICK_CAST {
        my %transmute = ();
        $transmute[11668] = 1824;
        $transmute[11669] = 1823;

        if($itemid && $transmute[$itemid]) {
                $client->NukeItem($itemid);
                $client->CastSpell($transmute[$itemid], 0, 10, 0, 0);
        }
}