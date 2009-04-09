########################################
# NPC: Sneed_Galliway.pl
# Zone: qeynos2
# by: Andrew80k

sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Hello. $name.  I am Sneed Galliway, merchant and citizen.  I run the only general store in all of Qeynos. serving the needs of the many adventurers who call Qeynos home.  If only one of them would take the time to help me with my er... [problem]...");

}

if($text=~/problem/i){

quest::say("Shhh..  Keep it down.  It seems I have a little rodent problem in my store.  A mangy rat keeps digging into my crates of rations.  He looks as if he is diseased.  If you help me by killing this pest. I will make it worth your while.  Bring me his head as proof it is done.");
}
if($text =~ /Ronn Castekin/i) {
     quest::say("Ronn? I saw him a few days ago. He was with someone dressed in black I didn't recognize .. I think I saw them later that day, swimming in the north pond. They really should stay away from the aqueducts. They can be quite dangerous. Full of rats, ya know.");
}
}

sub EVENT_ITEM { 

   if (plugin::check_handin(\%itemcount, 13717 =>1 )) {
     quest::say("HA!  Good work!  I knew you were the person for the job.  A regular ratslayer you are.  Here is your reward as promised.  Be sure you keep this between us.");
    quest::givecash("6","0","0","0");
     quest::exp(500);
     quest::ding();
     quest::faction("217","1");
     quest::faction("33","-1");
     quest::faction("9","1");
     quest::faction("47","1");
     quest::faction("135","1"); 
   }
   plugin::return_items(\%itemcount);

}

#END of FILE Zone:qeynos2  ID:2058 -- Sneed_Galliway
