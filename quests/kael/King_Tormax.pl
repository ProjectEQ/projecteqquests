# Gauntlets of Dragon Slaying
# Belt of Dwarf Slaying

sub EVENT_SAY {
  if ($faction < 5) { # Require amiable or better faction
    if ($text=~/hail/i) {
      quest::say("Greetings, $race. You know who I am, but I only vaguely know of you. My purpose is simple, I will rule these lands like my father, and my grandfather before him. All tasks but two are inconsequential to me.");
    }
    elsif ($text=~/tasks/i) {
      quest::say("The tasks are simple, $race. I wish the death of the other 'powers' of this frozen waste land. If you are able to destroy either of my mortal foes, bring me proof of your exploits and you will be known as the hero of Kael Drakkel.");
    }
    elsif ($text=~/powers/i) {
      quest::emote("laughs deeply. 'I speak of the foolish old dragon Yelinak and that pitiful Dain Frostreaver.'");
    }
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { # Require ally faction
    if (plugin::check_handin(\%itemcount, 30501 => 1)) { ## Dain head
      quest::summonitem(25858);
      quest::faction(49,-100); # -coldain
      quest::faction(67,-100); # -dain
    }
    elsif (plugin::check_handin(\%itemcount, 24984 => 1)) { ## Yelinak head
      quest::summonitem(25857);
      quest::faction(362,-100); # -Yelinak
      quest::faction(67,-100); # -dain
    }
    else {
      quest::say("I do not need this little one");
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::emote("laughs deeply as he takes the bloody head then gives you your reward.");

    quest::faction(189,+75); # +zek
    quest::faction(179,+75); # +tormax
    quest::exp(200000);
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: kael ID: 113215 NPC: King_Tormax

