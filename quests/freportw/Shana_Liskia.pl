############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Shana_Liskia
# ID: 9068
# TYPE: Guild Master Enchanter
# RACE: High Elf
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Enchanted Sewing Kit ID-17260
# An Enchanted Sleeves Pattern ID-22586
# An Enchanted Bracer Pattern ID-22584
# An Enchanted Cap Pattern ID-22583
# An Enchanted Gloves Pattern ID-22588
# An Enchanted Sandals Pattern ID-22585
# An Enchanted Trousers Pattern ID-22587
# An Enchanted Robe Pattern ID-22589
# Shanas Necklace ID-9933
# Lion Tooth ID-9917
# Dagger of the Academy ID-9938
#
# *** QUESTS INVOLVED IN ***
#
#1 - Arcane Scientists Cap ID-9872
#2 - Arcane Scientists Bracer ID-9873
#3 - Arcane Scientists Sleeves ID-9874
#4 - Arcane Scientists Sandals ID-9875
#5 - Arcane Scientists Leggings ID-9876
#6 - Arcane Scientists Gloves ID-9877
#7 - Arcane Scientists Robe ID-9878
#8 - Dagger of the Academy ID-9938
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Magician , Enchanter , Wizard
#2 - Magician , Enchanter , Wizard
#3 - Magician , Enchanter , Wizard
#4 - Magician , Enchanter , Wizard
#5 - Magician , Enchanter , Wizard
#6 - Magician , Enchanter , Wizard
#7 - Magician , Enchanter , Wizard
#8 - Magician , Enchanter , Wizard
#
############################################


