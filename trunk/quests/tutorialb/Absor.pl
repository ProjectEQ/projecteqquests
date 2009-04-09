#zone: tutorialb
#Revised Angelox and CrabClaw's Upgraded Absor v1.1 mod

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Weapons are one of your main forms of combat. And a faster weapon can make the battle go in your favor. While helping out here , I found enough stones to sharpen weapons. If youd like I can sharpen your's , simply hand it to me. Although, if you get me some raw materials I can do much [better]!");
  }
  elsif ($text=~/better/i) {
    quest::say("I can repair any rusty bladed weapon if you bring it to me with a chunk of bronze, such as a Short Sword, Long Sword and the like. The kobolds are the ones you seek for the bronze, those greedy vermin have a particular eye for shiny metal ignots.  Given even more resources, I can forge you a very nice [Two Hander].");
  }
  elsif ($text=~/Two Hander/i) {
    quest::say("Interested in a weapon of real power are ya? Well it be not an easy task but get me a chunk of iron, a chunk of bronze and a Tarnished Two Handed Sword and I can forge you a mighty sword that will make you the envy of all others! Now go forth and seek said materials adventurer!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9997 => 1)) {
    quest::summonitem(7021);
    quest::say("This will do just fine. Now let me see... Ah ha! There we go. Take this and give those kobolds a sound strike on the head!");
  }
  elsif (plugin::check_handin(\%itemcount, 9998 => 1)) {
    quest::summonitem(5042);
    quest::say("This will do just fine. Now let me see... Ah ha! There we go. Take this and give those kobolds a sound strike on the head!");
  }
  elsif (plugin::check_handin(\%itemcount, 9999 => 1)) {
    quest::summonitem(6030);
    quest::say("This will do just fine. Now let me see... Ah ha! There we go. Take this and give those kobolds a sound strike on the head!");
  }
  elsif (plugin::check_handin(\%itemcount, 55623 => 1)) {
    quest::summonitem(5071);
    quest::say("This will do just fine. Now let me see... Ah ha! There we go. Take this and give those kobolds a sound strike on the head!");
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5013 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A much better Short Sword to help fend off those nasties!");
    quest::summonitem(5042);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5014 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A spiffy, repaired Axe to aid you in your adventures!");
    quest::summonitem(5043);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5015 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! Here's a much sharper Scythe!");
    quest::summonitem(5049);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5016 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A mighty Broad Sword!");
    quest::summonitem(5044);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5019 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A refurbished Long Sword to help fend off those nasties!");
    quest::summonitem(5045);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5020 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A powerful Battle Axe to help defeat your foes!");
    quest::summonitem(5046);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5021 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A new Scimitar to help fend off those nasties!");
    quest::summonitem(5047);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5022 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A refurbished Bastard Sword to help fend off those nasties!");
    quest::summonitem(5048);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5023 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A powerful Two-Handed Sword to help fend off those nasties!");
    quest::summonitem(5070);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 5024 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A mighty Halberd to help fend off those vermin!");
    quest::summonitem(5071);
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1, 59954 => 1, 5070 => 1)) {
    quest::say("Now let me see... Ah ha! Here ya go! A mighty Two Hander to conquer those vermin!");
    quest::summonitem(5030);
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}