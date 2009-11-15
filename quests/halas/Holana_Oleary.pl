 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Holana Oleary
## ID: 29027
## ZONE: halas
##
############################################

my $rands = quest::ChooseRandom(15270,15275,15075,15271,15279,15212,15079,15274,15272);
# : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : Scale Skin : Spirit Pouch : In that order
my $randa = quest::ChooseRandom(2031,2036,2030,2034,2027,2038,2026,2029,2025,2032,2028,2033);
# Complete Set of Large Leather Items
my $randw = quest::ChooseRandom(5043,6032,6030,7022,7024,94155,6031);
# All SHM usable tarnished weaponry

sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Hmph. Hello. how are ye an' how do ye do? Now. what are ye planning to buy?");
	if($text=~/Jinkus sent me to assist you/i)
		{
		quest::say("About time he get around to it. Hmph. What i be needing you ta do is head on over to Einhorst McMannus in the plains of the western karana region. Give him this and he should have the shipment ready. Bring it back to me when ye be done."); #made up text
		quest::summonitem(18831); # Tattered Note identifying as Message to Clan McMannus
		}
}

sub EVENT_ITEM
{
my $rewardr = quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10);
	if(plugin::check_handin(\%itemcount, 13962 == 1)) #Karana Clover Shipment
    		{
		quest::say("We can now rest assured that justice has been served. Ye'll be a valuable asset to our court. Take and remember this spell, Spirit o' the Bear. I hope ye've attained the necessary skills to scribe it. If not, I'm sure ye soon will. Go now, and serve justice.");
		quest::exp(1600);
		quest::ding();
	                  quest::givecash($rC,$rS,$rG,0);
		quest::faction(213,2); #Merchants of Halas
		quest::faction(294,2); #Shamen of Justice
		quest::faction(33,-3); #Circle of Unseen Hands
		quest::faction(48,-3); #Coalition of Tradefolk Underground
		quest::faction(137,-3); #Hall of the Ebon Mask
			if($rewardr  < 4)
				{
				quest::summonitem($rands);
				}
			if($rewardr < 7 && > 3)
				{
				quest::summonitem($randa);
				}
			if($rewardr < 10 && > 6)
				{
				quest::summonitem($randw);
				}
			if($rewardr > 9)
				{
				quest::summonitem(2912); # Polar Bear Cloak
				}
		}
}