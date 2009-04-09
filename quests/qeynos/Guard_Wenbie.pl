sub EVENT_SAY {

  if($text=~/Hail/i) {

    quest::say("Hello, $name. What brings you to Qeynos? Must be the mighty fine muffins over at [Voleen's Bakery]. I just love those muffins!");

  }

  if($text=~/voleen's bakery/i) {

    quest::say("Oh, it will be easier for us both if I just show you where it is. Follow me. But be quick about it, because I have to get back to my patrol.");

  }

}



sub EVENT_ITEM {

  # Muffin ID-13014

  my $muffins = 0;

  if (plugin::check_handin(\%itemcount,13014=>4)) {$muffins=4;

  } elsif (plugin::check_handin(\%itemcount,13014=>3)) {$muffins=3;

  } elsif (plugin::check_handin(\%itemcount,13014=>2)) {$muffins=2;

  } elsif (plugin::check_handin(\%itemcount,13014=>1)) {$muffins=1;

  }

  if ($muffins>=1) {

    for ($i=0; $i<$muffins; $i++) {
   quest::say("Oh, thank you so much. I do get hungry on patrol. Here, please take this reward for your kindness.");
   quest::faction(135,5); #Guards of Qeynos
   quest::faction(9,5); # Antonius Bayle
   quest::faction(217,5); # Merchants of Qeynos
   quest::faction(53,-5); # Corrupt Qeynos Guards
   quest::faction(33,-10); # Circle of the unseen hand
   quest::exp(10);
    quest::ding();
   quest::givecash(0,0,0,4);
    }

  }

  plugin::return_items(\%itemcount); # return unused items

}

#END of FILE zone:qeynos ID:1147 -- Guard_Wenbie.pl