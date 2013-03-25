 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Eracon Krengon
## ID: 1086
## ZONE: qeynos
##
############################################

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 12620 => 1))
		{
		quest::say("hmm yes i see have added him to the List, Here take this back to Jinkus.");
		quest::summonitem(12622); #list of qeynos most wanted
		}
    plugin::return_items(\%itemcount); 
}