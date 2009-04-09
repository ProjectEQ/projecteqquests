############################################
# ZONE: North Qeynos (qeynos2)
# DATABASE: PEQ-YKESHA-beta1
# LAST EDIT DATE: September 22, 2007
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Togahn_Sorast
# ID: 2087
# TYPE: Monk Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Orange Headband ID-10112
# Red Headband ID-10113
# Head of Ghanex Drah ID-13165
# Brother Dareb's Skull ID-13166
# Head of Shen ID-13167
# Purple Headband ID-10114
# Skull of Jhen`Tra ID-13168
# Dagger of Marnek ID-13169
# Zaharn's Coronet ID-3000
#
# *** QUESTS INVOLVED IN ***
#
# Red Headband
# Purple Headband
# Blue Headband (text only, no quest exists)
# Black Headband (text only no quest exists)
#
# *** QUESTS AVAILABLE TO ***
#
# Anyone with Kindly or better faction
#
############################################

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Greetings.. I am Second Master Togahn Sorast. I am here to teach the ways of our guild. For our more advanced members, I will give out [headbands] as a reward for their contribution to the clan.");
   }
   elsif($text=~/headbands/i) {
      quest::say("The Silent Fist Clan gives out colored Headbands for various deeds completed by our students. Phin gives out the White, Yellow, and Orange Headbands.. and I give out the [Red, Purple, and Blue Headbands].");
   }
   elsif($text=~/Lu'Sun/i) {
      quest::say("Ahhh, Lu'Sun is a master of many skills. He has traveled all of Norrath, studying various techniques and disciplines. Now, he runs this small guild and passes on his knowledge to those willing to devote their lives to our cause.");
   }
   # Requires Kindly Faction for Headband Quests
   elsif($faction <= 3) {
      if($text=~/red headband/i) {
         quest::say("Ah, you think you are skilled enough to earn the red headband of the Silent Fist Clan, $name ? Hmmm.. Well, if you can help us find [Brother Dareb], you would certainly deserve the honor of wearing the red headband.");
      }
      elsif($text=~/brother dareb/i) {
         quest::say("Yes, brother Dareb was last heard from over two weeks ago. He was out in the Plains of South Karana, and then just disappeared. We fear that those vile gnolls fleeing Splitpaw may have captured him or worse. We sent brother Shen to go search the Karanas and look for Dareb over three days ago, but haven't heard from him, either. I fear the worst for both of them, especially if the [Splitpaws] are involved. Please, $name , find and return our lost brothers to us. If they are not alive, bring back their remains so we may give them a proper burial.. and, if it is that evil [Ghanex Drah]'s doing, bring me his head as well, for the honor of the clan. You do this for us, $name , and turn in your orange headband, and I will reward you with the red headband of the Silent Fist. Good luck.");
      }
      elsif($text=~/splitpaws/i) {
         quest::say("The Splitpaws were a large clan of gnolls that lived in a burrow out in South Karana, They have recently been ousted from their home by a new clan of gnolls that are very powerful. We try to stay away from them if we can, for we do not know much about this new breed. The Splitpaws are on the move and now is the only time to strike. If we wait too long, there will be no way to find our brother. Go now my friend, we haven't much time.");
      }
      elsif($text=~/Ghanex Drah/i) {
         quest::say("Ghanex Drah is ruler of the now fleeing gnolls of Splitpaw. I've heard rumors that he has been dabbling in the dark art of necromancy. Ghanex is looking for more test subjects, no doubt to rebuild his stronghold. The good people of Antonica must put an end to his evil reign soon, or I fear he could grow much more powerful.");
      }
      elsif($text=~/purple headband/i) {
         quest::say("Ah, you think you are now skilled enough to deserve the purple headband of the Silent Fist Clan? Very well, $name, I have a task for you that will prove whether or not you are worthy of this honor. I have heard recent rumors of ancient evils surfacing once again throughout Antonica. These evil groups have discovered some items that are giving them mystical and dangerous powers. These items must be destroyed, or else the evils of Norrath may gain control of the world's future. Bring me these [evil items], and turn in your red headband, and you will have proven yourself a mighty spirit and dedicated member of the Silent Fist.");
      }
      elsif($text=~/evil items/i) {
         quest::say("These evil creations have been found all over Antonica, and no one knows, or at least no one admits to knowing, where exactly they were found, but we do know that they are currently in the wrong hands and must be destroyed. Please, $name, seek out the [Skull of Jhen'Tra], the [Dagger of Marnek], and the [Coronet of Buried Blood], and bring them to me.");
      }
      elsif($text=~/Skull of Jhen'Tra/i) {
         quest::say("I don't know much about the Skull of Jhen'Tra. I've heard that it has resurfaced in the gnoll burial grounds of Lake Rathetear. Apparently, this skull is helping to give these gnolls the power to raise an undead army of their fallen ancestors. This evil must be stopped before their army becomes too powerful.");
      }
      elsif($text=~/Dagger of Marnek/i) {
         quest::say("The Dagger of Marnek is a diabolical weapon created by the ancient necromancer Marnek Jaull. Marnek was the leader of a small cult of necromancers who worshipped Solusek Ro. Marnek used this dagger in his ceremonial sacrifices to the Burning Prince, to increase his own power and show his loyalty to his god. His cult grew stronger and word of the evil acts spread all over Antonica. Legend has it that a group of paladins from Erudin, followers of Prexus, spent over 10 years searching out Marnek and his followers, and finally destroyed them. Though Marnek's evil reign was put to an end, many of his books and items are still being uncovered to this day. The Dagger of Marnek is now being used by the evil inhabitants who control the depths of Befallen. Bring this dagger to me, so that we may dispose of it and banish its evil powers forever.");
      }
      elsif($text=~/Coronet of Buried Blood/i) {
         quest::say("The Coronet of Buried Blood is an ancient headdress which is said to have belonged to the High Priest of the Plexant Temple. The Plexant were known to be devout followers of Innoruuk and the coronet is supposed to have been blessed by the Prince of Hate himself. Apparently, the coronet is now in the hands of a clan of goblins that dwell in the caverns of Permafrost.");
      }
      elsif($text=~/blue headband/i) {
         quest::say("Sorry, we are currently out of blue headbands. Please check back later.");
      }
      elsif($text=~/black headband/i) {
         quest::say("The black headband is one of the highest honors of our guild.. [Lu'Sun] only gives those out for great acts of heroism and devotion to the clan.");
      }
   }
   else {
      quest::say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Silent Fist. But, I feel that such a vital matter should be left to one of our more trusted members.");
   }
}

