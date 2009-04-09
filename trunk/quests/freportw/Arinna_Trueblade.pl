############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Arinna_Trueblade
# ID: 9100
# TYPE: Guild Master Warrior
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Steel Warriors Mail Kit ID-17262
# An Enchanted Helm Mold ID-22610
# An Enchanted Bracer Mold ID-22611
# An Enchanted Armguard Mold ID-22613
# An Enchanted Boot Mold ID-22612
# An Enchanted Greaves Mold ID-22614
# An Enchanted Breastplate Mold ID-22616
# Jagged Blade of the Steel Warrior ID-9940
# Pristine Giant Scarab Leg ID-9919
# Lion Paw ID-9918
# Vial of Smoke ID-9923
#
# *** QUESTS INVOLVED IN ***
#
#1 - Steel Warriors Helm
#2 - Steel Warriors Bracer
#3 - Steel Warriors Armguards
#4 - Steel Warriors Boots
#5 - Steel Warriors Greaves
#6 - Steel Warriors Gauntlets
#7 - Steel Warriors Breatplate
#8 - Steel Warriors Final Task
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#2 - Warrior
#3 - Warrior
#4 - Warrior
#5 - Warrior
#6 - Warrior
#7 - Warrior
#8 - Warrior
#
############################################

sub EVENT_SAY { 
  if($text=~/Hail/i) {
    quest::say("Well met, $name. I am Arianna Trueblade, Warlord of the Steel Warriors. I am personally in charge of all the training that our young warriors receive. I take pride in knowing that my teaching can help make the foundation of a Freeport Champion. If you are a [warrior] then we might just have something to talk about.");
  }
  if($text=~/warrior/i && $class eq 'Warrior') {
    quest::say("So you think you have what it takes to become one of Freeports finest? I will warn you now that we expect every single warrior that is brought into our ranks to go through a series of exercises. Rest assured you will be rewarded for your hard work with a set of armor that I will walk you though the process of making. Are you [ready to begin your testing]?");
  }
  if($text=~/ready to begin/i && $class eq 'Warrior') {
    quest::say("Very well, $name. Here is your Steel Warriors Mail Kit. This kit will be your main tool in creating your own armor. You will gather various items from all areas of Freeport from monsters and stores alike. You will use specific item combinations in this kit to fashion together armor materials that you will combine in a forge with the appropriate mold to make an armor piece. Once you are ready to attempt a piece of armor simply tell me what piece you want to craft. I will then present you with the recipe and mold for Steel Warrior [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
    # Steel Warriors Mail Kit ID-17262
    quest::summonitem(17262);
  }
  if($text=~/helm/i && $class eq 'Warrior') {
    quest::say("Any Steel Warrior that is caught not wearing a helm is usually placed on probation. We feel it is necessary sometimes to do this so that our younger ones in training will understand the importance of keeping your head well protected. To create your helm material you will need to combine two Bricks of Crude Iron Ore, one Rat Ear, one Meat Pie and one Barley in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Helm.");
    # An Enchanted Helm Mold ID-22610
    quest::summonitem(22610);
  }
  if($text=~/bracers/i && $class eq 'Warrior') {
    quest::say("As you progress further through your training you will find yourself in heavy battle more and more often. Bracers will ensure that you are able to fend off your opponents blows with minimum injury. To create your bracer material you will need to combine one Brick of Crude Iron Ore, one Rotting Zombie Skull, one Snake Bile and one Tiny Dagger in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Bracer.");
    # An Enchanted Bracer Mold ID-22611
    quest::summonitem(22611);
  }
  if($text=~/armguards/i && $class eq 'Warrior') {
    quest::say("A slash or gash to the arms can greatly hinder a warrior's combat abilities. Wearing these armguards will ensure that this does not happen. To create your armguard material you will need to combine two Bricks of Crude Iron Ore, two Young Kodiak Paws, one Young Plains Cat Scalp and one Freeport Stout in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Steel Warriors Armguards.");
    # An Enchanted Armguard Mold ID-22613
    quest::summonitem(22613);
  }
  if($text=~/boots/i && $class eq 'Warrior') {
    quest::say("Boots are very necessary for any warrior especially when you will usually be the one leading most combat units. Being on the front line and treading across terrains first make good boots a must. To create your boots material you will need to combine three Bricks of Crude Iron Ore, one Shadow Wolf Tibia and two Spiderling Eyes in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Boots.");
    # An Enchanted Boot Mold ID-22612
    quest::summonitem(22612);
  }
  if($text=~/greaves/i && $class eq 'Warrior') {
  quest::say("While most armor pieces are very vital to a young warriors survival, greaves are one of the most important armor pieces you will craft. To create your greaves material you will need to combine four Bricks of Crude Iron Ore, one Giant Fire Beetle Brain, one Lion Tail, one Bottle and one Young Puma Skin in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Greaves.");
    # An Enchanted Greaves Mold ID-22614
    quest::summonitem(22614);
  }
  if ($text=~/gauntlets/i && $class eq 'Warrior') {
    quest::say("Keeping your hands well guarded is without question the most important thing a warrior will do. Suffering a blow to the hands that would prevent you from defending yourself would most certainly mean death. To create your gauntlet material you will need to combine three Bricks of Crude Iron Ore, one Armadillo Tail, one Severed Orc Foot, and two Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Gauntlets.");
    quest::summonitem(22615);
  }
  if($text=~/breastplates/i && $class eq 'Warrior') {
    quest::say("Your dedication to learning everything about your class is impressive, $name. I have no doubt that you are ready to collect the pieces for your Steel Warriors Breastplate. To create your breastplate material you will need to combine five Bricks of Crude Iron Ore, one Deathfist Orc Skull, one Woven Spider Silk, one Armadillo Carapace, one Matted Lion Pelt and one Rusty Short Sword in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Breastplate. Please come back to see me after you are finished with your breastplate for your [final task].");
    # An Enchanted Breastplate Mold ID-22616
    quest::summonitem(22616);
  }

  if($text=~/final task/i && $class eq 'Warrior') {
    quest::say("I am in need of some assistance to craft a special sword that I would like to present all graduates of my training like yourself with. However. I don't have all the pieces I need to make one. If you could retrieve a Pristine Giant Scarab Leg, one Lion Paw and one Vial of Smoke I will have all I need to create this weapon. I would have no problem presenting you with the first if I was able to create it. See you soon.");
  }
}

sub EVENT_ITEM {
  #do all other hand ins first, then let it do disciplines
  if($class ne 'Warrior') {
    quest::say("Only members of the guild may do these quests.");
    plugin::return_items(\%itemcount);
    return 1;
  }
    # Vial of Smoke ID-9923 - Pristine Giant Scarab Leg ID-9919 - Lion Paw ID-9918
    if (plugin::check_handin(\%itemcount, 9919 => 1, 9918 => 1, 9923 => 1)) {
      quest::say("$name, you have proven your value to the Steel Warriors. Here is a weapon that will let you slay magical creatures that you couldn't with a normal weapon.");
      quest::ding();
      quest::exp(100);
      # Jagged Blade of the Steel Warrior ID-9940
      quest::summonitem(9940);
    }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}

# Quest edited by mystic414
