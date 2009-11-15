 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Greta Terrilon
## ID: 29036
## ZONE: halas
##
############################################

sub EVENT_SAY
{
if($text=~/I need some ink/i)
	{
	quest::say("Here you go.");
	quest::summonitem(12619);
	}
}