#berserker epic
#written:wizardanim
#9/13/07

sub EVENT_DEATH
{
quest::signalwith(78100,15,10);
}

sub EVENT_SPAWN

{
quest::setnexthpevent(50);
}

sub EVENT_HP

{
quest::say("You cannot overcome my infinite rage!");
}