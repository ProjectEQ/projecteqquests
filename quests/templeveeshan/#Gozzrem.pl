# Gozzrem's WToV tests: 1st & 2nd arcane tests, wisdom long and short battles
#

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if ($text=~/hail/i) {
      quest::say("Greetings, $name. If you seek wisdom or the arcane I have tasks in the halls of testing you may complete to gain what you seek.");
    }  
    elsif ($text=~/the arcane/i) {
      quest::say("To garner a reward fit for one who walks the arcane path return to me the poison tear and the poison symbol. Along with these return the serrated symbol and the runed symbol. If this task is not hard enough for you, I have a second quest for you.");
    }
    elsif ($text=~/the second quest/i) {
      quest::say("Tears may fall to the ground but not the ones you seek now. The black tear and the ruby tear you must seek. For more power I require the ruby symbol and a white symbol to bind the powers together. Upon the return of these four objects you will receive a wondrous reward.");
    }
    elsif ($text=~/wisdom/i) {
      quest::say("Wisdom can be gleaned from battle and that is what I wish you to do. Battle in the halls of testing may give you a different outlook on life. Which do you seek, the short battle or the long $name?");
    }
    elsif ($text=~/long battle/i) {
      quest::say("You will spend much time in the halls of testing. Seek out a runed tear and a flame kissed tear, bring them back to me with a symbol black as midnight and a glowing orb of the ancient drakes.");
    }
    elsif ($text=~/short battle/i) {
      quest::say("For the shortest time in the halls, seek out a Platinum tear held by the cursed one, a platinum symbol, a silver symbol and an emerald symbol as green as the forests. If you are able to return these to me I will reward you with a simple idol of the white dragons.");
    }
  }
  else {
     quest::say("I do not know you well enough to entrust you with such a quest, yet.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) {
    if (plugin::check_handin(\%itemcount, 31266 => 1, 31255 => 1, 31252 => 1, 31254 => 1)) { # first test of the arcane
      quest::summonitem(31466);
    }
    elsif (plugin::check_handin(\%itemcount, 31262 => 1, 31270 => 1, 31259 => 1, 31250 => 1)) { # second test of the arcane
      quest::summonitem(31468);
    }
    elsif (plugin::check_handin(\%itemcount, 31267 => 1, 31263 => 1, 31251 => 1, 31260 => 1)) { # test of long battle
      quest::summonitem(31467);
    }
    elsif (plugin::check_handin(\%itemcount, 31253 => 1, 31258 => 1, 31257 => 1, 31269 => 1)) { # test of short battle
      quest::summonitem(31465);
    }
    else {
      quest::say("I do not need this, little one");
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::emote("looks pleased as she hands you the reward.");
    quest::faction(42,+75); # claws of veeshan
    quest::faction(362,+75); # yelinak
    quest::faction(189,-100); # zek
    quest::exp(200000);
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
  }
}

# EOF zone: templeveeshan ID: 124105 NPC: #Gozzrem

