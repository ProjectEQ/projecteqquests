sub EVENT_SPAWN {
  quest::settimer("jillin",550);
}

sub EVENT_TIMER {
 if ($timer eq "jillin") {
  quest::say("[Jillin]? Jillin? Where did he go? Hrumph!");
 }
}

sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Hello. $name.  Welcome to the Fool's Gold!  Cards are upstairs. drinks are down here.  Have fun!"); 
}
if($text=~/jillin/i){
quest::say("Jillin is my courier. He was supposed to take this pot of [stew] over to Deputy Lowmot in Guardian Stronghold. It is just about ready and Mayor Gubbin hates cold stew!"); 
}
if($text=~/stew/i){
quest::say("Here. Take it to Lowmot. The stew is already paid for but the good Deputy usually tips Jillin quite well. Hurry! It's getting cold!");
quest::summonitem(13959);
}
   }

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 13958 => 1)){
quest::say("Well it is about time!  The mayor gets very upset if he does not have the freshest of carrots in his stew.  Here is the money for the carrots.  Be off with you.  Now. where the heck did [Jillin] go?");
quest::givecash(1,0,0,0);
quest::faction(77, 1);
quest::faction(218, 1);
quest::faction(31, -2);
quest::faction(33, -2);
quest::faction(48, -2);
quest::exp(100);
quest::ding();
}
if (plugin::check_handin(\%itemcount, 13957 => 1)){
quest::say("Oh excellent! These carrots are perfect! The finest Reebo has ever sent us. The mayor will be so pleased. Here is the payment for the carrots. Excuse me, but I must finish preparing the stew. Hmm. Where the heck did [Jillin] go?");
quest::givecash(10,0,0,0);
quest::faction(77, 5);
quest::faction(218, 5);
quest::faction(31, -10);
quest::faction(33, -10);
quest::faction(48, -10);
quest::exp(200);
quest::ding();
}
if (plugin::check_handin(\%itemcount, 13971 => 1)){
quest::say("What are these?!  I am trying to make stew for the mayor and you bring me ROTTEN CARROTS?!  Have you no sense??  Take these back to Reebo.");
quest::summonitem(13972);
quest::faction(77, -4);
quest::faction(218, -4);
quest::faction(31, 2);
quest::faction(33, 2);
quest::faction(48, 2);
}
plugin::return_items(\%itemcount);
 }

#END of FILE Zone:rivervale  ID:19091 -- Blinza_Toepopal
