#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Gragek Mjlorkigar
#NPC ID: 113190
# items: 25831, 24912, 25363, 25814, 24907, 25364, 25821, 24909, 25365, 25838, 24911, 25366, 25832, 24913, 25367, 25825, 24908, 25368, 25833, 24910, 25369

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::say("Greetings to you. I seek one who is a protector of nature. A ranger is what you call them I believe. Are you a ranger?");
    }
    if ($text=~/i am a ranger/i) {
      quest::say("I have not seen your kind in quite some time. Do you seek aid in your never-ending fight against those who do nature harm? There is no need to answer for I see within your eyes, the commitment and the conviction. None the less, the tasks I set before you shall be none the easier. Are you ready to submit to my will?");
    }
    if ($text=~/ready to submit to your will/i) {
      quest::say("That is good for there is nothing like the wrath of nature, woodlands warrior. And Natures wrath shall you be, with this armor to protect you in your struggle. I shall forge a coif, breastplate, sleeves, bracers, gauntlets, leggings, and boots for you.");
    }
    if ($text=~/coif/i) {
      quest::say("This coif shall protect you from battle and the elements. What I require of you is this. Three crushed coral pieces and a ancient tarnished chain coif.");
    }
    if ($text=~/breastplate/i) {
      quest::say("Even as the hardiest tree in the forest requires protection, so shall this breastplate protect you. Bring these components for me, an ancient tarnished chain tunic as well as three flawless diamonds.");
    }
    if ($text=~/sleeves/i) {
      quest::say("I require an ancient tarnished chain sleeves and three flawed emeralds. Do this so that I may grant you these special sleeves as a gift for your diligence.");
    }
    if ($text=~/bracer/i) {
      quest::say("This shall help shield your forearms from any stray blows. Bring me an ancient tarnished chain wristguard and a trilogy of crushed flame emeralds.");
    }
    if ($text=~/gauntlets/i) {
      quest::say("Bring me these items, for I will not grant you your pair until then. A pair of ancient tarnished chain gauntlets as well as three crushed topaz.");
    }
    if ($text=~/leggings/i) {
      quest::say("A pair of leggings you seek? I seek something as well. Bring me a pair of an ancient tarnished chain leggings and three flawed sea sapphires. Go now. The struggle continues as we speak.");
    }
    if ($text=~/boots/i) {
      quest::say("For the boots, I shall require a pair of an ancient tarnished chain boots and three crushed pieces of black marble.");
    }
}
  elsif ($faction > 1) {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24912 => 1)) { # cap
      quest::summonitem(25363); # Item: Forest Stalker's Coif
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24907 => 1)) { # bp
      quest::summonitem(25364); # Item: Forest Stalker's Breastplate
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24909 => 1)) { # sleeves
      quest::summonitem(25365); # Item: Forest Stalker's Vambraces
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24911 => 1)) { # wrist
      quest::summonitem(25366); # Item: Forest Stalker's Bracer
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24913 => 1)) { # gloves
      quest::summonitem(25367); # Item: Forest Stalker's Gauntlets
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24908 => 1)) { # legs
      quest::summonitem(25368); # Item: Forest Stalker's Greaves
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24910 => 1)) { # boots
      quest::summonitem(25369); # Item: Forest Stalker's Boots
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
}
    elsif ($faction > 1) {
      quest::say("I do not know you well enough to entrust you with such an item, yet.");
}
      plugin::return_items(\%itemcount); 
    
}

#END of FILE Zone: kael ID:113190 -- Gragek_Mjlorkigar

