sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hail to you my friend $name! I am Torm Wenrar, proud warrior of the Draconic Loyalist Fellowship. The dragons and dragon-kin of Skyshrine have need of capable warriors to aid in the war with the giants of Kael Drakkel. Do not consider this a sign of weakness, even the most powerful beings benefit from having friends and allies. The Giants too have many beings in their service, Ogres, Trolls, and unfortunately even Northmen like myself have been hired into the service of the Kromzek. These mercenaries must be put down, perhaps if enough of them are slain, other sell swords would be deterred from seeking employment of the Kromzek. The dragon-kin have placed a [bounty] on the lives of the Kromzeks mercenaries, any aid you can provide to the Skyshrine would be well rewarded.");
  }
  if($text=~/bounty/i){
    # Kromzek Mercenary Brooches
    quest::say("You shall be rewarded from skyshrines treasure hordes for the Kromzek Mercenary Brooches of every three mercenaries in the Kromzeks employment you slay. If you manage to locate and slay the [mercenary captains], or the more [notorious mercenaries] the rewards will be greater.");
  }
  if($text=~/mercenary captains/i){
    # Mercenary Captains
    quest::say("There are four mercenaries that have been promoted by the Kromzek to the position of mercenary captain. These captains command various units of mercenaries, usually those of their own race. The military prowess of the Kromzek, Kromrif, and their followers should not be underestimated. These individuals are very good at what they have been hired to achieve. There is a bounty available for the personalized mercenary brooches of Captain Glarg, Captain Ulmog, and Captain Mc'Hersh. Recover all three of the brooches and return them to me as proof of the captains deaths and I shall reward you from the treasure coffers of Skyshrine.");
  }
  if($text=~//i){
    # Notorious Mercenaries
    quest::say("There is a bounty for the lives of four mercenaries that have become notorious killers of dragon-kin. Since these mercenaries are not adorned with personalized brooches like the mercenary captain, their heads must be returned to me as proof of their deaths. The four mercenaries can usually be found together hunting dragons and dragon-kin. The first of these despicable individuals is a human by the name of Julius Oresco, a warrior of great skill. Julius' dragon hunting band is composed of the Dwarf, Grenth Drakebane, the erudite, Sadeem Oujva, and the northman, Rontar O'Karn. Bring me the heads of the four notorious mercenaries and I shall reward you on behalf of the dragon-kin from the treasure hoards of Skyshrine.");
  }
}

sub EVENT_ITEM {
  # Handin: Kromzek Mercenary Brooch
  if(plugin::check_handin(\%itemcount, 11990 => 3)){
    # Kromzek Mercenary Brooches [End]
    quest::say("Well done $name! The Draconic Loyalist Fellowship and the residents of Skyshrine are grateful for your assistance in eliminating the threat the Kromzeks mercenaries pose to the dragons and dragon-kin of Velious. Here is the bounty that has been promised.");
    quest::faction(42,25);   # +Claws of Veeshan
    quest::faction(362,25);  # +Yelinak
    quest::faction(189,-25); # -Kromzek
    quest::exp(1000);
    # Summon: Potion of Draconic Rage
    quest::summonitem(12555);
  }
  # Handin: Captain Glargs Brooch, Captain Mc'Hershs Brooch, Captain Ulmogs Brooch
  elsif(plugin::check_handin(\%itemcount, 11991 => 1, 11993 => 1, 11992 => 1)){
    # Mercenary Captains [End]
    quest::say("This is good news indeed for the dragon-kin of Skyshrine. Word will be passed to the rulers of Skyshrine of the assistance you have provided the Draconic Loyalist Fellowship. Here is the bounty that has been promised for the lives of the mercenary captains.");
    quest::faction(42,50);   # +Claws of Veeshan
    quest::faction(362,50);  # +Yelinak
    quest::faction(189,-50); # -Kromzek
    quest::exp(1500);
    # Summon: Draconic Girdle
    quest::summonitem(12556);
  }
  # Handin: Grenth Drakebane's Head, Julius Oresco's Head, Rontar O'Karn's Head, Sadeem Oujva's Head
  elsif(plugin::check_handin(\%itemcount, 11995 => 1, 11994 => 1, 11997 => 1, 11996 => 1)){
    # Notorious Mercenaries [End]
    quest::say("Congratulations on successfully eliminating this deadly band of murderous mercenaries. The nobles of Skyshrine will be pleased with your actions, as is the Draconic Loyalist Fellowship. Here is the bounty that has been promised for the lives of these notorious slayers of dragon-kin.");
    quest::faction(42,100);   # +Claws of Veeshan
    quest::faction(362,100);  # +Yelinak
    quest::faction(189,-100); # -Kromzek
    quest::exp(2000);
    # Summon: Draconic Pauldrons
    quest::summonitem(12557);
  } 
  else {
    quest::say("I have no need for this item $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}


#EOF    