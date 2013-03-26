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
if ($text=~/I am from the Temple of Life/i) {
  quest::say("Oh, yes.. They always come for Kizzie's [honey jum]. They should have sent you next week. There is a [problem].");
}
if ($text=~/what problem/i) {
  quest::say("You see.. Joogl Honeybugger is hurt. He usually collects the [Honeycombs]. Only he knows where to get them. I need the Honeycombs to make the Honey Jum. Go and speak with Joogl. He is at his burrow outside of Rivervale. He says he cannot work. Tell him you need the Honeycombs.");
}
if($text=~/honey jum/i){
 
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
}
#END of FILE Zone:rivervale  ID:19070 -- Kizzie_Mintopp