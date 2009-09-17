# Hardam's Goods
# Pristine Beetle Box

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hi there $name. It's nice to meet ye. Many great deals here today if I don't say so myself.");
  }
  if($text=~/piece/i) {
    quest::say("I'm waiting to have a rhino beetle horn delivered to me to finish off Hardam's helm. I do not want to present it to him with one horn, you know. If you wanted to be a big help, any rhino beetles horn would do fine. Bring one to me and I can then finish Hardam's helm and send it back to his shop in your hands.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 4757 => 1)) { # Hardams Box of Goods
    quest::say("Ah Hardam sent you eh. Fair enough then, please let him know I will get to selling these goods as soon as possible and please let him know that the helm will be done soon. All I need is a certain [piece].");
    quest::faction(154,1); # House of Stout
    quest::faction(338,1); # Traders of the Haven
    quest::exp(50);
    quest::ding();
  }
  elsif(plugin::check_handin(\%itemcount, 5985 => 1)) { # Rhino Beetle Horn
    quest::say("Its good to see you again so soon $name. I knew that you would be able to assist me in this task. As I said, here is Hardams finished helm. Please return it to him for me as I cannot leave my booth here.");
    quest::summonitem(5986); # Hardams Custom Helm
    quest::faction(154,1); # House of Stout
    quest::faction(338,1); # Traders of the Haven
    quest::exp(50);
    quest::ding();
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:bazaar  ID:151002 -- Faeroi