 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Einhorst McMannus
## ID: 12091
## ZONE: qey2hh1
##
############################################

my $rG = quest::ChooseRandom(3,4,5);
my $rS = int(rand(99));
my $rC = int(rand(99));
#Above 3 variables are used to generate random gold silver and copper coin returns

sub EVENT_SAY
{
	if($text=~/Hail/i)
		{
		quest::say("Greetings, $name. Welcome to the fishing village of Clan McMannus. We sell what we can here.  Have a look around but, please do not buy too much. We must save most of our stock for delivery to our home.");
		}
	if($text=~/pick up the lion meat shipment for Halas/i)
		{
		quest::say("Aye, good. Talk to Misla, she will get you the [Lion Roast].");
		}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 18831 == 1)) #Barbarian Head
    		{
		quest::say("What? Ok well, hmm let me see...... Oh there she is, Here is the Shipment as ordered!");
		quest::exp(1600);
		quest::ding();
                  	quest::givecash($rC,$rS,$rG,0);
		quest::faction(361,2); #Wolves of the North
		quest::faction(294,2); #Shamen of Justice
		quest::faction(213,2); #Merchants of Halas
		quest::faction(311,2); #Steel Warriors
		quest::faction(275,-3); #Rogues of the White Rose
		quest::summonitem(13962); #Karana Clover Shipment
		}
}
