sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. $name!  I am Vacto Molunel.  If you are seeking to outfit yourself with the finest weapons in all of Kaladim. I am the one to see.  I also posses a [rare talent] you might find useful.");
}
if($text=~/what rare talent/i){
quest::say("Piqued your interest. did I?  Well. you see. I am one of the few dwarves who possess the knowledge and talent to craft a unique type of armor entirely out of scarab carapaces.  While my specialty is making [scarab helms]. I have also been convinced to make [scarab breastplates] and [scarab boots] from time to time.  All of the pieces I craft are to dwarven proportions. but I have had some gnomish and halfling customers as well.  They come from all over for my armor.");
}
if($text=~/what scarab helms/i){
quest::say("Interested in a scarab helm. are you?  Well. because my talent is so unique and my time is so valuable. I am afraid I could only make you a helm if you were to provide me with the two scarab carapaces necessary to accommodate a head such as yours.  I will also need a payment of 5 gold pieces.  The Butcherblocks are crawling with worker scarabs that have just the right size carapaces for our needs.");
}
if($text=~/what scarab breastplates/i){
quest::say("Ah..  A  scarab breastplate.. hmm.  Well. if you want to convince me to go though the trouble of crafting one of those. not only will you have to pay my fee of 23 gold pieces. you must provide me with a pristine giant scarab carapace.  I refuse to make a breastplate with cracked carapaces."); 
}
if($text=~/what boots/i){
quest::say("Ah..  Scarab Boots.. hmm.  Well. if you want to convince me to go though the trouble of crafting a pair of those. not only will you have to pay my fee of 17 gold pieces. you must provide me with a cracked giant scarab shell and 2 scarab legs."); 
}
 }

sub EVENT_ITEM { 
    if (plugin::check_handin(\%itemcount, 13849 => 2) && ($gold >= 5)) { # helm 
      quest::summonitem(2175); 
      quest::say("Here is your Scarab Helm!"); 
    } 
    if (plugin::check_handin(\%itemcount, 13133 => 1) && ($gold >= 23)) { # breastplate 
      quest::summonitem(2176); 
      quest::say("Here is your Scarab breastplate!"); 
    } 
    if (plugin::check_handin(\%itemcount, 13132 => 1, 13848 => 2) && ($gold >= 17)) { # boots 
      quest::summonitem(2177); 
      quest::say("Here is your Scarab boots!"); 
    }
	plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladima  ID:60004 -- Vacto_Molunel 

