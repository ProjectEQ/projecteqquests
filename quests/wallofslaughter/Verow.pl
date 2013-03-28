 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Verow
## ID: 300041
## ZONE: wallofslaughter
##
############################################

sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Greetings. I am Verow, the last of Clan Aru'Shar. My clan name was once spoken as a title of dignity and honor in Dranik. Have you heard of my kin? No, of course you haven't. Clan Aru'Shar is no more. The [bloodline] dies with me.");
		}
	if($text=~/bloodline/i)
		{
		quest::say("The Aru'Shar clan lived for hundreds of generations. . . until Mata Muram gathered the nobles and sent them on a death march across Kuua. I was but a hatchling then and escaped only because my ankles were small enough to squeeze out of my manacles. The rest of my [kin] were not so lucky.");
		}
	if($text=~/kin/i)
		{
		quest::say("Several other nobles gave me chance to slip away by pretending to collapse from weariness.' Verow bows his head slightly. 'I never had a chance to thank them for their help. It shames me to know that their [crests] are still in the possession of the Muramites.");
		}
	if($text=~/crests/i)
		{
		quest::say("The members of each noble house wore an insignia crest on the clasp of their cloaks. The ikaav stole these crests when the march began, stripping us of our heritage. If you can find these ikaav and return with the crests of my kin, it would honor the memory of my lost clan. I cannot offer much, but the few dragorn that still remember the noble clans will be in your debt.");
		}
}

sub EVENT_ITEM
{
	if (plugin::check_handin(\%itemcount, 36560 => 1)) #Stolen Dragorn Clan Insignia
		{
		quest::say("I recognize this crest! Thank you, $name. The dragorn noble clans may be lost and scattered, but with your help they may at least be remembered. Please return to me if you find any more.");
		quest::faction(410,1); #dranik loyalists
		quest::faction(432,-3); #overlord mata muram
		}
  plugin::return_items(\%itemcount);
}
#END of FILE