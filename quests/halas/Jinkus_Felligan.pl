 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Jinkus Felligan
## ID: 29023
## ZONE: halas
##
############################################

sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Welcome! Welcome to the Church o' the Tribunal! Do ye require healing or are ye [new to the Shamans o' Justice]. then. eh?");
		}
	if($text=~/i am new to the shamans of justice/i)
		{
		quest::say("Then I welcome ye into our noble order. Ye'll serve us well or spend an eternity in the dungeons o' the Tribunal. Are ye ready to [contribute to yer church] or do ye [wish to meditate] within our walls?");
		}
	if($text=~/contribute to my church/i)
		{
		quest::say("Well then, ye best be off ta find Holana Oleary, she organises our monthly Karan Clover shipments, just tell her Jinkus sent you to assist her."); #made up text
		}
#text below is made up as no information could be found on the exact quotes
	if($text=~/meditate with your walls/i)
		{
		quest::say("To achieve the highest state of meditation you should attain a [Symbol of the Tribunal].");
		}
	if($text=~/symbol of the tribual/i)
		{
		quest::say("Visit Cindl and tell her you need a Mammoth HIde Parchment.");
		quest::say("Visit Greta and tell her you need some ink.");
		quest::say("Bring these back to me and we will continue from there.");
		}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 12621 == 1, 12619 == 1)
		{
		quest::say("Good, now you must take this wanted poster i made to Guard Eracon Krengon in Southern Qeynos. Bring me back the Most Wanted List...");
		quest::summonitem(12620); #wanted post
		}
	if(plugin::check_handin(\%itemcount, 12622 == 1)
		{
		quest::say("Fantastic, Fantastic... Here you have more than proven your right to wear this. Use it wisely...");
		quest::summonitem(1376);
		quest::facetion(15,2); #Banker
		quest::faction(213,2); #Merchants of Halas
		quest::faction(294,2); #Shamen of Justice
		quest::faction(33,-3); #Circle of Unseen Hands
		quest::faction(48,-3); #Coalition of Tradefolk Underground
		quest::faction(137,-3); #Hall of the Ebon Mask

		}
  else { 
    quest::say("Why do ye give me these items?"); 
    plugin::return_items(\%itemcount); 
  } 
}
#EoF