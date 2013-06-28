# Trampled Slaves
# They lie on the ground and don't attack

sub EVENT_SPAWN
{
    quest::settimer("try_sit", 5);
}

sub EVENT_TIMER
{
    if($timer eq "try_sit")
    {
        $npc->SetAppearance(3);
    }
}

sub EVENT_DEATH_COMPLETE
{
    quest::stoptimer("try_sit");
}

# EOF zone: Tutorialb