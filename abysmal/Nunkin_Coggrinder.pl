# Wizard Abysmal Sea armor
# Created by Gonner
# items: 68222, 54191, 68220, 54189, 68223, 54192, 68225, 54194, 68226, 54195, 68224, 54193, 68221, 54190

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello there! Are you a manipulator of fire, ice, and magic? Are you the most powerful of those that claim to be casters? Are you a [wizard]?");
  }
  if ($text=~/wizard/i) {
    quest::say("This is good. I do love to converse with fellow wizards. In any case, to help a fellow wizard I may be able to offer my services. If you are in need of new equipment such as [circlet], [pantaloons], [robe], [bracer], [sleeves], [gloves], and [sandals] please let me know.");
  }
  if ($text=~/bracer/i) {
    quest::say("A bracer? Of course! If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite silk thread to strengthen it. One length of infused Muramite silk thread along with a reworked bracer would suit you just fine. Find a Muramite Bracer Armor piece and return it to me for reworking.");
  }
  if ($text=~/circlet/i) {
    quest::say("I can shape you a beautiful circlet from Muramite Helm Armor. All you need to do is find some Muramite silk thread. A strengthened thread woven over the circlet in a loom shall yield a fine circlet indeed. Talk to Nalasrine about the strengthening process.");
  }
  if ($text=~/gloves/i) {
    quest::say("Find some Muramite silk thread, I am sure Nalasrine can assist you with stregnthening it. Bring me Muramite Glove Armor and I will shape them for you, once I have finished you can add the final touches yourself in a loom.");
  }
  if ($text=~/pantaloons/i) {
    quest::say("Stitching some Muramite greaves into a pair of pantaloons that would serve you well should be no great feat. Bring me a pair of Muramite Greaves. Once I have done this, you will need to do the final touches yourself. Two lengths of Muramite silk thread infused with Nalasrine's strengthener should be sufficient to finish them up.");
  }
  if ($text=~/robe/i) {
    quest::say("A grand robe shall be yours if you bring me a Muramite Chest Armor piece. I can reshape it easily, and the finishing touches may be applied by your hand. Strengthen two lengths of Muramite silk thread with Nalasrine's special mixture and some quick work with a loom should do the trick.");
  }
  if ($text=~/sandals/i) {
    quest::say("Bring me back Muramite Boot Armor and I believe I can rework them into some nice sandals. To thread them together you will need some strengthened Muramite silk thread. If you need help in the strengthening process, just talk to Nalasrine.");
  }
  if ($text=~/sleeves/i) {
    quest::say("Bring me Muramite Sleeve Armor. I will do the alterations for you, then all you will need to do is find some Muramite silk thread. Nalasrine can help you strengthen it, and you will have the makings of some nice sleeves.");
  }
}

sub EVENT_ITEM {
  if ($class eq "Wizard") {
    if (plugin::check_handin(\%itemcount, 68222 => 1)) { # Bracer
      quest::summonitem(54191); # reworked Bracer
    }
    elsif (plugin::check_handin(\%itemcount, 68220 => 1)) { # Circlet
      quest::summonitem(54189); # reworked circlet
    }
    elsif (plugin::check_handin(\%itemcount, 68223 => 1)) { # Gloves
      quest::summonitem(54192); # reworked gloves
    }
    elsif (plugin::check_handin(\%itemcount, 68225 => 1)) { # Pantaloons
      quest::summonitem(54194); # reworked pantaloons
    }
    elsif (plugin::check_handin(\%itemcount, 68226 => 1)) { # Robe
      quest::summonitem(54195); # reworked robe
    }
    elsif (plugin::check_handin(\%itemcount, 68224 => 1)) { # Sandals
      quest::summonitem(54193); # reworked sandals
    }
    elsif (plugin::check_handin(\%itemcount, 68221 => 1)) { # Sleeves
      quest::summonitem(54190); # reworked sleeves
    }
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279021 -- Nunkin_Coggrinder.pl