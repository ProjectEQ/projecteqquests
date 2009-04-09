############################################
# ZONE: Oggok (oggok)
# Database: PEQ (from CVS)
# LAST EDIT DATE: November 24, 2007
# Version 1.1
# Developer: Diuretic Effluent
#
# *** NPC INFORMATION ***
#
# NAME: Grevak
# ID: 49037
# Type: Shadowknight Guild Master
# Race: Ogre
# Level: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Lizard Tail ID - 13354
# Pickled Lizard ID - 13453
# Mystic Doll ID - 13367
#
# *** QUESTS INVOLVED IN ***
#
# Lizard Tails #2
# Lizardman Mystic Shaman Dolls (text only, turn-in coding help required);
#
# *** QUESTS AVAILABLE TO ***
#
# Must be Indifferent or better
#
###########################################


sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Need new members we do not. Powerful enough are we with Grevak. Still. peons needed. Are you a [new peon] or are you an [outsider]? Speak up!! Fool!! No time Grevak has!!");
      }
if($text=~/i am a new peon/i){
quest::say("So you think you can be greater than Grevak!! Touch you not and still I can smash you. I am a Greenblood shadowknight!! Peon are you. Peons go to swamps and slay lizardmen. You return with four lizardmen tails and a reward is yours. You return with two lizardman shaman dolls and a great reward is yours.");
      }
if($text=~/i am an outsider/i){
quest::say("Go away or soon your pain will find you.");
            }
}

sub EVENT_ITEM {
  if  (plugin::check_handin(\%itemcount, 13354 => 4))
   {
   # Text created by Diuretic since nothing found on Allakhazam
   quest::say("Grevak rewards peon with reward instead of smashing you.  Bring me more, peon!");
   #Summon Pickled Lizard
   quest::summonitem("13453");
   quest::exp("500");
   # Increase faction -- Clurg
   quest::faction("46","10");
   # Increase faction -- Greenblood Knights
   quest::faction("128","20");
   # Decrease faction -- Shadowknights of Night Keep
   quest::faction("292","-20");
   # Decrease faction -- Storm Guard
   quest::faction("314","-10");

    }
elsif(plugin::check_handin(\%itemcount, 13367 => 2))
   {
   # Text created by Diuretic since nothing found on Allakhazam
   quest::say("Grevak rewards you. Grevak now afraid of nothing! Ha ha! Mighty mighty!");
   #Summon Random Rusty Shadowknight-Friendly weapon
   quest::summonitem(quest::ChooseRandom(13453,5013,5014,5016,5019,5020,5023,5025));
   quest::exp("500");
   # Increase faction -- Greenblood Knights
   quest::faction("128","20");
   # Decrease faction -- Shadowknights of Night Keep
   quest::faction("292","-20");

    }

  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);

}
#END of FILE Zone:oggok  ID:49034 -- Grevak 
