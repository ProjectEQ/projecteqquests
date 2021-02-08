#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Bjarorm Mjlorn
#NPC ID: 113186
# items: 25837, 24926, 25412, 25807, 24921, 25413, 25818, 24923, 25414, 25841, 24925, 25415, 25832, 24927, 25416, 25816, 24922, 25417, 25829, 24924, 25418

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::emote("eyes you malevolently.");
      quest::say("I seek those who practice the dark magicks. I seek those who call themselves necromancers. Are you a necromancer?");
    }
    if ($text=~/i am a necromancer/i) {
      quest::say("Excellent. Are you sure enough of your skills to undertake my tasks? If not, get out of my sight, weakling!");
    }
    if ($text=~/undertake your tasks/i) {
      quest::say("I thought so. One should never back down from a challenge. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.");
    }
    if ($text=~/cap/i) {
      quest::say("For you to receive my gift, I shall require an ancient silk turban and three crushed flame opals.");
    }
    if ($text=~/robe/i) {
      quest::say("This exquisite robe shall be yours in exchange for an ancient silk robe and three pristine emeralds.");
    }
    if ($text=~/sleeves/i) {
      quest::say("For these durable sleeves, you must fetch me a pair of ancient silk sleeves and three flawed topazes.");
    }
    if ($text=~/wristband/i) {
      quest::say("The crafting of this wristband requires that you bring me an ancient silk wristband and three crushed onyx sapphire pieces.");
    }
    if ($text=~/gloves/i) {
      quest::say("For this fine pair of gloves you must seek out and return to me a pair of ancient silk gloves and a crushed topaz.");
    }
    if ($text=~/leggings/i) {
      quest::say("This pair of leggings will yours provided you supply me with a pair of ancient silk pantaloons as well as three nephrites.");
    }
    if ($text=~/boots/i) {
      quest::say("These supple boots shall be yours upon receipt of a pair of ancient silk boots and three crushed jaundice gems.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25837 => 3, 24926 => 1)) { # cap
      quest::summonitem(25412); # Item: Plague Bearer's Circlet
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25807 => 3, 24921 => 1)) { # bp
      quest::summonitem(25413); # Item: Plague Bearer's Robe
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25818 => 3, 24923 => 1)) { # sleeves
      quest::summonitem(25414); # Item: Plague Bearer's Sleeves
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25841 => 3, 24925 => 1)) { # wrist
      quest::summonitem(25415); # Item: Plague Bearer's Wristguard
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24927 => 1)) { # gloves
      quest::summonitem(25416); # Item: Plague Bearer's Gloves
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25816 => 3, 24922 => 1)) { # legs
      quest::summonitem(25417); # Item: Plague Bearer's Trousers
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25829 => 3, 24924 => 1)) { # boots
      quest::summonitem(25418); # Item: Plague Bearer's Boots
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    else {
      plugin::return_items(\%itemcount); 
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
  }
}

#END of FILE Zone: kael ID:113186 -- Bjarorm_Mjlorn

