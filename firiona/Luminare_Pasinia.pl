# items: 12948, 12834, 12743, 12824, 12949
sub EVENT_SAY {
  if($text=~/hail/i){
   quest::emote("wave's her hand's as if to cast a spell.");
   quest::say("Greeting's!! I am the Luminare of Firiona. By decree of his royal highness, King Thex, I am here to research spell's and artifact's. I have much to do. I welcome any enchanter who offer's to [assist] the great Luminare.");
  }
  if($text=~/assist/i){
   #Illusion Iksar (START)
   quest::say("And great I am, indeed!! Alas, not great enough to be everywhere at once. I would gladly reward you if you would [collect] components for me.");
  }
  if($text=~/collect/i){
   #Illusion Iksar
   quest::say("Then go into the wilds beyond the outpost and upon your return, you shall give me one Nok Shaman Powder, one Heart of Ice, one Ton Warrior Totem, and one Sabertooth Tiger Mane. This shall earn you knowledge of an enchanter spell I recently scribed.");
  }
}

sub EVENT_ITEM {
  #Handin: Nok Shaman Powder, Heart of Ice, Ton Warrior Totem, Sabertooth Tiger Mane
  if(plugin::check_handin(\%itemcount, 12948 => 1, 12834 => 1, 12743 => 1, 12824 => 1)){
   #Illusion Iksar (END)
   quest::emote("place's the items into a sack and removes a scroll from her robe.");
   quest::say("This is yours. A spell I discovered and translated for one with less intelligence than the great Luminare of Firiona Vie. You may kiss my feet now.");
   quest::faction(248,10);  # +Inhabitants of Firiona Vie
   quest::faction(326,10);   # +Emerald Warriors
   quest::faction(312,10);  # +Storm Guard
   quest::faction(441,-10); # -Legion of Cabilis
   quest::faction(313,-10); # -Pirates of Gunthak    
   quest::exp(250);
   #Summon: Vision of Sebilite
   quest::summonitem(12949); # Item: Vision of Sebilite
  }
   plugin::return_items(\%itemcount);
}


#EOF
