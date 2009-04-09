### This mob is spawned from the zerker epic event.
### Signals upon death to allow next line of text

## SPECIAL NOTE: THIS mob should have the buff: Blood Shield.
## It is an 800 damage damage shield
## On live, the axes distroy this shield, but on the emu, i dont know
## how to make axes destroy the shield.  Just kill him with the
## summoned axes, you have an unlimited supply if you keep talking
## to the quest mob.

## Technically this is a RANGE KILL, so i wont worry about the axes break
## the damage shield.  RANGE KILL means BRING FRIENDS.  He has lots of HP.
## From what i am reading, no less than 10-12k hp.
## Max melee hit 150 -- damage shield buff -- DOES NOT MOVE AT ALL.

sub EVENT_DEATH

{
	quest::signalwith(85091,1,1);
}