sub EVENT_SAY {
  if ($faction <= 5) {
    if($text=~/hail/i){
      quest::say("Shhh. quiet! This is place of solitude and peace! You [respect temple] while you here if you know what good for you!");
    }
    if($text=~/respect temple/i){
      quest::say("One way guests show respect is to bring the host [food]. Something really good would be nice.");
    }
    if($text=~/food/i){
      quest::say("Lessee. . . Dryad Pate is what I want. Bring me some [Dryad Pate] and then you be a good guest. Maybe then I return a favor for you.");
    }
    if($text=~/dryad pate/i){
      quest::say("I don't know how it made. Talk to the Brargus about it. He the cook.");
    }
    if($text=~/necklace/i){
      quest::say("I make many different kinds of necklaces for my friends from fangs of powerful creatures like bear, panther and wolf. You give me your token of friendship and I give you a pouch to keep some stuff in. After you get the stuff and seal the bag, bring it back and I make you a nice necklace to wear. Stuff I need is one Anaconda Skin and three Fangs. Fangs that make good necklaces are Wolf, Bear and Panther. Make sure all fangs are same. Necklaces with different fangs are neat but not as nice as ones with all same fangs, so I only make those ones.");
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 8199 => 1)) { #Hand-In: Dryad Pate
    quest::say("Ohh. . . This really good, thanks! You take this token of friendship. You all smell the same so this way I know who you are. I can make nice [necklaces] for my friends.");
    quest::summonitem(8270); #Token of Friendship
    quest::faction(6,50); #Anchorites of Brell Serilis
  }
  if (plugin::check_handin(\%itemcount, 8270 => 1)) { #Hand-In: Token of Friendship
    quest::say("Ok, here pouch to collect stuff. Come back when pouch full. Make sure you seal pouch or stuff may fall out.");
    quest::summonitem(8270); #Token of Friendship
    quest::summonitem(17263); #Necklace Component Pouch
  }
  if (plugin::check_handin(\%itemcount, 9228 => 1)) { #Hand-In: Sealed Wolf Fang Pouch
    quest::say("Oh hello friend, I make this nice necklace for you! You wear this and feel the spirit of the wolf run through you!");
    quest::summonitem(8258); #Wolf Fang Necklace
    quest::faction(6,50); #Anchorites of Brell Serilis
  }
  if (plugin::check_handin(\%itemcount, 9229 => 1)) { #Hand-In: Sealed Bear Fang Pouch
    quest::say("My friend returns again! I make this nice necklace for you. Wear this and feel the essence of the bear flow through you.");
    quest::summonitem(8261); #Bear Fang Necklace
    quest::faction(6,50); #Anchorites of Brell Serilis
  }
  if (plugin::check_handin(\%itemcount, 9230 => 1)) { #Hand-In: Sealed Panther Fang Pouch
    quest::say("Hello again friend. This nice panther fang, here you take this necklace I make you. It imbued with spirit of the cat.");
    quest::summonitem(8257); #Panther Fang Necklace
    quest::faction(6,50); #Anchorites of Brell Serilis
  } 
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:jaggedpine  ID:181125 -- Snarla_the_Fang