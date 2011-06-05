# Necromancer Abysmal Sea armor
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Do you command the dead? Do you practice the necromantic arts? Are you a [necromancer]? Speak up!");
  }
  if ($text=~/necromancer/i) {
    quest::say("Good. Sometimes it is difficult to contact each other, is it not? I too am a necromancer. If you are in need of new equipment such as [circlet], [pantaloons], [robe], [bracer], [sleeves], [gloves], and [sandals] please let me know.");
  }
  if ($text=~/bracer/i) {
    quest::say("I will craft you a bracer if you bring me the materials. Speak to Nalasrine about her findings, she may be able to help you infuse some Muramite silk thread to strengthen it. One length of infused Muramite silk thread along with a reworked bracer would suit you just fine. Find Muramite Bracer Armor piece and return it to me for reworking.");
  }
  if ($text=~/circlet/i) {
    quest::say("I can shape you a powerful circlet from from Muramite Helm Armor. All you need to do is find some Muramite silk thread. A strengthened thread woven over the circlet in a loom shall yield a fine circlet indeed. Talk to Nalasrine about the strengthening process.");
  }
  if ($text=~/gloves/i) {
    quest::say("Find some Muramite silk thread, I am sure Nalasrine can assist you with stregnthening it. Bring me Muramite Glove Armor and I will shape them for you, once I have finished you can add the final touches yourself in a loom.");
  }
  if ($text=~/pantaloons/i) {
    quest::say("Warping some Muramite greaves into a pair of pantaloons that would serve you well is menial. Bring me a pair of Muramite Greaves. Once I have done this, you will need to do the final touches yourself. Two lengths of Muramite silk thread infused with Nalasrine's strengthener should be sufficient to finish them up.");
  }
  if ($text=~/robe/i) {
    quest::say("A useful robe shall be yours if you bring me Muramite Chest Armor piece. I can reshape it easily, and the finishing touches may be applied by your hand. Strengthen two lengths of Muramite silk thread with Nalasrine's special mixture and some quick work with a loom should do the trick.");
  }
  if ($text=~/sandals/i) {
    quest::say("Bring me back Muramite Boot Armor and I believe I can rework them into some nice sandals. To thread them together you will need some strengthened Muramite silk thread. If you need help in the strengthening process, just talk to Nalasrine.");
  }
  if ($text=~/sleeves/i) {
    quest::say("Bring me Muramite Sleeve Armor. I will do the alterations for you, then all you will need to do is find some Muramite silk thread. Nalasrine can help you strengthen it, and you will have the makings of some nice sleeves.");
  }
}

sub EVENT_ITEM {
  if ($class eq "Necromancer") {
    if (plugin::check_handin(\%itemcount, 68222 => 1)) { # Bracer
      quest::summonitem(54184); # reworked Bracer
    }
    elsif (plugin::check_handin(\%itemcount, 68220 => 1)) { # Circlet
      quest::summonitem(54182); # reworked circlet
    }
    elsif (plugin::check_handin(\%itemcount, 68223 => 1)) { # Gloves
      quest::summonitem(54185); # reworked gloves
    }
    elsif (plugin::check_handin(\%itemcount, 68225 => 1)) { # Pantaloons
      quest::summonitem(54187); # reworked pantaloons
    }
    elsif (plugin::check_handin(\%itemcount, 68226 => 1)) { # Robe
      quest::summonitem(54188); # reworked robe
    }
    elsif (plugin::check_handin(\%itemcount, 68224 => 1)) { # Sandals
      quest::summonitem(54186); # reworked sandals
    }
    elsif (plugin::check_handin(\%itemcount, 68221 => 1)) { # Sleeves
      quest::summonitem(54183); # reworked sleeves
    }
    else {     
      quest::say("I have no use for this.");   
      plugin::return_items(\%itemcount);
    }
  } else {
    quest::say("I have no use for this.");   
    plugin::return_items(\%itemcount);
  }
}
#END of FILE zone:abysmal ID:279018 -- Nolaen_Tav-Inxya.pl