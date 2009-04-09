# Telkorenar's WToV tests: Test of Protection, Fire Storm, Living Flame, Tooth
#

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if ($text=~/hail/i) {
      quest::say("The Strong seek me out, for one reason or another. It seems you have come here in peace. Perhaps you wish to prove yourself a mighty $class? I respect only might, $race.");
    }
    elsif ($text=~/wish to prove/i) {
      quest::say("For the mighty I have four tests. The test of the tooth, the
test of the flame, the test of the fire storm, and the test of protection. Which
test do you wish to undertake?");
    }
    elsif ($text=~/test of the tooth/i) {
      quest::say("With tooth and nail you must fight, deep into the halls of testing. Recover the white tear of power, the white symbol for purity, the silver symbol to calm ones self, and a glowing orb. If you can return these to me I will know you are a mighty fighter indeed.");
    }
    elsif ($text=~/test of the flame/i) {
      quest::say("Return the black tear, the black symbol, the poison symbol, and the serrated symbol to me and you will have completed the test of flame. Your reward will be quite suitable to one who enters the fray of battle.");
    }
    elsif ($text=~/test of the fire storm/i) {
      quest::say("Become like a fire storm and bring your wrath upon the inhabitants of the halls of testing. Return when you have the tear of poison and the serrated tear along with the a symbol kissed by flames and a ruby symbol.");
    }
    elsif ($text=~/test of protection/i) {
      quest::say("My fire will protect you if you are strong enough to endure this test. A ruby tear like my flames, an emerald tear like a forest ready to burn, an emerald symbol, and a platinum symbol are what I seek. With these I will forge pauldrons unlike any you have ever seen mortal. Go now and seek out what I desire.");
    }
  }
  else {
     quest::say("I do not know you well enough to entrust you with such a quest, yet.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) {
    if (plugin::check_handin(\%itemcount, 31257 => 1, 31268 => 1, 31270 => 1, 31258 => 1)) { # protection
      quest::summonitem(31472);
    }
    elsif (plugin::check_handin(\%itemcount, 31260 => 1, 31253 => 1, 31261 => 1, 31250 => 1)) { # test of the tooth
      quest::summonitem(31469);
    }
    elsif (plugin::check_handin(\%itemcount, 31262 => 1, 31251 => 1, 31255 => 1, 31254 => 1)) { # test of living flame
      quest::summonitem(31470);
    }
    elsif (plugin::check_handin(\%itemcount, 31256 => 1, 31266 => 1, 31265 => 1, 31259 => 1)) { # test of the fire storm
      quest::summonitem(31471);
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

# EOF zone: templeveeshan ID: 124104 NPC: #Telkorenar

