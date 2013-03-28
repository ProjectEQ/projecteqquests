# Paladin Abysmal Sea armor
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings. I am only interested in speaking with those most uplifted of knights known as the [paladin], would you be one?");
  }
  if ($text=~/paladin/i) {
    quest::say("I have served those such as you my entire life. If you are in need of new equipment such as a [helm], [legplates], [chestplate], [bracer], [vambraces], [gloves], or a pair of [boots] let me know.");
  }
  if ($text=~/bracer/i) {
    quest::say("A bracer is rather simple to reshape. If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite metal to strengthen it. Bring me a Muramite Bracer Armor to work with. One sheet of infused Muramite metal along with the new bracer from me placed in a forge should come out perfectly.");
  }
  if ($text=~/helm/i) {
    quest::say("I can craft a Muramite helm into something suitable for you. Nalasrine has managed to form a powerful compound that reinforces some native materials. Bring me a Muramite Helm Armor piece and I can shape it to suit you, then you must take some Muramite metal that has been infused with Nalasrine's mixture and put it together in a forge to form a new helm.");
  }
  if ($text=~/gloves/i) {
    quest::say("In order for me to craft you some gloves, you will need to find some Muramite metal. I am sure Nalasrine can assist you with infusing the metal, which needs to be done before you forge it. Bring me the Muramite Glove Armor and I will shape some gauntlets for you. Then all you need to do is the final touch with the infused metal and the gauntlets in a forge.");
  }
  if ($text=~/legplates/i) {
    quest::say("Reshaping a pair of Muramite legplates into a pair for a noble one such as you is a pleasure. Bring back a pair of Muramite Greaves and two sheets of Muramite metal. Give only the greaves to me for shaping, once I am done with that you will need to take the metal and the greaves to a forge. Don't forget to infuse the metal with the misxture from Nalasrine before you take it to the forge.");
  }
  if ($text=~/chestplate/i) {
    quest::say("I can easily craft you a chestplate if you bring me back a Muramite Chest Armor. Give that to me and I can make some rough adjustments for you. In order for it to suit you properly however, you will also need to sheets of infused Muramite metal and a forge. Make sure to speak to Nalasrine about infusing the metal.");
  }
  if ($text=~/boots/i) {
    quest::say("Bring me back some Muramite Boot Armor and I believe I can rework them into something quite fine for you. You will need a sheet of infused Muramite metal along with the new boots from me in a forge to get a good fit. If you need help with infusing process speak to Nalasrine."); 
  }
  if ($text=~/vambraces/i) {
    quest::say("I shall make you some glorious vambraces. Bring to me Muramite Sleeve Armor and I will start shaping it to fit you. Once you have some Muramite metal talk to Nalasrine about infusing it. Then simply take the new vambraces from me and forge them with some of the infused metal.");
  }
}

sub EVENT_ITEM {
  if ($class eq "Paladin") {
    if (plugin::check_handin(\%itemcount, 68222 => 1)) { # Bracer
      quest::summonitem(54212); # reworked Bracer
    }
    elsif (plugin::check_handin(\%itemcount, 68220 => 1)) { # cap
      quest::summonitem(54210); # reworked cap
    }
    elsif (plugin::check_handin(\%itemcount, 68223 => 1)) { # Gloves
      quest::summonitem(54213); # reworked gloves
    }
    elsif (plugin::check_handin(\%itemcount, 68225 => 1)) { # leggings
      quest::summonitem(54215); # reworked leggings
    }
    elsif (plugin::check_handin(\%itemcount, 68226 => 1)) { # tunic
      quest::summonitem(54216); # reworked tunic
    }
    elsif (plugin::check_handin(\%itemcount, 68224 => 1)) { # Sandals
      quest::summonitem(54214); # reworked sandals
    }
    elsif (plugin::check_handin(\%itemcount, 68221 => 1)) { # vambraces
      quest::summonitem(54211); # reworked vambraces
    }
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279026 -- Trimdet_Trueheart.pl