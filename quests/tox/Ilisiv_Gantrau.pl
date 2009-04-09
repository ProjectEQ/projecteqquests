sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("You wield great power. The wind whispers to me. You seek to learn more about the augmentation stones found in ruins long forgotten. They hold great power. A mysterious power. I fear however that if you were to fuse one of these magical stones to your Orb of Mastery, it would be lost due to the transitory nature of the Orb. I believe after much research I have discovered a way for you to make use of these stones if you are [interested].");
 }
 elsif($text=~/interested/i){
  quest::say("Hand me your Orb of Mastery. I must infuse the power of the elements into a new orb.");
 }
}

sub EVENT_ITEM {
 #Handin: Orb of Mastery (summoned)(28034)
 if(plugin::check_handin(\%itemcount, 28034 => 1)){
  quest::emote("begins to chant an incantation. The power within the orb begins to grow. A bright flash nearly knocks you to the ground as the power within the Orb begins to flow around you and Ilisiv. Ilisiv kneels down and etches a triangle in the dirt with her fingers. The triangle begins to glow and the power within the orb erupts in a brilliant display of color and immediately infuses the triangle with its power. Ilisiv makes a final gesture over the triangle and a brief swirl of luminescent light encompasses her. A new orb appears on the ground in the center of the triangle. Ilisiv holds her hand over the triangle and after a moment, all is calm again. The glowing light of the triangle fades.");
  quest::say("I do believe this was a success. The power of summoning and elements has been infused into a new orb. Take this new Orb of Mastery. You may now safely use the power of the augmentation stones with your new orb.");
  quest::summonitem(55273); #Ornate Orb of Mastery
 }
 else {
  quest::say("I have no need for this item $name. You can have it back.");
  plugin::return_items(\%itemcount);
 }
}

#Scripted By: Fatty Beerbelly