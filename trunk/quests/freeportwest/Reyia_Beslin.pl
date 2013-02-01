############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-YKESHA-beta1
# LAST EDIT DATE: November 9, 2007
# VERSION: 1.1
# DEVELOPER: MWMDRAGON, Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Reyia_Beslin
# ID: 9084
# TYPE: Monk Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Greater Lightstone ID-10400
# Cutthroat Insignia Ring ID-1903
# Legionnaire's Bracer ID-2299
# Orange Sash of Order ID-10132
# Blackened Wand ID-13237
# Blackened Sapphire ID-13238
# Red Sash of Order ID-10133
# Yellow Sash of Order ID-10131
#
# *** QUESTS INVOLVED IN ***
#
#1 - Orange Sash of Order
#2 - Red Sash of Order
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Monk
#2 - Monk
#
############################################


sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Greetings. $name . I am Reyia Beslin of the Ashen Order.  I help to train our members and I am in charge of handing out the orange and red Sashes of Order.  Would you like to know how you can get an [orange sash]? Or maybe you think you are ready to earn the [red sash]?");
   }
   if($text=~/orange sash/i) {
      quest::say("To prove your skills and earn the orange Sash of Order, you must bring me the following items - a greater lightstone, a cutthroat insignia ring, a legionnaire's bracer, and, of course, your yellow sash. I will leave it to you to figure out exactly where to get these items. Good luck, $name .");
   }
   if($text=~/red sash/i) {
      quest::say("So, you think you are skilled enough to earn the red Sash of Order, $name ? I have just the [task] for you then. But be warned, this will be the toughest challenge you have faced yet. There are many legends and myths of great heroes and ancient evils from all over Norrath. Here in Freeport, we get travelers from all over the world, and we get their tales as well. The point is that most of these stories are just that, stories and fairy tales. Told to amuse people and frighten children. I also thought the tales I'd heard about the [Marnek Jaull] were only legends, but now I know better.");
   }
   if($text=~/Marnek Jaull/i) {
      quest::say("Marnek Jaull led a cult of necromancers who followed the Burning Prince, Solusek Ro. He built an army, known as the Burning Dead, and spread destruction and fire throughout Antonica. Over the years, the Burning Dead fought many fierce and bloody battles with the paladins of Prexus, the Oceanlord. Though Marnek achieved many victories over the paladins, ultimately they were able to defeat him and destroy the Burning Dead. Legends say that before his defeat, Marnek created many powerful weapons and items, and wrote many books on his findings in the areas of magic. Many of these items were hidden away from the paladin forces, and remain untouched, waiting for Marnek's return, as the legends go.");
   }
   if($text=~/task/i) {
      quest::say("I've heard a few legends of a powerful wand that Marnek himself used to wield. This was known as the wand of the Burning Dead, and was rumored to instill its owner with mystical energies. The legends I have heard all differed on the wand's creation and powers, but the basic story was always the same. I will [tell you the legend] if you like. The task I have for you is to bring me the two parts that make up the wand of the Burning Dead, before they can be assembled and used for evil once again. Bring me [Marnek's wand] and the [Sapphire of Souls], along with your orange sash, and you will have proven yourself a loyal member of the Ashen Order, worthy of receiving the red sash.");
   }
   if($text=~/tell me the legend/i || $text=~/tell you the legend/i) {
      quest::say("The legend of the wand of the Burning Dead goes basically like this, though you may hear slighty different versions from others. Marnek did a lot of experiments and created an unknown number of diabolical artifacts and weapons. One of his creations was this wand. Marnek fashioned a charred wand from the scorched bone of a paladin of Prexus, and Solusek Ro himself created the wretched Sapphire of Souls. Then, Marnek and his priests combined these, with the Burning Prince's blessing, to create the wand of the Burning Dead. Marnek used this Wand and its powers in his evil and destructive reign over Antonica. Years later, as Marnek starting losing battles to the paladins of Prexus, one of his own followers, a necromancer named Kenox, was able to steal the wand. Sensing Marnek's defeat, Kenox made his way toward Odus, hoping to strike a deal with the paladins for the wand. Would you like me to [tell you about Kenox]?");
   }
   if($text=~/tell me about Kenox/i || $text=~/tell you about Kenox/i) {
      quest::say("Well, Kenox was not as sly as he liked to think he was. Marnek knew full well what he was up to, but let him continue with his plans. Kenox had arranged to meet with two paladins late one nght on a small island in Erud's Crossing, a place that would be considered neutral ground. Sir Toran Neshal, leader of the paladins, knowing the power of the wand, was certainly not going to make any deals with a servant of Solusek Ro, and definitely not foolish enough to take any chances with this mission. Imagine the look on Kenox's face when a ship carrying more than 25 paladins, including Sir Toran, arrived at the small island! The paladins immediately captured Kenox and the wand, and headed back to Erudin. Would like me to tell you [what happened to Toran]?");
   }
   if($text=~/What happened to Toran/i) {
      quest::say("Below the deck of the ship, Toran and his men questioned Kenox and carefully inspected the wand. Toran ordered one of his men to pick up the wand and try to identify its true powers. The man picked up the wand, but was unable to decipher its magic. He handed it to Toran, just as Marnek and Solusek had hoped, and the wand exploded, instantly incinerating the ship and everyone aboard, and lighting up the night sky with a giant fireball. Marnek's plan had succeeded. With the help and blessing of the Burning Prince, they had destroyed Sir Toran and an entire squad of Prexus' finest paladins. Years later, though, the paladins were able to regroup and ultimately defeat Marnek. The wand of the Burning Dead was destroyed and gone forever. Or least, that's what we thought. This wand must never be allowed to be made whole again.");
   }
   if($text=~/Marnek's wand/i) {
      quest::say("Marnek's Wand is rumored to be found in the depths of Befallen. Those who currently hold Befallen are said to be new followers of the Burning Dead. Probably believing that they may one day be able to awaken the evil Marnek again. This group must be stopped, and these evil items destroyed, before their wicked armies grow powerful enough to leave their horrible dungeon and spread throughout Antonica.");
   }
   if($text=~/Sapphire of Souls/i) {
      quest::say("The Sapphire of Souls is rumored to be held by A thief IN Najena. No one knows how this guy obtained the Sapphire, but we believe he is trying to strike A bargain with those who are currently holding Befallen. Apparently and we aren't the only ones who know of the Wand's powers, and this thief thinks he can make A profit from it. Sadly and his greed will surely lead to his death. ");
   }
}

