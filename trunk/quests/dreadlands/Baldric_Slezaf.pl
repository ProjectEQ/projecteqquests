################################### 
#Zone: The Dreadlands             #                                              
#Short Name: dreadlands           #                                                                  
#Zone ID: 86                      #                                        
###################################                                             
#NPC Name: Baldric_Slezaf         #                             
#NPC ID: 86097                    #
#Quest Status: Complete           #                                      
###################################

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hello, $name. Don't you think this would be a wonderful place to perform a [symphony]?");
  }
  if($text=~/symphony/i){
    quest::say("It has been my dream for years to perform a symphony that would be remembered for ages to come. I have run into a few [minor snags], however.");
  }
  if($text=~/minor snags/i){
    quest::say("Several years ago I bought sheets of the most beautiful sounding music from a traveling merchant. He did not know the author of the work as it was simply signed 'the Maestro'. The melody I played from them was wondrous and invoked feelings in me I have never felt before. However, as I reached the middle of the music, I discovered it was [missing two pages]!");
  }
  if($text=~/missing two pages/i){
    quest::say("The pages that were missing were pages 24 and 25. I have been searching the world for a spot to hold my symphony and I have finally found it. Without the music and a new [lute] crafted by the famous instrument maker Forpar Fizfla, I do not think I can pull it off.");
  }
  if($text=~/lute/i){
    quest::say("Forpar Fizfla is an eccentric instrument maker from Ak'Anon. He makes enchanted instruments that enhance the sound of the [music]. If I am to perform the concert of all concerts, I must have one of his instruments. I went to Ak'Anon, seeking to purchase an instrument from him but he wouldn't even speak to me.");
  }
  if($text=~/music/i){
    quest::say("It makes me sad to know that the pages of this music may be spread across the world or destroyed. If you find and bring me the two missing sheets as well as a new lute, I would be happy to [repay] you in some way.");
  }
  if($text=~/repay/i){
    quest::emote("pulls a fantastic looking sword from its scabbard and says");
    quest::say("I might be willing to part with this wonderful sword if I were able to perform this symphony. You would also gain recognition at the opening of the symphony.' Baldric sheathes his sword and begins to hum a haunting melody."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20376 => 1, 20383 => 1, 20377 => 1, 20538 => 1)) {
    quest::emote("looks shocked as you hand him the pages and the mystical lute. 'I will put on a symphony the likes of which the gods have never seen. Thank you so much, $name. Please take this sword as a token of my gratitude.");
    quest::summonitem(20542);
    quest::exp(350000);
  }
  plugin::return_items(\%itemcount);
}