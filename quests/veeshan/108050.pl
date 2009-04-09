#Silverwing

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("So, young one, you have come to seek an audience with me. What do you want? Hurry up and speak carefully. I'm not known for my patience or trust of your kind. Perhaps you can [assist] me by collecting a few items, then I may learn to be more trusting.");
  }
  if ($text=~/I will assist you/i) {
  quest::say("Very well. One of my scouts has been attempting to acquire the locations of powerful, yet inscribable words for me, but has not returned as soon as I'd like. I've grown impatient -- as you might guess. These words contain great magic, I'm sure of it, and when incanted correctly, create a fabled spell of extraordinary power. I had obtained some, but more are missing. Here is my lexicon and a list of found words so far. Go quickly and acquire all eight of the words I need and the spell scroll.");
  quest::summonitem(69347);
  quest::summonitem(69323);    
  }
  
sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 69324 => 1)) {
      quest::say("I'm somewhat impressed, stranger. You cannot imagine the power this spell may unleash. Take this reward and leave me. If the reward I have given you is not pleasing, hand it back and I will give you a different one. Make haste and leave me be, for I will need to recite this spell in private.");
      if ($class eq "Warrior"){quest::summonitem(69381);}
      elsif ($class eq "Berserker"){quest::summonitem(69381);}
      elsif ($class eq "Ranger"){quest::summonitem(69381);}
      elsif ($class eq "Bard"){quest::summonitem(69381);}
      elsif ($class eq "Rogue"){quest::summonitem(69381);}
      elsif ($class eq "Paladin"){quest::summonitem(69381);}
      elsif ($class eq "Shadowknight"){quest::summonitem(69381);}
      elsif ($class eq "Monk"){quest::summonitem(69381);}
      elsif ($class eq "Beastlord"){quest::summonitem(69381);}
      elsif ($class eq "Cleric"){quest::summonitem(69382);}
      elsif ($class eq "Druid"){quest::summonitem(69382);}
      elsif ($class eq "Shaman"){quest::summonitem(69382);}
      elsif ($class eq "Enchanter"){quest::summonitem(69382);}
      elsif ($class eq "Magician"){quest::summonitem(69382);}
      elsif ($class eq "Necromancer"){quest::summonitem(69382);}
      elsif ($class eq "Wizard"){quest::summonitem(69382);}
      quest::exp(10000);
    }
        
    if (plugin::check_handin(\%itemcount, 69381 => 1)) {
      quest::say("How utterly obtuse and arrogant. How about this one then?");
      quest::summonitem(69382);
    }
    if (plugin::check_handin(\%itemcount, 69382 => 1)) {
    quest::say("How utterly obtuse and arrogant. How about this one then?");
    quest::summonitem(69381);      
    }
    
 else {
    plugin::return_items(\%itemcount);
    quest::say("I have no need for these items, you can have them back");
  }
  }
}