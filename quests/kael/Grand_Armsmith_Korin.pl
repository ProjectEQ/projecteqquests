#Kael Custom Crown Quest
#NPC: Grand_Armsmith_Korin (113163)
#Credit: Primal - VZTZ (Submitted by Cottus)

sub EVENT_SAY {
  if ($faction <= 3) {
    if ($text=~/hail/i) {
      quest::say("What do you want from me $race? I can only imagine that you are here to ask me to use my obviously superior smithing talents to create some [special helmets] to help protect your obviously frail body.");
    }      
    if ($text=~/special helmets/i) {
      quest::say("Just as I suspected $race. Using my superior skills I can customize a plate helmet to help better protect you. Give me your Malevolent Crown, Warlord's Crown, Shining Helm, Templar's Crown, Troubadour's Helm, Frostreaver's Velium Crown, Crown of the Kromzek Kings or a Cowl of Mortality and I shall make you a new helm that will better protect you.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you $race now begone!");
  }
}
    
sub EVENT_ITEM {
  if ($faction <= 3) {
    if (plugin::check_handin(\%itemcount, 25349 => 1)) { #Malevolant Crown - Shadowknight
      quest::say("Here you are $race just as I promised. May it guard you well.");
      quest::summonitem(31520); #Custom Malevolent Crown
    }
    elsif (plugin::check_handin(\%itemcount, 25433 => 1)) { #Warlord's Crown - Warrior
      quest::say("Here you are $race just as I promised. May it guard you well.");
      quest::summonitem(31524); #Custom Warlord's Crown
    }
    elsif (plugin::check_handin(\%itemcount, 25370 => 1)) { #Shining Helm - Paladin
      quest::say("Here you are $race just as I promised. May it guard you well.");
      quest::summonitem(31521); #Custom Shining Helm
    }
    elsif (plugin::check_handin(\%itemcount, 25391 => 1)) { #Templar's Crown - Cleric
      quest::say("Here you are $race just as I promised. May it guard you well.");
      quest::summonitem(31523); #Custom Templar's Crown
    }
    elsif (plugin::check_handin(\%itemcount, 25384 => 1)) { #Troubadour's Helm - Bard
      quest::say("Here you are $race just as I promised. May it guard you well.");
      quest::summonitem(31522); #Custom Troubadour's Helm
    }
    elsif (plugin::check_handin(\%itemcount, 30507 => 1)) { #Frostreaver's Velium Crown
      quest::say("Here you are $race just as I promised. May it guard you well.");
      quest::summonitem(2610); #Custom Frostreaver's Velium Crown
    }
    elsif (plugin::check_handin(\%itemcount, 25194 => 1)) { #Crown of the Kromzek Kings
      quest::say("Here you are $race just as I promised. May it guard you well.");
      quest::summonitem(2611); #Custom Crown of the Kromzek Kings
    }
    elsif (plugin::check_handin(\%itemcount, 26025 => 1)) { #Cowl of Mortality
      quest::say("Here you are $race just as I promised. May it guard you well.");
      quest::summonitem(2612); #Custom Cowl of Mortality
    }
    else {
      quest::say("These are not the item I asked for $race do not waste my time!");
      plugin::return_items(\%itemcount);
    }
  }   
  else {
    quest::say("I do not know you well enough to entrust you with such an item yet, now leave my sight $race.");
    plugin::return_items(\%itemcount);
  }
}

#END OF FILE