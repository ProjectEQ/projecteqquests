################################### 
#Zone: All (Global)               #                                              
#Short Name:                      #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Priest_of_Discord      #                             
#NPC ID: All                      #
#Quest Status: Complete           #                                      
###################################
#OoW Additions: Kovou             #
#oow additions have been checked  #
#out for the moment as oow is not #
#released. when it is realease    #
#simply uncheck all the data and  #
#check the old quest::say         #
###################################
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name .  Are you a child of Order?  If you have come seeking the path of Discord. I require only that you give me your [Tome of Order and Discord] and I shall show you the way.  Only then will you be freed from Order's confining restraints.");
#quest::say("Ah, another who admits that the path to glory and power lies in discord? Have we not always preached the truth? We are the only ones that can give you passage to the new world of purest Discord. Should you like to go there, tell me you [wish to go to Discord] and I will grant you passage. If you wish to [know more] about this travel, I will tell you. And, of course, if you have come to seek the way of Discord in your life, then ask me about your [Tome of Order and Discord].");
	#When OoW Gets Release delete the original hail, and remove # from all of the lines related to oow they are # to prevent confusion at this stage
}
if($text=~/tome/i){
quest::say("The Tome of Order and Discord was penned by the seventh member of the Tribunal and has become the key to a life of Discord. in spite of the author's pitiful warnings.  Do you not have one. child of Order?  Would you [like to read] it?");
}
if($text=~/read/i){ 
quest::say("Very well.  Here you go.  Simply return it to me to be released from the chains of Order.");
quest::summonitem("18700"); 
}
#if($text=~/i want to know more/i){
#quest::say("We have been given a unique magic to pass through realms and we believe it to be the influence of Discord itself granting this gift upon its faithful followers. Only we can send you back and forth to the realm touched by Discord, a world called Kuua. You will find priests on the other side that will send you directly back to me, where your travel originated. And, if you are of the right ilk, I may be able to grant you [additional information].");
#}
#if($text=~/aditional information/i){
#quest::say("'There is a magic in Kuua that is blessed with the power of Discord itself. We have found we can use that magic to help those who help us. If you return three [discordant crystal shards] and a [magic parchment], we will imbue it with our power so you may travel there alone. Obviously, you must be a master of teleportation yourself -- a wizard or druid, is what I mean.");
#}
#if($text=~/discordant crystals shards/i){
#quest::say("The crystal shards are very unique and bear a magic that brims with the power of Discord. We found we can use them to create spells on a specific type of discordant parchment that allows wizards and druids to pass through to the other realm.");
#}
#if($text=~/magic parchment/i){
#quest::say("We are not certain what the parchments were meant for, but they burn hot and cold and are imbued with a magic that protects it from destroying itself. We need one of these parchments to make a travel spell to Kuua in the Realm of Discord.");
#}
#if($text=~/i wish to go to discord/i){
#quest::say("Prepare yourself to cross into the depths of discord!");
#quest::movepc(302,-1428,-1325,229); #NPC should actually cast a spell here
#}
}
sub EVENT_ITEM { 
 if($item1=="18700"){
	quest::say("I see you wish to join us in Discord! Welcome! By turning your back on the protection of Order you are now open to many more opportunities for glory and power. Remember that you can now be harmed by those who have also heard the call of Discord.");
	quest::pvp("on");
 }
# if(plugin::check_handin(\%itemcount, 77766 => 1, 77765 => 3)){
#	quest::say("");
#		if($class eq "Wizard")
#			{
#			quest::summonitem(77659);
#			quest::summonitem(77661);
#			quest::summonitem(77660);
#		if($class eq "Druid")
#			{
#			quest::summonitem(77662);
#			quest::summonitem(77663);
#			}
#}
}