sub EVENT_ITEM {
   # Greater Lightstone ID-10400 - Cutthroat Insignia Ring ID-1903 - Legionnaire's Bracer ID-2299 - Yellow Sash of Order ID-10131
   if(plugin::check_handin(\%itemcount, 10400=> 1, 1903 => 1, 2299 => 1, 10131 => 1)) {
      quest::ding();
      quest::say("You have proven yourself a mighty warrior. I am honored to present you, $name, with the orange Sash of Order.");
      # Orange Sash of Order ID-10132
      quest::summonitem("10132");
      quest::exp("300");
      # Faction Ashen Order ID-12
      quest::faction("12","3");
      # Faction Knights of Truth ID-184
      quest::faction("184","3");
      # Faction Silent Fist Clan ID-300
      quest::faction("300","3");
   }
   # Blackened Wand ID-13237 - Blackened Sapphire ID-13238 - Orange Sash of Order ID-10132
   elsif(plugin::check_handin(\%itemcount, 13237=> 1, 13238 => 1, 10132 => 1)) {
      quest::ding();
      quest::say("Great job, $name ! Congratulations. With the destruction of these evil items, the wand of the Burning Dead will never bring harm to anyone on Norrath again. It is my honor to present to you, on behalf of Master Closk and the Ashen Order, the red sash. May Quellious be with you always.");
      # Red Sash of Order ID-10133
      quest::summonitem("10133");
      quest::exp("400");
      # Faction Ashen Order ID-12
      quest::faction("12","4");
      # Faction Knights of Truth ID-184
      quest::faction("184","4");
      # Faction Silent Fist Clan ID-300
      quest::faction("300","4");
   }
   else {
      #do all other handins first with plugin, then let it do disciplines
      plugin::try_tome_handins(\%itemcount, $class, 'Monk');
      plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:freportw  ID:9084 -- Reyia_Beslin 