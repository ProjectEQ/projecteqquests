# NPC: a_desert_madman
# Angelox

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=35)){
    quest::say("Damn my eyes! You're just another mirage!");
    }elsif(($combat_state == 1) &&($random_result<=70)){
    quest::say("${race}s like you are better left dead than alive.");
    }elsif(($combat_state == 1) &&($random_result<=95)){
    quest::say("It's ${race}s like you who have ruined your own lands, You'll not ruin mine!");}
}
# OASIS
