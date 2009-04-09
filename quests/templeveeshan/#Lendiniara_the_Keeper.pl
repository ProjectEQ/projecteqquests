sub EVENT_SAY {
  if ($faction == 1) {
    if ($text=~/hail/i) {
      quest::say("Greetings, $name. I am the keeper of relics. If you are brave I have tasks to test your might and perhaps rewards.");
    }
    elsif ($text=~/rewards/i) {
      quest::say("One should ask of the tasks before worrying about rewards, $race.");
    }
    elsif ($text=~/tasks/i) {
      quest::say("Enter into the halls of testing to complete these tasks. Seek out the ancient ones inside and see if your might is as great as theirs and fear not, those who you slay will be returned to the temple by the gift of Veeshan's great power. I have three tasks, which any may complete, as well as a request of both the arcane and the strong.");
    }
    elsif ($text=~/request of the arcane/i) {
      quest::say("Those who seek knowledge, will seek this task out for its reward is great. Three tears and a glowing orb will garner one an ancient mask. The White tear and the black tear for balance the runed tear to hold the balance and a glowing orb to return raw energy to the ancient mask.");
    }
    elsif ($text=~/request of the strong/i) {
      quest::say("Those who believe they are strong may be surprised after such a task. Seek out the cursed one and slay him, return to me when you have gathered a silver tear, a poison tear, a flame kissed tear and a serrated tear. End the cursed ones torment for a short time, before the high priest raises him to continue his suffering for eternity.");
    }
    elsif ($text=~/request of the three/i) {
    quest::say("Tears from the cursed you much seek for each task. The test of the Ruby Tear, the test of the Platinum Tear and the test of the Emerald Tear await all who wish to partake of them.");
    }
    elsif ($text=~/test of the ruby tear/i) {
    quest::say("The test of the ruby tear sounds simple enough, enter the halls of testing, secure a ruby tear, a white symbol, a silver symbol and a ruby symbol. I warn you mortal, those who walk the halls will rend your body and mind if you are not worthy.");
    }
    elsif ($text=~/test of the platinum tear/i) {
    quest::say("Seek the platinum tear and three symbols to bind its powers to a bracelet. The black symbol to add raw power, the serrated symbol to enchant its powers and the runed symbol to hold the powers to the bracelet.");
    }
    elsif ($text=~/test of the emerald tear/i) {
    quest::say("The emerald tear of Veeshan entrusted to the cursed one. Return this tear to me so I may return the powers of an ancient shield. Three symbols you must also seek. Emerald like the tear, one kissed by the flames of the elder wurms and one made of the ancient wyverns venomous poison.");
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such a quest, yet.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) {
    if (plugin::check_handin(\%itemcount, 31262 => 1, 31261 => 1, 31263 => 1, 31260 => 1)) { ## request of the arcane
      quest::summonitem(31463);
      quest::emote("looks happy as she hands you the reward.");
      quest::faction(42,+75); # claws of veeshan
      quest::faction(362,+75); # yelinak
      quest::faction(189,-100); # zek
      quest::exp(200000);
    }
    elsif (plugin::check_handin(\%itemcount, 31267 => 1, 31266 => 1, 31265 => 1, 31264 => 1)) { ## request of the strong
      quest::summonitem(31464);
      quest::emote("looks happy as she hands you the reward.");
      quest::faction(42,+75); # claws of veeshan
      quest::faction(362,+75); # yelinak
      quest::faction(189,-100); # zek
      quest::exp(200000);
    }
    elsif (plugin::check_handin(\%itemcount, 31259 => 1, 31270 => 1, 31253 => 1, 31250 => 1)) { ## test of the ruby tear
      quest::summonitem(31460);
      quest::emote("looks happy as she hands you the reward.");
      quest::faction(42,+75); # claws of veeshan
      quest::faction(362,+75); # yelinak
      quest::faction(189,-100); # zek
      quest::exp(200000);
    }
    elsif (plugin::check_handin(\%itemcount, 31251 => 1, 31269 => 1, 31252 => 1, 31254 => 1)) { ## test of the platinum tear
      quest::summonitem(31461);
      quest::emote("looks happy as she hands you the reward.");
      quest::faction(42,+75); # claws of veeshan
      quest::faction(362,+75); # yelinak
      quest::faction(189,-100); # zek
      quest::exp(200000);
    }
    elsif (plugin::check_handin(\%itemcount, 31257 => 1, 31268 => 1, 31256 => 1, 31255 => 1)) { ## test of the emerald tear
      quest::summonitem(31462);
      quest::emote("looks happy as she hands you the reward.");
      quest::faction(42,+75); # claws of veeshan
      quest::faction(362,+75); # yelinak
      quest::faction(189,-100); # zek
      quest::exp(200000);
    }
    elsif (plugin::check_handin(\%itemcount, 69333 => 1)) { ## Note from Xygoz
      quest::say("What is this? A letter from Xygoz, my student? I am impressed you have been able to take this dangerous journey from Veeshan's Peak to here without any conflict. Oh, and he scribed it with our magic. Thank you for this letter. Now, take this trinket. It's a gift I would like you to bestow upon Xygoz for me. He was my favorite student, yet I never told him that directly. This trinket will surely deliver that message to him. However, there is one problem. The trinket has been damaged slightly because of an attack in Western Wastes. The magic from this trinket was torn from it and I fear that one of those horrid Kromzek has stolen it and taken it back to Kael. Before you give it to Xygoz, please retrieve the power source and reunite it with the trinket. I wish Xygoz my best and hope he will be most pleased with this token of my fondness for him.");
      quest::summonitem(69334);
    }
    else {
      quest::say("I do not need this, little one.");
      plugin::return_items(\%itemcount);
      return 1;
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
    plugin::return_items(\%itemcount);
  }  
}

# Quest edited and updated by mystic414

