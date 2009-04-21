sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, young one! There are many tasks to be performed aside from your studies to truly harness the powers passed down to us by our ancestor [Miragul]. The most basic of these tasks is the gathering of bat wings and snake fangs from the yard outside our city. I will reward you for every two bat wings and two snake fangs you bring to me.");
  }
  if($text=~/miragul/i) {
    quest::say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18018 => 1)) { #Dark Truth Guild Note
    quest::say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth.");
    quest::summonitem(13551); #Dirt Soiled Robe*
    quest::faction(143,1);  # Heretics
    quest::faction(56,-1);  # Craftkeepers
    quest::faction(60,-1);  # Crimson Hands
    quest::faction(79,-1);  # Deepwater Knights
    quest::faction(112,-1); # Gate Callers
  }
  elsif(plugin::check_handin(\%itemcount, 13068 => 2, 13067 => 2)) { #Bat Wing x 2, Snake Fang x 2
    quest::say("Very good, young acolyte. Maintain your diligence in your duties and you will quickly learn the secrets of the Dark Truth.");
    quest::summonitem(15338); #Spell: Cavorting Bones
    quest::faction(143,1);  # Heretics
    quest::faction(56,-1);  # Craftkeepers
    quest::faction(60,-1);  # Crimson Hands
    quest::faction(79,-1);  # Deepwater Knights
    quest::faction(112,-1); # Gate Callers
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75091 -- Coriante_Verisue