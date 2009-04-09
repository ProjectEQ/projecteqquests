sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("So you are the next pathetic maggot I have the displeasure of training to be a useful Shadowknight of the Lodge of the Dead. First you must get yourself outfitted in a suit of [armor]. those rags you wear can not even contain the stench of your miserable hide and will do no good protecting it from the edge of an enemy's blade."); 
}
if($text=~/armor/i){
quest::say("Seek Krivn S'Tai in the Commoner quarter of Neriak and give him this request parchment. Krivn S'Tai has been paid in advance by the Lodge of the Dead for the requested service. Simply give him the request parchment and he will instruct you further. When you have outfitted yourself in a suit of armor return to the Lodge of the Dead and I will grant you [another task].");
quest::summonitem(19584); 
}
if($text=~/task/i){
quest::say("Ah. you are eager to advance further within the Lodge of the Dead. Although it is my duty to aid your training. do not allow your arrogance to blind you to your lowly position amongst the Queens most loyal subjects. Your next task is to assist the construction of a [weapon] and [shield] worthy of being wielded by a Shadowknight of the Lodge of the Dead."); 
}
if($text=~/weapon/i){
quest::say("Beyond the mouth of Neriak lies the Nektulos Forest. There the walking dead can be found digging their way from the ashen soil of the [Ultricle]. their flesh cured and hardened and bones strengthened from the minerals and volcanic ash in which they rested in death. Return some of these undead to the rest they have abandoned and bring to me some Leathered Zombie Flesh, a Petrified Humerus bone, and a Petrified Rib bone."); 
}
if($text=~/shield/i){
quest::say("The bones of the dead that dig from their graves at the [Ultricle] in the Nektulos Forest have been strengthened by the minerals and ashen soil. Return some of these walking dead to the rest they have abandoned and bring to me four Petrified Femurs."); 
}
if($text=~/Ultricle/i){
quest::say("In the Nektulos Forest near the pass to the Lavastorm Mountains is a gray region barren of life whose boundaries are marked by carved stones displaying runes the color of freshly spilt blood. The area the runed stones mark is called the Ultricle. It is where the weak. dead. and dying Teir'Dal that have not earned a noble burial are left to rot and one day if they are lucky join the ranks of the Undead."); 
}
 }

sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 19574 => 1, 16197 => 1, 19554 => 1)) {
  quest::say("Well, you're not completely useless, afterall. Take this sword and sharpen it. Then, return it to me.");
  quest::summonitem(19572);
}
if (plugin::check_handin(\%itemcount, 19573 => 1)) {
   quest::say("I'm surprised, I really am. I didn't think somebody like you could pull it off. Here, take this before I change my mind.");
  quest::summonitem(19607);
  quest::exp(1000);
  quest::faction(69,10);
  quest::faction(87,10);
  quest::faction(88,10);
  quest::faction(322,10);
  quest::faction(91,-20);
}
if (plugin::check_handin(\%itemcount, 19570 => 4)) {
   quest::emote("fashions the petrified femurs into a shield frame. This will be the frame of your new shield. Return now again to the Nektulos Forest, in the gray ashen region of the forest near the Lavastorm mountains the basilisks often come down from the fiery peaks to lay their eggs in the ashen soil. Basilisk hatchlings can be found there as they make their way towards the warmer interior of the mountains. Hunt these basilisk hatchlings and gather two Basilisk Hatchling Skins. Once this is done take the skins and frame to Medron Y'Lask at the Furrier Royale.");
   quest::summonitem(19571);
   quest::exp(1000);
   quest::faction(322,10);
   quest::faction(268,10);
   quest::faction(177,-20);
   quest::faction(170,-20);
   quest::faction(91,-20);
   quest::faction(260,-20);
}
 if ($item1=="18757"){quest::say("Thanks.");
	quest::summonitem("13586");
	quest::exp("100");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:neriakc  ID:42067 -- Ulraz_S`Lon 