sub EVENT_ITEM {
   # Red Headband ID-10113 requires Orange Headband ID-10112, Head of Ghanex Drah ID-13165, Brother Dareb's Skull ID-13166 and Head of Shen ID-13167
   # No need to check faction since it was required for the previous headbands
   if(plugin::check_handin(\%itemcount, 10112 => 1) && plugin::check_handin(\%itemcount, 13165 => 1) && plugin::check_handin(\%itemcount, 13166 => 1) && plugin::check_handin(\%itemcount, 13167 => 1)) {
      quest::say("We are deeply honored to have such great warrior as part of our Clan. With a proper burial, Shen and Dareb's souls will finally be at peace, and with the death of that vile Ghanex, the plains will be much safer for travelers. It is a great honor to present you, $name, with the red headband of the Silent Fist Clan.");
      quest::summonitem("10113");
      # Silent Fist Clan faction
      quest::faction("300","4");
      # Guards of Qeynos faction
      quest::faction("135","4");
      # Ashen Order faction
      quest::faction("12","4");
      quest::exp("400");
   }
   # Purple Headband ID-10114 requires Red Headband ID-10113, Skull of Jhen`Tra ID-13168, Dagger of Marnek ID-13169 and Zaharn's Coronet ID-3000
   elsif(plugin::check_handin(\%itemcount, 10113 => 1) && plugin::check_handin(\%itemcount, 13168 => 1) && plugin::check_handin(\%itemcount, 13169 => 1) && plugin::check_handin(\%itemcount, 3000 => 1)) {
   quest::say("In honor of your recent acts of courage and dedication, I reward you, $name, with the purple headband of the Silent Fist Clan.");
   quest::summonitem("10114");
        # Silent Fist Clan faction
        quest::faction("300","5");
        # Guards of Qeynos faction
        quest::faction("135","5");
        # Ashen Order faction
        quest::faction("12","5");
   quest::exp("500");
   }
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Monk');
   plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2087 -- Togahn_Sorast 