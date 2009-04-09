# NPC: Droga Mobs
# Angelox

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("Your kind is not welcome here! Prepare to die!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("Your dead corpse will soon line my pockets with gold!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("How dare you enter our realm!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("Death will come quickly!");
    }elsif($combat_state == 1){
    quest::say("Halt! who enters here?");}
}
# Droga Mobs
