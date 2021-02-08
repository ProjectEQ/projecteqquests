#Feed the Hopper Quest
#Zone:sharvahl  ID:155062 -- Animist_Mahron_Sood
# items: 3918, 7079, 7074, 7071, 7078, 7075, 7072, 7081, 7073, 7080, 7076, 7082, 7077, 3812, 3670, 5571

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail mate. Did you need something from me or are you looking to do me a [favor]?");
  }
  if($text=~/favor/i) {
    quest::say("I've been playing with this little hopper for a while with the hopes of maybe domesticating him. He's fond of grimling parts, so that's what I bring him when I come over here to sit around and work on my leatherwork. I'll make you a deal... If you bring me four grimling toes or finger bones, I'll trade them for one of my leather pieces. Don't mix them up though.... I'm trying to see which he likes best... fingers bones or toes.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 3918 => 4)) { #Finger bones x 4
    quest::say("Thanks, here is your reward!");
    quest::summonitem(quest::ChooseRandom(7079,7074,7071,7078,7075,7072,7081,7073,7080,7076,7082,7077)); # Item(s): Hopperhide Wristbands (7079), Hopperhide Tunic (7074), Hopperhide Skullcap (7071), Hopperhide Sleeves (7078), Hopperhide Shoulderpads (7075), Hopperhide Mask (7072), Hopperhide Leggings (7081), Hopperhide Gorget (7073), Hopperhide Gloves (7080), Hopperhide Cloak (7076), Hopperhide Boots (7082), Hopperhide Belt (7077)
    quest::exp(1000);
    quest::ding();
  }
  elsif(plugin::check_handin(\%itemcount, 3812 => 4)) { #Grimling toes x 4
    quest::say("Thanks, here is your reward!");
    quest::summonitem(quest::ChooseRandom(7079,7074,7071,7078,7075,7072,7081,7073,7080,7076,7082,7077)); # Item(s): Hopperhide Wristbands (7079), Hopperhide Tunic (7074), Hopperhide Skullcap (7071), Hopperhide Sleeves (7078), Hopperhide Shoulderpads (7075), Hopperhide Mask (7072), Hopperhide Leggings (7081), Hopperhide Gorget (7073), Hopperhide Gloves (7080), Hopperhide Cloak (7076), Hopperhide Boots (7082), Hopperhide Belt (7077)
    quest::exp(1000);
    quest::ding();
  }
  elsif(plugin::check_handin(\%itemcount, 3670 => 1)) { #BL Quest #2
    quest::say("Ahh, so Poren sent you to me, did he? Well then...you look like you have some training, but you are still young and inexperienced. However, I just may have a task for you.");
    quest::say("Take this wrinkled map I found just the other day and give it to a friend of mine. Her name is Kery and you can find her upstairs in that building over there. Do this, and she will help you upgrade those claws of yours.");
    quest::summonitem(5571); # Item: Worn Map of the Area
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155062 -- Animist_Mahron_Sood