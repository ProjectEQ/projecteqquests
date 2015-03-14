 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Gorvoroth
## ID: 303080
## ZONE: wallofslaughter
##
############################################

sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::me("The dragorn bows as you approach. 'Greetings. I know not of your heritage or family, but I beseech you none-the-less. My farms are being overrun by roving murkgliders. Too many dragorn warriors have been slain or conscripted by the Muramites and now there's no one left to defend us forgotten serfs. I beg of you, spare my life and slay as many murkgliders as you can. Bring me their blood for its scent will ward off the rest of the hive. Please help. The Muramites have forgotten us.'");
		}

}

sub EVENT_ITEM
{
	if (plugin::check_handin(\%itemcount, 55835 == 1)) #Thin Out the Murkgliders
		{
		quest::me("The dragorn takes the blood from you. 'Thank you, $name. This should keep the murkgliders at bay for a while. Let me know if you recover any more.'");
		quest::faction(410,1); #dranik loyalists
		quest::faction(432,-3); #overlord mata muram
		}
		plugin::return_items(\%itemcount);
}
#END of FILE