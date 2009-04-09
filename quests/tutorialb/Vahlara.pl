#BeginFile Vahlara.pl
#Quests for The Mines of Gloomingdeep - Vahlara: Gloomingdeep Silk Collecting
sub EVENT_SAY {
   if (quest::istaskactivityactive(17,3)){
      quest::say("Well done. The revolt's food supply is safe for the time being. Report back to the guards when you're rested.");
   }
      else {
        if ($amote==2) { #Emote spawnwer "Vast"
             quest::spawn2(189119,0,0,-126.0,-295.8,3.0,124.8);
      }
        if ($bmote==2) { #Emote spawner "Screams"
             quest::spawn2(189120,0,0,-385.2,-516.3,-39.3,135.1);
        }
        if ($text=~/hail/i) {
         quest::say("I'm glad you managed to escape the slave warrens in one piece. There are many [others] who were not as lucky.");
      }   
      if (!$hasitem{59943}) { #Custom Script!!!
         quest::say("I have something that might save you from the same fate. Take this kobold charm. May it bring you good luck, $name.");
         quest::summonitem(59943); #Kobold Skull Charm
      }
      if ($text=~/others/i) {
         quest::say("The others did not have the [parts] I needed to craft them protective armor.");
      }
      if ($text=~/parts/i) {
         quest::say("Ah well the parts depend on what type of armor you want. There is [plate], [chain], [leather], and [cloth].");
      }
      if ($text=~/plate/i) {
         if ($text=~/plate bracers/i) {
            quest::say("To make the plate bracers for you, you need to bring me a chunk of iron and a gloomingdeep cocoon silk.");
         }
         if ($text=~/plate gauntlets/i) {
            quest::say("I would love to craft plate gauntlets for you $name. Please bring me a chunk of iron and two gloomingdeep cocoon silks.");
         }
         if ($text=~/plate boots/i) {
                  quest::say("All travelers require the proper footwear. I can craft a fine pair of plate boots for you if you bring me a chunk of iron and three gloomingdeep cocoon silks.");
             }
             if ($text=~/plate vambraces/i) {
                  quest::say("So you seek to protect your arms? $name, please return to me a chunk of iron, two gloomingdeep cocoon silks and a piece of rat fur.");
         }
             if ($text=~/plate greaves/i) {
                  quest::say("A good $class knows that some critters only need to reach your legs. With a chunk of iron, two gloomingdeep cocoon silks, and a bat wing, I can help protect you.");
             }
             if ($text=~/plate breastplate/i) {
                  quest::say("Ah, the true status of a $class. This will require a chunk of iron, two gloomingdeep cocoon silks and the venom sack from that vile spider queen to craft. Good luck and return when you have what I need.");
             }
             else {
                  quest::say("I can make the following plate armor, [a helmet], [plate bracers], [plate gauntlets], [plate boots], [plate vambraces], [plate greaves], and a [plate breastplate]. These all require you show your status in battle and return components to me.");
             }
        }
        if ($text=~/chain/i) {
            if ($text=~/chain coif/i) {
                  quest::say("In order to make a chain coif for you $name, I require a chunk of bronze found within the Gloomingdeep mines.");
             }
             if ($text=~/chain bracers/i) {
                  quest::say("To make the chain bracers for you, you need to bring me a chunk of bronze and a gloomingdeep cocoon silk.");
             }
             if ($text=~/chain gauntlets/i) {
                  quest::say("I would love to craft chain gauntlets for you $name. Please bring me a chunk of bronze and two gloomingdeep cocoon silks.");
             }
             if ($text=~/chain boots/i) {
                  quest::say("All travelers require the proper footwear. I can craft a fine pair of chain boots for you if you bring me a chunk of bronze and three gloomingdeep cocoon silks.");
             }
             if ($text=~/chain sleeves/i) {
                  quest::say("So you seek to protect your arms? $name, please return to me a chunk of bronze, two gloomingdeep cocoon silks and a piece of rat fur.");
             }
             if ($text=~/chain leggings/i) {
                  quest::say("A good $class knows that some critters only need to reach your legs. With a chunk of bronze, two gloomingdeep cocoon silks, and a bat wing, I can help protect you.");
             }
             if ($text=~/chain chestguard/i) {
                  quest::say("Ah, the true status of a $class. This will require a chunk of bronze, two gloomingdeep cocoon silks and the venom sack from that vile spider queen to craft.  Good luck and return when you have what I need.");
             }
             else {
                  quest::say("I can make the following chain armor, [chain coif], [chain bracers], [chain gauntlets], [chain boots], [chain sleeves], [chain leggings], and a [chain chestguard]. These all require you show your status in battle and return components to me.");
             }
        }
        if ($text=~/leather/i) {
             if ($text=~/leather bracers/i) {
                  quest::say("To make the leather bracers for you, you need to bring me a piece of rat fur and a gloomingdeep cocoon silk.");
             }
             if ($text=~/leather gloves/i) {
                  quest::say("I would love to craft leather gloves for you $name. Please bring me a piece of rat fur and two gloomingdeep cocoon silks.");
             }
             if ($text=~/leather boots/i) {
                  quest::say("All travelers require the proper footwear. I can craft a fine pair of leather boots for you if you bring me a piece of rat fur and three gloomingdeep cocoon silks.");
             }
             if ($text=~/leather sleeves/i) {
                  quest::say("So you seek to protect your arms? $name, please return to me two pieces of rat fur, and two gloomingdeep cocoon silks.");
             }
             if ($text=~/leather leggings/i) {
                  quest::say("A good $class knows that some critters only need to reach your legs. With a piece of rat fur, two gloomingdeep cocoon silks, and a bat wing, I can help protect you.");
             }
             if ($text=~/leather tunic/i) {
                  quest::say("Ah, the true status of a $class. This will require a piece of rat fur, two gloomingdeep cocoon silks and the venom sack from that vile spider queen to craft. Good luck and return when you have what I need.");
             }
             else {
                  quest::say("I can make the following leather armor, [a cap], [leather bracers], [leather gloves], [leather boots], [leather sleeves], [leather leggings], and a [leather tunic]. These all require you show your status in battle and return components to me.");
             }
        }
        if ($text=~/cloth/i) {
             if ($text=~/cloth wristbands/i) {
                  quest::say("To make the cloth wristbands for you, you need to bring me a gloomingdeep silk and a gloomingdeep cocoon silk.");
             }
             if ($text=~/cloth gloves/i) {
                  quest::say("I would love to craft cloth gloves for you $name. Please bring me a gloomingdeep silk and two gloomingdeep cocoon silks.");
             }
             if ($text=~/cloth slippers/i) {
                  quest::say("All travelers require the proper footwear. I can craft a fine pair of cloth slippers for you if you bring me a gloomingdeep silk and three gloomingdeep cocoon silks.");
             }
             if ($text=~/cloth sleeves/i) {
                  quest::say("So you seek to protect your arms? $name, please return to me a gloomingdeep silk, two gloomingdeep cocoon silks, and a piece of rat fur.");
             }
             if ($text=~/cloth pantaloons/i) {
                  quest::say("A good $class knows that some critters only need to reach your legs. With a gloomingdeep silk, two gloomingdeep cocoon silks, and a bat wing, I can help protect you.");
             }
             if ($text=~/cloth robe/i) {
                  quest::say("Ah, the true status of a $class. This will require a gloomingdeep silk, two gloomingdeep cocoon silks and the venom sack from that vile spider queen to craft. Good luck and return when you have what I need.");
             }
             else {
                  quest::say("I can make the following cloth armour, [a headband], [cloth wristbands], [cloth gloves], [cloth slippers], [cloth sleeves], [cloth pantaloons], and a [cloth robe]. These all require you show your status in battle and return components to me.");
             }
        }
        if ($text=~/a helmet/i) {
             quest::say("In order to make a plate helmet for you $name, I require a chunk of iron found within the Gloomingdeep mines.");
        }
        if ($text=~/a cap/i) {
             quest::say("In order to make a leather cap for you $name, I require a piece of rat fur found within the Gloomingdeep mines.");
        }
        if ($text=~/a headband/i) {
             quest::say("In order to make a headband for you $name, I require a gloomingdeep silk found within the Gloomingdeep mines.");
        }
   }   
} 
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 59954 => 1, 86010 => 2, 13064 => 1)) { #Chunk of Iron, Gloomingdeep Cocoon Silk (2), A Piece of Rat Fur
    quest::say("You have proven most resourceful $name. I present you these newly crafted vambraces.");
    quest::summonitem(82928); #Gloomiron Vambraces
  }
  elsif (plugin::check_handin(\%itemcount, 59954 => 1, 86010 => 2, 13068 => 1)) { #Chunk of Iron, Gloomingdeep Cocoon Silk (2), Bat Wing
    quest::say("Your hard work can only be met with these fine greaves. Wear them proudly.");
    quest::summonitem(82929); #Gloomiron Greaves
  }
  elsif (plugin::check_handin(\%itemcount, 59954 => 1, 86010 => 2, 14018 => 1)) { #Chunk of Iron, Gloomingdeep Cocoon Silk (2), A Spider Venom Sack
    quest::say("Marvelous $name. You truly are a brave warrior. Only one such as you is worthy enough to wear this armor.");
    quest::summonitem(82930); #Gloomiron Breastplate
  }
  elsif (plugin::check_handin(\%itemcount, 59954 => 1, 86010 => 3)) { #Chunk of Iron, Gloomingdeep Cocoon Silk (3)
    quest::say("Many thanks for returning with these items. Please accept these boots as a token of my appreciation.");
    quest::summonitem(82926); #Gloomiron Boots
  }
  elsif (plugin::check_handin(\%itemcount, 59954 => 1, 86010 => 2)) { #Chunk of Iron, Gloomingdeep Cocoon Silk (2)
    quest::say("Many thanks for returning with these items. Please accept these guantlets as a token of my appreciation.");
    quest::summonitem(82925); #Gloomiron Gauntlets
  }
  elsif (plugin::check_handin(\%itemcount, 59954 => 1, 86010 => 1)) { #Chunk of Iron, Gloomingdeep Cocoon Silk
    quest::say("Thank you $name. Take this bracer as your payment.");
    quest::summonitem(82924); #Gloomiron Bracer
  }
  elsif (plugin::check_handin(\%itemcount, 59954 => 1)) { #Chunk of Iron
    quest::say("Thank you so much. We appreciate your help with this, it really is noted. Take this helmet and good luck to you!");
    quest::summonitem(82927); #Gloomiron Helm
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 86010 => 2, 13064 => 1)) { #Chunk of Bronze, Gloomingdeep Cocoon Silk (2), A Piece of Rat Fur
    quest::say("You have proven most resourceful $name. I present you these newly crafted sleeves.");
    quest::summonitem(82935); #Gloomchain Sleeves
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 86010 => 2, 13068 => 1)) { #chunk of Bronze, Gloomingdeep Cocoon Silk (2), Bat Wing
    quest::say("Your hard work can only be met with these fine leggings. Wear them proudly.");
    quest::summonitem(82936); #Gloomchain Leggings
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 86010 => 2, 14018 => 1)) { #Chunk of Bronze, Gloomingdeep Cocoon Silk (2), A Spider Venom Sack
    quest::say("Marvelous $name. You truly are a brave warrior. Only one such as you is worthy enough to wear this armor.");
    quest::summonitem(82937); #Gloomchain Chestguard
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 86010 => 3)) { #Chunk of Bronze, Gloomingdeep Cocoon Silk (3)
    quest::say("Many thanks for returning with these items. Please accept these boots as a token of my appreciation.");
    quest::summonitem(82933); #Gloomchain Boots
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 86010 => 2)) { #chunk of Bronze, Gloomingdeep Cocoon Silk (2)
    quest::say("Many thanks for returning with these items. Please accept these guantlets as a token of my appreciation.");
    quest::summonitem(82932); #Gloomchain Gauntlets
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 86010 => 1)) { #Chunk of Bronze, Gloomingdeep Cocoon Silk
    quest::say("Thank you $name. Take this bracer as your payment.");
    quest::summonitem(82931); #Gloomchain Bracer
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1)) { #Chunk of Bronze
    quest::say("Thank you so much. We appreciate your help with this, it really is noted. Take this coif and good luck to you!");
    quest::summonitem(82934); #Gloomchain Coif
  }
  elsif (plugin::check_handin(\%itemcount, 13064 => 1, 86010 => 2, 13068 => 1)) { #A Piece of Rat Fur, Gloomingdeep Cocoon Silk (2), Bat Wing
    quest::say("Your hard work can only be met with these fine pants. Wear them proudly.");
    quest::summonitem(82943); #Gloomleather Pants
  }
  elsif (plugin::check_handin(\%itemcount, 13064 => 1, 86010 => 2, 14018 => 1)) { #A Piece of Rat Fur, Gloomingdeep Cocoon Silk (2), A Spider Venom Sack
    quest::say("Marvelous $name. You truly are a brave warrior. Only one such as you is worthy enough to wear this armor.");
    quest::summonitem(82944); #Gloomleather Tunic
  }
  elsif (plugin::check_handin(\%itemcount, 13064 => 1, 86010 => 3)) { #A Piece of Rat Fur, Gloomingdeep Cocoon Silk (3)
    quest::say("Many thanks for returning with these items. Please accept these boots as a token of my appreciation.");
    quest::summonitem(82940); #Gloomleather Boots
  }
  elsif (plugin::check_handin(\%itemcount, 13064 => 2, 86010 => 2)) { #A Piece of Rat Fur (2), Gloomingdeep Cocoon Silk (2)
    quest::say("You have proven most resourceful $name. I present you these newly crafted sleeves.");
    quest::summonitem(82942); #Gloomleather Sleeves
  }
  elsif (plugin::check_handin(\%itemcount, 54234 => 1, 86010 => 2, 13064 => 1)) { #Gloomingdeep Silk, Gloomingdeep Cocoon Silk (2), A Piece of Rat Fur
    quest::say("You have proven most resourceful $name. I present you these newly crafted sleeves.");
    quest::summonitem(82949); #Gloomsilk sleeves
  }
  elsif (plugin::check_handin(\%itemcount, 13064 => 1, 86010 => 2)) { #A Piece of Rat Fur, Gloomingdeep Cocoon Silk (2)
    quest::say("Many thanks for returning with these items. Please accept these gloves as a token of my appreciation.");
    quest::summonitem(82939); #Gloomleather Gloves
  }
  elsif (plugin::check_handin(\%itemcount, 13064 => 1, 86010 => 1)) { #A Piece of Rat Fur, Gloomingdeep Cocoon Silk
    quest::say("Thank you $name. Take this bracer as your payment.");
    quest::summonitem(82938); #Gloomleather Bracer
  }
  elsif (plugin::check_handin(\%itemcount, 13064 => 1)) { #A Piece of Rat Fur
    quest::say("Thank you so much. We appreciate your help with this, it really is noted. Take this cap and good luck to you!");
    quest::summonitem(82941); #Gloomleather Cap
  }
  elsif (plugin::check_handin(\%itemcount, 54234 => 1, 86010 => 2, 13068 => 1)) { #Gloomingdeep Silk, Gloomingdeep Cocoon Silk (2), Bat Wing
    quest::say("Your hard work can only be met with these fine pantaloons. Wear them proudly.");
    quest::summonitem(82950); #Gloomsilk Pantaloons
  }
  elsif (plugin::check_handin(\%itemcount, 54234 => 1, 86010 => 2, 14018 => 1)) { #Gloomingdeep Silk, Gloomingdeep Cocoon Silk (2), A Spider Venom Sack
    quest::say("Marvelous $name. You truly are a brave warrior. Only one such as you is worthy enough to wear this armor.");
    quest::summonitem(82951); #Gloomsilk Robe
  }
  elsif (plugin::check_handin(\%itemcount, 54234 => 1, 86010 => 3)) { #Gloomingdeep Silk, Gloomingdeep Cocoon Silk (3)
    quest::say("Many thanks for returning with these items. Please accept these slippers as a token of my appreciation.");
    quest::summonitem(82947); #Gloomsilk Slippers
  }
  elsif (plugin::check_handin(\%itemcount, 54234 => 1, 86010 => 2)) { #Gloomingdeep Silk, Gloomingdeep Cocoon Silk (2)
    quest::say("Many thanks for returning with these items. Please accept these gloves as a token of my appreciation.");
    quest::summonitem(82946); #Gloomsilk Gloves
  }
  elsif (plugin::check_handin(\%itemcount, 54234 => 1, 86010 => 1)) { #Gloomingdeep Silk, Gloomingdeep Cocoon Silk
    quest::say("Thank you $name. Take this wristband as your payment.");
    quest::summonitem(82945); #Gloomsilk Wristband
  }
  elsif (plugin::check_handin(\%itemcount, 54234 => 1)) { #Gloomingdeep Silk
    quest::say("Thank you so much. We appreciate your help with this, it really is noted. Take this headband and good luck to you!");
    quest::summonitem(82948); #Gloomsilk Headband
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}