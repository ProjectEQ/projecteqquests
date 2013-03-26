 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Jarekiv
## ID: 300045
## ZONE: wallofslaughter
##
############################################

sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Greetings $name. I have heard your name spoken in hushed whispers by the few dragorn that still resist Mata Muram's rule. I am Jarekiv, former scout of the Dranik's armies.' The dragorn bows slightly. 'Since my kin was defeated, I have passed the years helping Muramite deserters escape into the wilderness. It's not an easy task, but it keeps me on the move and out of reach of my enemies. Normally I travel with stealth through the bottom of the gorge in the Noble's Causeway, but lately the [wildlife] has grown too fierce to proceed.");
		}
	if($text=~/wildlife/i)
		{
		quest::say("Yes... the ferans in particular. I don't know if it's the influence of Discord, or the fact that the riftseekers use them as pets, but lately their packs have grown too numerous and fierce. If you can thin their numbers, I may be able to resume ferrying Muramite deserters back to their homes. Bring me the skulls of any ferans you are able to slay. I can use them to convince potential deserters that the way is safe once again.");
		}
}

sub EVENT_ITEM
{
	if (plugin::check_handin(\%itemcount, 36558 => 1)) #Feran Skulls
		{
		quest::say("Well done, $name. I have several Muramite deserters that I'm ready to ferry southward. Thanks for clearing the way!");
		quest::faction(410,1); #dranik loyalists Large as advised by quest information as due to feran skill rarity
		quest::faction(432,-1); #overlord mata muram
		}
		plugin::return_items(\%itemcount);
}
#END of FILE