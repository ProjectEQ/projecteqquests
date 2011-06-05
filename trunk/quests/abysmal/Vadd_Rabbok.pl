# Warrior Abysmal Sea armor
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I seek a powerful warrior. One who does not shy from battle or duty. Are you such a [warrior]?");
  }
  if ($text=~/warrior/i) {
    quest::say("The world does not turn without the service of those such as yourself. If you are in need of new equipment such as [helm], [legplates], [chestplate], [bracer], [vambraces], [gloves], or pair of [boots] let me know.");
  }
  if ($text=~/bracer/i) {
    quest::say("A bracer is rather simple to reshape. If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite metal to strengthen it. One sheet of infused Muramite metal along with a Muramite Bracer Armor should be sufficient for me to rework it for you.");
  }
  if ($text=~/helm/i) {
    quest::say("I can craft a Muramite helm into something suitable for you. Nalasrine has managed to form a powerful compound that reinforces some native materials. Bring me Muramite Helm Armor piece and I can shape it to suit you, then you must take some Muramite metal that has been infused with Nalasrine's mixture and put it together in a forge with the new helm.");
  }
  if ($text=~/gloves/i) {
    quest::say("In order for me to craft you some gloves, you need to find some more Muramite metal. I am sure Nalasrine can assist you with infusing the metal, which needs to be done before you forge it. Bring me Muramite Glove Armor and I will shape some gauntlets for you. Then all you need to do is the final touch with the infused metal and gauntlets in a forge.");
  }
  if ($text=~/legplates/i) {
    quest::say("Bring back a pair of Muramite Greaves and two sheets of Muramite metal. Give only the greaves to me for shaping, once I am done with that you will need to take the metal and greaves to a forge. Don't forget to infuse the metal with the mixture from Nalasrine before you take it to the forge.");
  }
  if ($text=~/chestplate/i) {
    quest::say("Ahh, a chestplate. Who doesn't want a new chestplate? Bring back Muramite Chest Armor. Give that to me and I can make some rough adjustments for you. In order for it to suit you properly however, you will also need two sheets of infused Muramite metal and a forge. Make sure to speak to Nalasrine about infusing the metal.");
  }
  if ($text=~/boots/i) {
    quest::say("Bring me back Muramite Boot Armor and I believe I can rework them into something quite fine for you. You will need a sheet of infused Muramite metal along with new boots from me in a forge to get a good fit. If you need help in the infusing process, just talk to Nalasrine."); 
  }
  if ($text=~/vambraces/i) {
    quest::say("I shall make you some glorious vambraces. Hmm, find some Muramite Sleeve Armor. Bring that to me and I will start shaping it to fit you. Once you have some Muramite metal talk to Nalasrine about infusing it. Then simply take the new vambraces from me and forge them with some of the infused metal.");
  }
}

sub EVENT_ITEM {
  if ($class eq "Warrior") {
    if (plugin::check_handin(\%itemcount, 68222 => 1)) { # Bracer
      quest::summonitem(54107); # reworked Bracer
    }
    elsif (plugin::check_handin(\%itemcount, 68220 => 1)) { # cap
      quest::summonitem(54105); # reworked cap
    }
    elsif (plugin::check_handin(\%itemcount, 68223 => 1)) { # Gloves
      quest::summonitem(54108); # reworked gloves
    }
    elsif (plugin::check_handin(\%itemcount, 68225 => 1)) { # leggings
      quest::summonitem(54110); # reworked leggings
    }
    elsif (plugin::check_handin(\%itemcount, 68226 => 1)) { # tunic
      quest::summonitem(54111); # reworked tunic
    }
    elsif (plugin::check_handin(\%itemcount, 68224 => 1)) { # Sandals
      quest::summonitem(54109); # reworked sandals
    }
    elsif (plugin::check_handin(\%itemcount, 68221 => 1)) { # vambraces
      quest::summonitem(54106); # reworked vambraces
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
#END of FILE zone:abysmal ID:279027 -- Vadd_Rabbok.pl