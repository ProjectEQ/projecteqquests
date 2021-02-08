############################################
# ZONE: North Qeynos (qeynos2)
# DATABASE: PEQ-YKESHA-beta1
# LAST EDIT DATE: September 30, 2007
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Seta_Bakindo
# ID: 2086
# TYPE: Monk Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Silent Fist Assembly Kit ID-17270
# An Enchanged Cap Pattern ID-22583
# An Enchanted Bracer Pattern ID-22584
# An Enchanted Sandals Pattern ID-22585
# An Enchanted Sleeves Pattern ID-22586
# An Enchanted Trousers Pattern ID-22587
# An Enchanted Gloves Pattern ID-22588
# An Enchanted Robe Pattern ID-22589
# Sironans Head ID-27425
# Yalroens Head ID-27426
# High Quality Gnoll Fur ID-27427
# Silent Fist Clansman Hand Wraps ID-27494
#
# *** QUESTS INVOLVED IN ***
#
# Silent Fist Cap
# Silent Fist Bracer
# Silent Fist Sandals
# Silent Fist Sleeves
# Silent Fist Trousers
# Silent Fist Gloves
# Silent Fist Robe
# Silent Fist Problem
# Tomer's Rescue
#
# *** QUESTS AVAILABLE TO ***
#
# Anyone not KOS
#
############################################
# items: 17270, 22583, 22584, 22586, 22585, 22587, 22588, 22589, 27425, 27426, 27427, 27494

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Ah... Welcome friend. I am Master Seta, of the Silent Fist Clan. We know that true strength lies inside your soul. Once you have found and mastered it, your fists will be deadlier than any blade.  I am also currently in charge of training our new recruits. If you are new monk of the Silent Fist I  have some [tests] for you to complete.");
   }
   if($text=~/tests/i) {
      quest::say("I pride myself on passing some of the finest monks in all of the lands through my testing halls. I mainly attribute this fact to my training program that all young monks must undergo. When you are [ready to begin the tests] I will present you with your Silent Fist Assembly Kit and explain to you how the tests work.");
   }
   if($text=~/begin the test/i) {
      quest::say("Be mindful of your surroundings $name, it is here in Qeynos and in the adventuring areas surround it that you will find all the necessary items for creating Armor of the Silent Fist. You will place a number of items in this kit to create infused armor materials. These magical armor materials can then be combined in a loom with a magical pattern to create different Armor of the Silent Fist pieces. When you are ready to collect the items for a specific armor piece please tell me what armor piece you want to craft. I can present you with the patterns for Silent Fist [Cap], [Bracers], [Sleeves], [Sandals], [Trousers], [Gloves] and [Robes].");
      # Silent Fist Assembly Kit ID-17270
      quest::summonitem("17270");
   }
   if($text=~/cap/i) {
      quest::say("To create your cap material you will need to combine 2 Woven Spider Silks, 1 Skeleton Tibia, 1 Field Rat Skull and a Cloth Cap in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Cap of the Silent Fist.");
      # An Enchanted Cap Pattern ID-22583
      quest::summonitem("22583");
   }
   if($text=~/bracers/i) {
      quest::say("To create your bracer material you will need to combine 1 Woven Spider Silk, 2 Rat Whiskers, 1 Gnoll Jawbone and a Cloth Wristband in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Bracer of the Silent Fist.");
      # An Enchanted Bracer Pattern ID-22584
      quest::summonitem("22584");
   }
   if($text=~/sleeves/i) {
      quest::say("To create your sleeves material you will need to combine 2 Woven Spider Silks, 2 Rabid Wolf Hides, and Cloth Sleeves in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Sleeves of the Silent Fist.");
      # An Enchanted Sleeves Pattern ID-22586
      quest::summonitem("22586");
   }
   if($text=~/sandals/i) {
      quest::say("To create your boot material you will need to combine 3 Woven Spider Silks, 1 Severed Gnoll Foot, 1 Gnoll Backbone, 1 Bone Chip and Cloth Sandals in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Sandals of the Silent Fist.");
      # An Enchanted Sandals Pattern ID-22585
      quest::summonitem("22585");
   }
   if($text=~/trousers/i) {
      quest::say("To create your trouser material you will need to combine 4 Woven Spider Silks, 1 Bandit Sash, 1 Matted Lion Pelt and 1 Giant Spider Egg Sack in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Trousers of the Silent Fist.");
      # An Enchanted Trousers Pattern ID-22587
      quest::summonitem("22587");
   }
   if($text=~/gloves/i) {
      quest::say("To create your glove material you will need to combine 3 Woven Spider Silks, 1 Giant Fire Beetle Eye, 1 Chunk of Meat, 1 Ale and 1 Young Puma Skin in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Gloves of the Silent Fist.");
      # An Enchanted Gloves Pattern ID-22588
      quest::summonitem("22588");
   }
   if($text=~/robe/i) {
      quest::say("To create your robe material you will need to combine 5 Woven Spider Silks, 1 High Quality Cat Pelt, 1 Shadow Wolf Paw, 1 Severed Gnoll Foot, 1 Matted Lion Pelt and 1 Cloth Shirt in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Robe of the Silent Fist. Please come see me after you have completed your robe. I need to see you for some help with a [problem] our clan has been having.");
      # An Enchanted Robe Pattern ID-22589
      quest::summonitem("22589");
   }
   if($text=~/problem/i) {
      quest::say("There have been numerous muggings lately in Qeynos by corrupt guards. These guards are sworn to protect, server and uphold law in the city but all the do is break the law ten fold themselves. These corrupt individuals must be stopped. I have a [Silent Fist clan member] that I feel may be in trouble.");
   }
   if($text=~/silent fist clan member/i) {
      quest::say("Konem Matse is my friend and mentor, he resides in Qeynos Hills providing security for the Sayers there. Lately though I have heard reports of guards demanding he pay them tax or else. This tax they speak of does not exist. I need you to go to the hills and help Konem. Rid the lands of these corrupt guards and bring me their heads as proof. I will also need 1 High Quality Gnoll Fur for a tailoring project I have been working on. Return to me with these items and you will be rewarded for your troubles.");
   }
   if($text=~/Tomer Instogle/i) {
      quest::say("Oh, Tomer? We haven't heard from him in days, I'm really starting to worry. . . We need to have someone go [find him].");
   }
   if($text=~/find him/i) {
      quest::say("One of our clan brothers has not reported back in over three days. He was sent to help defend the Qeynos Gates, and we haven't heard from him since. We need you to find him, if he is still alive. Tell him that Seta has sent you to find him, and escort him back to our guild. Good luck.");
      # Initialize flag to Tomer_Instogle for this player
      quest::targlobal("FindTomer", 1, "M30", 2030, $charid, $zoneid);
   }
   if(($text=~/I have rescued Tomer Instogle/i) or ($text=~/I found Tomer/i)) {
      # Tomer_Instogle sets this flag
      if($SetaTomer == 1) {
         quest::say("Great work $name, we thought that was the last we'd seen of young Tomer.");
         # Update the flag to Tomer Instogle for this player
         quest::targlobal("FindTomer", 2, "M30", 2030, $charid, $zoneid);
         # We are finished with this flag set by Tomer_Instogle
         quest::delglobal("SetaTomer");
         $SetaTomer = undef;
      }
   }
}

sub EVENT_ITEM {
   # Silent Fist Clansman Hand Wraps require Sironans Head ID-27425, Yalroens Head ID-27426, and 1 High Quality Gnoll Fur ID-27427
   if(plugin::check_handin(\%itemcount, 27425 => 1) && plugin::check_handin(\%itemcount, 27426 => 1) && plugin::check_handin(\%itemcount, 27427 => 1)) {
      # Silent Fist Clansman Hand Wraps ID-27494
      quest::summonitem("27494");
      # Silent Fist Clan faction
      quest::faction("309","1");
      # Guards of Qeynos faction
      quest::faction("262","1");
      # Ashen Order faction
      quest::faction("361","1");
      quest::exp("300");
   }
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Monk');
   plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2086 -- Seta_Bakindo 
