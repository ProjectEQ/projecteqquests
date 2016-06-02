#Quest Name: Necromancer Spells
#Author: JanusD
#Zone: The Overthere
#NPC Name: Vaean the Night
#NPC ID: 93113
#Quest Items Needed: Spell: Convergence (19423), Spell: Defoliation(19296), Spell: Splurt(19294), and Spell: Thrall of Bones(19299)


sub EVENT_SAY {
if($text =~ /Hail/i){
  quest::say("Ahh, welcome! More souls to succumb to the inhabitants of the Outlands! My army of undead will grow stronger by the day, but it would be a pity if you perished before doing a [mortal bidding] for me.");
  }

if($text=~/mortal bidding/i){
  quest::say("I see it as a win-win situation for me. If you succeed, I'll gain more power from the knowledge you bring back to me. If you fail, you become another addition to my undead minions. Thus, you cannot fail me in returning a scroll of Splurt, Defoliation, Covergence, or Thrall of Bones. In return, I will part with a scroll of mine.");
  }
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 19423 => 1) || plugin::check_handin(\%itemcount, 19296 => 1) || plugin::check_handin(\%itemcount, 19294 => 1) || plugin::check_handin(\%itemcount, 19299 => 1)){
  quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell.");
  quest::summonitem(quest::ChooseRandom(19297,19421,19408,19409));
  quest::exp(500);
  }
  plugin::return_items(\%itemcount);
}


#End of file 