# Shaman Abysmal Sea armor
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I seek those who study the spirit world and potions and tribal magic. I seek a shaman. Are you a [shaman]?");
  }
  if ($text=~/shaman/i) {
    quest::say("In that case, I am in your service. If you would perform a few simple tasks I will assist you in creating a new set of powerful armor to guard you in battle. I can make you a [helm], [greaves], [chainmail], [bracer], [vambraces], [gloves], and [boots].");
  }
  if ($text=~/bracer/i) {
    quest::say("Bring me a Muramite Bracer Armor section and I can reshape it for you. If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite chain to strengthen it. One length of infused Muramite chain along with my reworked bracer in a forge should be sufficient.");
  }
  if ($text=~/helm/i) {
    quest::say("In order to craft a helm, I need you to bring me Muramite Helm Armor. I can take this helm and reshape it into something more suitable for you. Once I have done so, take an infused Muramite chain length and in a forge you can make any final adjustments to it yourself. Nalasrine can assist you with the infusing the chain.");
  }
  if ($text=~/gloves/i) {
    quest::say("Bring me some Muramite Glove Armor and I shall craft you some gloves. Don't forget to also find a length of Muramite chain and to talk to Nalasrine about the infusion process. Place the infused chain and the gloves from me in a forge for final adjustments.");
  }
  if ($text=~/greaves/i) {
    quest::say("Simply bring me Muramite Greaves Armor. Two lengths of infused Muramite chain will be necessary to make some final adjustments to the greaves yourself in a forge. Don't forget - Nalasrine can assist you with the infusion.");
  }
  if ($text=~/chainmail/i) {
    quest::say("Merely bring me Muramite Chest Armor. Any final adjustments can be made with two lengths of infused Muramite chain and the new chainmail in a forge. Don't forget - Nalasrine can assist you with the infusion.");
  }
  if ($text=~/boots/i) {
    quest::say("In order to make you some boots, I need you to bring me a Muramite Boot Armor piece. Then take a length of infused Muramite chain and shape the chain to the boots in a forge. Nalasrine can assist you with the infusion, by the way.");
  }
  if ($text=~/vambraces/i) {
    quest::say("Bring me Muramite Sleeve Armor. I will fit them as close as I can, then you must take a length of infused Muramite chain and the sleeves to a forge. Nalasrine carries the infusions for the metal that you will need.");
  }
}

sub EVENT_ITEM {
  if ($class eq "Shaman") {
    if (plugin::check_handin(\%itemcount, 68222 => 1)) { # Bracer
      quest::summonitem(54142); # reworked Bracer
    }
    elsif (plugin::check_handin(\%itemcount, 68220 => 1)) { # cap
      quest::summonitem(54140); # reworked cap
    }
    elsif (plugin::check_handin(\%itemcount, 68223 => 1)) { # Gloves
      quest::summonitem(54143); # reworked gloves
    }
    elsif (plugin::check_handin(\%itemcount, 68225 => 1)) { # leggings
      quest::summonitem(54145); # reworked leggings
    }
    elsif (plugin::check_handin(\%itemcount, 68226 => 1)) { # tunic
      quest::summonitem(54146); # reworked tunic
    }
    elsif (plugin::check_handin(\%itemcount, 68224 => 1)) { # Sandals
      quest::summonitem(54144); # reworked sandals
    }
    elsif (plugin::check_handin(\%itemcount, 68221 => 1)) { # vambraces
      quest::summonitem(54141); # reworked vambraces
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
#END of FILE zone:abysmal ID:279022 -- Kanleku_Grabboz.pl