# #Gribnor_the_Small
# Part of illusion:Guktan quest http://everquest.allakhazam.com/db/quest.html?quest=2605
#
# SK, DB to 56 (Estimated level 52 from 781 harm touch)
# Location reported here
# http://everquest.allakhazam.com/db/spell.html?spell=4017;page=1;howmany=50#m106025054163802
#
# http://eqbeastiary.allakhazam.com/search.shtml?id=12809
# Uncharmable, Unmezzable, mitigates slow (mostly successful), enrages, summons.
# KoS to all except Trolls and Ogres, it seems

sub EVENT_DEATH {
    quest::spawn2(42115,0,0,$x,$y,$z,$h);
}