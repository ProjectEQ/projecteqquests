# #a_corrupted_gnome_explorer
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
#
# a corrupted gnome explorer - 1 hour spawn timer
# Location 1170, neg 750 under the ladder.
# Reported here: http://everquest.allakhazam.com/db/spell.html?spell=4017;page=1;howmany=50#m106042964289209
#
# Mob Data: http://eqbeastiary.allakhazam.com/search.shtml?id=12822
# 1 hour pop, PH'd  by undead frogloks, L45 SK.

sub EVENT_DEATH_COMPLETE {
    quest::spawn2(66174,0,0,$x,$y,$z,$h);
}