sub EVENT_SAY
{ 

  if($text=~/Hail/i)
  {
  quest::say("Hail and well met $name. I am Shana Liskia. Enchantress of Freeport. I have studied my art for years here in our wonderful academy. I am also delighted to meet and teach those that come here to gain knowledge. My specialty however lies in Beguiling so I like to train young newcomers to our academy. Are you studying the ways of a [Magician] an [Enchanter] or a [Wizard]??");
  }

  if($text=~/magician/i ||$text=~/enchanter/i ||$text=~/wizard/i)
  {
  quest::say("Wonderful! Let me be the first to tell you that your training here will be top notch and you will learn all that is to be known about being an enchanter should you put forth the willingness to learn. I will walk you through your early training and assist you in your hunting and gathering skills. I have created a [special sewing kit] that I present to all of the new initiates.");
  }

  if($text=~/special sewing kit/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("This kit that I speak of is one that is able to magically infuse different components into materials used for creating Arcane Scientists Armor. The components that you use will be collected from numerous different areas and shops in Freeport. You will use these materials along with patterns that I will present you with to create your armor. Once you are [ready to begin] I will present you with your Enchanted Sewing Kit.");
  }

  if($text=~/ready to begin/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("Very well. Here you are $name. in this box you will combine specific component recipes as I mentioned before. When you are ready to attempt a specific piece you must tell me what piece you [want] to craft. For example if you had intent on crafting a cap you would say. [I want to craft a cap]. I can offer you the recipes for Arcane Scientists [Caps]. [Bracers]. [Sleeves]. [Sandals]. [Trousers]. [Gloves] and [Robes]. I must also suggest that you attempt your robe last due to the difficult nature of collecting the correct components.");
  # Enchanted Sewing Kit ID-17260
  quest::summonitem("17260");
  }

  if($text=~/I want to craft sleeves/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("Sleeves will be a great and necessary addition to your armor. To create your sleeve material you will need to combine 2 Woven Spider Silks. 2 Bone Chips. 1 Spider Legs and Cloth Sleeves in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Sleeves.");
  # An Enchanted Sleeves Pattern ID-22586
  quest::summonitem("22586");
  }

  if($text=~/I want to craft bracer/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard' || $text=~/I want to craft bracers/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("A wise choice indeed, having the correct wrist protection is very important in spell channeling. To create your bracer material you will need to combine 1 Woven Spider Silk. 1 Desert Tarantula Chitin. 1 Armadillo Tooth and a Cloth wristband in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Bracer.");
  # An Enchanted Bracer Pattern ID-22584
  quest::summonitem("22584");
  }

  if($text=~/I want to craft cap/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("A cap will keep you safe from any attackers as well as the elements. To create your cap material you will need to combine 2 Woven Spider Silks. 1 Snake Fang. 1 Chunk of Meat and a Cloth Cap in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Cap.");
  # An Enchanted Cap Pattern ID-22583
  quest::summonitem("22583");
  }

  if($text=~/I want to craft gloves/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("Gloves are very important for your early training especially Isola. While you are learning your first set of incantations you should not have to worry about any injuries to your hands. To create your glove material you will need to combine 3 Woven Spider Silks. 1 Giant Scarab Brain. 1 High Quality Cat Pelt 1 Zombie Skin and 1 Large Leaf Scarab Leg in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Gloves.");
  # An Enchanted Gloves Pattern ID-22588
  quest::summonitem("22588");
  }

  if($text=~/I want to craft sandals/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("Sandals will keep you save from any harmful things you may walk in, it is a good idea to have them. To create your sandal material you will need to combine 3 Woven Spider Silks. 1 Coyote Pelt. 2 Black Bear Paws. 1 Urticating Hairs and Cloth Sandals in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Sandals.");
  # An Enchanted Sandals Pattern ID-22585
  quest::summonitem("22585");
  }

  if($text=~/I want to craft trousers/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("I would always recommend pants to all my new students since they are a very important part of your armor set. To create your trouser material you will need to combine 4 Woven Spider Silks. 1 Embalming Dust. 1 Rotting Zombie Skull and 1 Armadillo Tail in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Trousers.");
  # An Enchanted Trousers Pattern ID-22587
  quest::summonitem("22587");
  }

  if($text=~/I want to craft robe/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("I am very pleased to see that you have progressed through your armor pieces so quickly. I am also proud to see that you are ready to attempt your robe! To create your robe material you will need to combine 5 Woven Spider Silks. 1 Snake Bile. 1 Cutthroat Golden Tooth. 1 Shadow Wolf Tibia. 1 Orc Prayer Beads and 1 Cloth Shirt in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Robe. Be sure to come back to see me for a [final assignment] after you have completed your robe.");
  # An Enchanted Robe Pattern ID-22589
  quest::summonitem("22589");
  }

  if($text=~/final assignment/i && $class == 'Magician' || $class == 'Enchanter' || $class == 'Wizard')
  {
  quest::say("I have a trinket that was given to me by my mother a long time ago. Before she died I told her I would always keep it close to me. Recently, some militia officers came in to our academy and confiscated anything that appeared to be valuable. Fearing for my life I did not fight to keep the necklace my mother gave me. The officer that took it was named Teridsan. If you should find him you have my permission to kill him if that's what it takes to get my necklace back. Return to me when you have my necklace along with 2 Lion Teeth.");
  }

}

sub EVENT_ITEM
{
 # Lion Tooth ID-9917 and Shanas Necklace ID-9933
 if ($itemcount{9917} == 2 && $itemcount{9933} == 1)
 {
  if($class != 'Magician' || $class != 'Enchanter' || $class != 'Wizard')
  {
  quest::say("Only Casters may earn the rewards of the Academy!");
  quest::summonitem($item1) if($item1);
  quest::summonitem($item2) if($item2);
  quest::summonitem($item3) if($item3);
  quest::summonitem($item4) if($item4);
  }
  else
  {
  quest::say("Thank you for bringing back one of my most valued possesion. You have proven yourself to be worthy to wield the Dagger of the Academy.");
  quest::ding();
  # Dagger of the Academy ID-9938
  quest::summonitem("9938");
  }
 }

}

#END of FILE Zone:freportw  ID:9068 -- Shana_Liskia

