sub EVENT_SAY {
  if ($text=~/hail/i) {
    if($wizepicB == 1) {
      quest::say("Ah yes, you again. Do you have the items? Give me the three you possess and I'll combine them with my own.");
    }
    elsif($wizepicA == 1) {
      quest::say("Ah, but it pains my heart to see this. How I could love a women like that is beyond me. And yet, I still do love her. It was on the day I was to ask her to marry me that I lost my powers. When I was about to cast my greatest spell to prove my love to her, my magic failed. She ran out on me that day. But enough of me, do you wish to hear my story?");
    }
    else {
      quest::say("Before I tell you anything, I require you to help me. Seek a woman named Challice. Give her this letter and then return to me.");
      quest::summonitem(14334);
    }
  }
  if($text =~ /story/i) {
    quest::say("I once was one of four true followers of Solusek Ro. So great were the four of us that Solusek Ro himself made us each a special item. We did not know what the others' items were, but we realized that was for our own safety. Each one of us, after receiving the item, began to plot against Solusek Ro. Each of us believed we had enough power to dominate Norrath. Solusek Ro saw this and at the time we needed our powers most, he stripped us of them. Now I know two of the other wizards by name. One was called Sylen Tyrn, the other's name was Demunir Scry. The last wizard was a gnome, but I can't think of his name.");
  }
  if($text =~ /Sylen Tyrn/i) {
    quest::say("Sylen was a high elf wizard, and like many high elves, he believed himself to be better than others. Because of his birth, he thought he was more noble and more intelligent than anyone else. I heard how met his demise - while flying over a vast area of water, his powers were stripped from him in midflight. He fell and was captured by a rival wizard who specialized in magics of the water. Search for that wizard and you could find a trace of Sylen.");
  }
  if($text =~ /Demunir Scry/i) {
    quest::say("Demunir was a human in a rush for power. He was extremely intelligent and resourceful but, unfortunately, was more interested in destructive magic. Hearing of an ancient land, he immediately traveled to it, believing there to be powerful relics left undiscovered there. While exploring, he came upon a dwelling that housed a powerful warrior. Believing himself to be more powerful, he attempted to take this dwelling for himself. While in battle with this warrior, Solusek Ro stole his powers and left him helpless. It is said that Demunir's item is the warrior's most prized trophy.");
  }
  if($text =~ /the gnome/i && $class eq "Wizard") {
    quest::say("Ah, the gnome I know very little about. I know he was small and crafty, and that he had a brother. His brother's craft was that of making fireworks, and he was the unfortunate victim of one of his own experiments. His firework exploded, leaving his mind diminished in capacity, even for a gnome. I remember others calling him 'Old Stewpot' in jest. I do not know if this is his birth name, but it may help you to locate him. I hear he also stays close to water because of the explosion. You never know when another gnomish invention will go awry. Give him this letter to help motivate him to remember.");
    quest::summonitem(18169);
    quest::faction(342, 30); #Truespirit
  } 
}

sub EVENT_ITEM {
  #Return Love Note handin
  if (plugin::check_handin(\%itemcount, 14335 => 1)) {
    quest::setglobal("wizepicA",1,0,"F");
  }
  #Return Oil Note handin:
  if (plugin::check_handin(\%itemcount, 18168 => 1)) {
    quest::delglobal("wizepicA");
    quest::setglobal("wizepicB",1,0,"F");
  }
  #Staff of Gabstik, Blue Crystal Staff, Gnarled Staff 
if ($wizepicB == 1) {
  if (plugin::check_handin(\%itemcount, 14337 => 1, 14338 => 1, 14339 => 1)) {
      quest::say("Here, this pack contains all of our items. You will never be able to open it again, so you must deliver the pack, intact, to Solomen. He will then reward you. Now that I have helped you, leave me in peace.");
      quest::summonitem(14340);
      quest::delglobal("wizepicB");
    }
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if ($signal == 101) {
    quest::setglobal("wizepicA",1,0,"F");
  }
  if ($signal == 102) {
    quest::delglobal("wizepicA");
    quest::setglobal("wizepicB",1,0,"F");
  }
}

