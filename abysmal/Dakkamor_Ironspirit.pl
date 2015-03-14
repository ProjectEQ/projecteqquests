# Cleric Abysmal Sea armor
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail there! Welcome aboard! There is never enough time to care for all the ill in such a place. You wouldn't happen to be a [cleric] as well would you?");
  }
  if ($text=~/cleric/i) {
    quest::say("Mayhaps we can help each other out. You keep going about being a good helpful cleric, so I have fewer sick folk to tend to, and I will help you out in the equipment department. If you are in need of new equipment such as [helm], [legplates], [chestplate], [bracer], [vambraces], [gloves], or pair of [boots] let me know.");
  }
  if ($text=~/bracer/i) {
    quest::say("A bracer is rather simple to reshape. If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite metal to strengthen it. One sheet of infused Muramite metal along with a Muramite Bracer Armor should be sufficient for me to rework it for you.");
  }
  if ($text=~/helm/i) {
    quest::say("I can craft a Muramite helm into something suitable for you. Nalasrine has managed to form a powerful compound that reinforces some native materials. Bring me a Muramite Helm Armor piece and some Muramite metal that has been infused with Nalarsine's mixture.");
  }
  if ($text=~/gloves/i) {
    quest::say("In order for me to craft you some gloves, you need to find some more Muramite metal. I am sure Nalasrine can assist you with infusing the metal, which needs to be done before you bring it back to me. Bring me an infused Muramite metal sheet, and a Muramite Glove Armor.");
  }
  if ($text=~/legplates/i) {
    quest::say("Reshaping a pair of Muramite legplates into a pair that would serve you well should be easy. Bring back a pair of Muramite Greaves and two sheets of Muramite metal. Give only the greaves to me for shaping, once I am done with that you will need to take the metal and greaves to a forge. Don't forget to infuse the metal with the mixture from Nalasrine before you take it to the forge.");
  }
  if ($text=~/chestplate/i) {
    quest::say("Ahh, a chestplate. Who doesn't want a new chestplate? Bring back Muramite Chest Armor. Give that to me and I can make some rough adjustments for you. In order for it to suit you properly however, you will also need two sheets of infused Muramite metal and a forge. Make sure to speak to Nalasrine about infusing the metal.");
  }
  if ($text=~/boots/i) {
    quest::say("Bring me back a sheet of infused Muramite metal along with a Muramite Boot Armor and I believe I can rework them into something quite fine for you. If you need help in the infusing process, just talk to Nalasrine."); 
  }
  if ($text=~/vambraces/i) {
    quest::say("Vambraces? Hmm, find some Muramite metal and some Muramite Sleeve Armor. Once you have these things talk to Nalasrine about infusing the metal. When it is strong I should be able to craft you some nice vambraces.");
  }
}

sub EVENT_ITEM {
  if ($class eq "Cleric") {
    if (plugin::check_handin(\%itemcount, 68222 => 1)) { # Bracer
      quest::summonitem(54114); # reworked Bracer
    }
    elsif (plugin::check_handin(\%itemcount, 68220 => 1)) { # cap
      quest::summonitem(54112); # reworked cap
    }
    elsif (plugin::check_handin(\%itemcount, 68223 => 1)) { # Gloves
      quest::summonitem(54115); # reworked gloves
    }
    elsif (plugin::check_handin(\%itemcount, 68225 => 1)) { # leggings
      quest::summonitem(54117); # reworked leggings
    }
    elsif (plugin::check_handin(\%itemcount, 68226 => 1)) { # tunic
      quest::summonitem(54118); # reworked tunic
    }
    elsif (plugin::check_handin(\%itemcount, 68224 => 1)) { # Sandals
      quest::summonitem(54116); # reworked sandals
    }
    elsif (plugin::check_handin(\%itemcount, 68221 => 1)) { # vambraces
      quest::summonitem(54113); # reworked vambraces
    }
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279017 -- Dakkamor_Ironspirit.pl