#############
#Quest Name:Honey Jum
#Author:Shaznito
#NPCs Involved:Lil Honeybugger, Kizzie_Mintopp 
#Items Involved:3 Honeycombs, 30 gold
#################

sub EVENT_SAY { 

if($text=~/Hail/i){
 
 quest::say("Enough talk there. chatterbox.  You buy lots of herbs.  I gotta make a living. not more friends.");

}
if($text=~/what is honey jum recipe/i){
 
 quest::say("It's a secret!!  I get the honeycombs and combine them with the secret sauce and..presto.. honey jum!!  It is used by only the wisest as a component.  And you can only get it from Kizzie.  It is also good on batwing crunchies.  If you like.. Kizzie can [make honey jum] for you?");

}

if($text=~/make honey jum for me/i){
 
 quest::say("No, no, no!!  You will not get honey jum until you give Kizzie three honeycombs and thirty gold coins.  Honey jum is valuable.  Kizzie raised the fee!!  That is how it works.");

 }
}



sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 13953 => 3) && $gold == 30) {

 quest::say ("You are one lucky bixie buster. I just made a batch of honey jum. Here. No waiting for you.  One jar for your good work. Bye, now!");

 quest::summonitem(13952);
 quest::faction(218,5);
 quest::faction(77,5);
 quest::faction(133,5);
 quest::faction(208,5);
 quest::faction(48,-5);
 quest::exp(50);
 
}
 
 plugin::return_items(\%itemcount);
 quest::say("This is not all!! Kizzie says, three honeycombs and thirty gold coins!!  Oooh!!  They never listen.");
}
#END of FILE Zone:rivervale  ID:19070 -- Kizzie_Mintopp