sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Hail to yourself fool. Leave me be. I have [matters of importance] to ponder.");
 }
 elsif($text=~/matters of importance/i){
  quest::say("If you are so greatly interested in my affairs then so be it. I have lost my skeleten servant. He now wanders the yard, taking his pain out on the new apprentices of our guild. I cannot return to my guild without ridding the yard of that menace for my mistake will cost me dearly if it is brought to the attention of my masters. Hrm. Perhaps you could destroy my pet for me and bring me proof of his removal. If you do I may even grace you with a [reward].");
 }
 elsif($text=~/reward/i){
  quest::say("Speak not of reward when you have not even finished this simple task! Now leave me be.");
 }
}

sub EVENT_ITEM {
 #Handin: 1x Rotting Femur (7107)
 if(plugin::check_handin(\%itemcount, 7107 => 1)){
  quest::say("Ah! You found him and obviously removed his presence from the yard. You have my thanks, small as it is for such a menial task. Here. Keep this worthless bit of bone for your labors.");
  quest::summonitem('7106'); #Noclin's Femur (7106)
  quest::faction(143,1);  # +Heretics
  quest::faction(79,-1);  # -Deepwater Knights
  quest::faction(112,-1); # -Gate Callers
  quest::faction(56,-1);  # -Craftkeepers
  quest::faction(60,-1);  # -Crimson Hands
  quest::exp(5);  
 }
 else {
  quest::say("I have no need for this item $name, you can have it back.");
  plugin::return_items(\%itemcount);
 }
}


#Scripted By: Fatty Beerbelly

