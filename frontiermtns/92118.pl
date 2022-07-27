#This Iksar slave is actually Veltar, one of Master Rinmark's students. We interact with him and grant him his freedom in order to move further in the monk shackle quest line that eventually culminates in the Whistling Fists
# items: 12839, 4194, 4195, 4196

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("seems to have lost all hope. He sadly looks to the ground. His shackles are different than the others you see in this cell. One is definitely steel and not of goblin design. The other is made of an unfamiliar metal.");
 }
 elsif($text=~/veltar/i){
  quest::emote("'s soiled face shines with a glint of hope. 'You know my name? Who has [sent] you to find me?'");
 }
 elsif($text=~/master rinmark sent/i){
  quest::say("Then word has gotten to him!! If you be a monk of the third rung I will accept your aid. You must find the [coppernickel key]. It is required to release me from this goblin shackle. I have no reward to offer other than the shackle of steel. Give me both your shackles of the third rung along with the key and I shall reward you the first shackle of the fourth rung.");
 }
 elsif($text=~/coppernickel key/i){
  quest::say("The key is split into three parts. Part one is the base and must be combined with the two remainder pieces. One piece is in here and the other was lost. I overheard the goblins chattering and recognized the goblin phrase, 'lair of flying mouths'!! As for the base, I do not know.");
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 12839 => 1, 4194 => 1, 4195 => 1)){
  quest::emote("hands you a shackle and removes the coppernickel shackle so he may flee. He places your shackles on his wrists and darts into the darkness.");
  quest::summonitem(4196); # Item: Shackle of Steel
  quest::exp(50000);
  quest::ding();
  quest::faction(444,20); # Faction: Swift Tails
  quest::faction(441,10); # Faction: Legion of Cabilis
 }
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills
