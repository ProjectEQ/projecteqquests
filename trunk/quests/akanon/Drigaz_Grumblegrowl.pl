################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Drigaz_Grumblegrowl    #                             
#NPC ID: 55157                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Grrreetings, $name. would you like to share a roasted rat steak or perhaps a tall glass of gnomish spirits? Have no fear of my appearance. My bark is meaner than my bite! Grraw haw haw!"); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1779 => 1, 14585 =>1)) {
    quest::say("I had hoped to see the last of these sorrowful symbols. There is little I can tell you of the details of the kobold religion as I was rescued from death as a pup by the Deep Muses and reunited with Brell Serilis. What I know is this, the deity this symbol represents is named Rolfron Zek. He was a devoted shaman of Brell before the Abandonment, now he is the lord of Despair and Hopelessness. There is a shaman of Rolfron that teaches the local kobolds, he carries with him a doctrine. Recover the doctrine and take it with this translation scroll back to your Temple");
    quest::summonitem(1780);
    quest::exp(1500);
    quest::faction( 210, 20);
    quest::faction( 115, 20);
    quest::faction( 71, -20);
  }
}

