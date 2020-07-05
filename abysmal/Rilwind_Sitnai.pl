# items: 58064, 58137, 58156, 58118, 58117, 58208, 58068, 58081, 58107, 58108, 58106, 58209, 63838, 62481, 17912, 62480
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings. We are busy here, and I have little time for pleasantries. I can sell you supplies, if you have need. I can even help you fix up that old Jeweler's [Kit] of yours. Or perhaps you are here to [assist] me with my work?");
  }
  if ($text=~/kit/i) {
    quest::say("Ah, well, we've been working on improving our ability to work with liquid precious metals. To do that, we've had to improve our kits. We've made them a bit larger, and added some reinforcements to help them resist the heat. I can make one for you, just find a turepta shell and two shimmering steel threads and hand them to me along with your Jeweler's Kit and I'll make you a new one."); #Changed back to original quest until Neysia is added
  }
  if ($text=~/assist/i) {
    quest::say("I haven't the time to keep up with the needs of the Wayfarers, I have more urgent matters to attend to. We have discovered a rare form of a relatively worthless mineral. Some trauma seems to have affected the local ulexite, striating it, which has given it the unusual property of image transference, as well as imbuing it with some sort of magical properties. I can only imagine the sort of magical and geologic upheaval that would be required to make these changes in ulexite! I certainly would have been a dramatic experience. Study of this material is my primary concern. I also have a duty to the Wayfarers Brotherhood. If you could attend to some of my tasks, I would be grateful. If you can relieve me of enough of these [tasks], I can continue my study of the [Shimmering Nihilite].");
  }
  if ($text=~/shimmering nihilite/i) {
    quest::say("Nihilite appears to have two forms. The Pale nihilite is relatively common. Shimmering nihilite is infused with crystals that make the usual milky color of the stone glimmer with specks of light. It is truly beautiful, but hard to find. It seems to be concentrated in the interior of Taelosia. If you can find Raw Shimmering nihilite, I can prepare it for you. In exchange, I will keep a small amount of it for my own work.");
  }
  if ($text=~/tasks/i) {
    quest::say("There is much that needs to be done. I have several simple items that need to be made from the Pale nihilite that Glirina can prepare for you. If you bring me some, I can set you to work on creating items from them. This will give you practice working with nihilite and will give me more time to work on my research. Because I am asking you to provide the material for this work, I will be able to reward you more quickly than Glirina can. Just hand me the Pale nihilite when you are ready to begin.");
    quest::taskselector(169); #Jewelcraft Collect
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58064 => 1)) { #Pale Nihilite
    if (quest::istaskactivityactive(169,0)) { #Jewelcraft Collect Step 1
      quest::say("Good. We are in need of some simple pendants made from Pale nihilite, both for sale and for some of our research. Just take this Small Pale nihilite and Thin Silver Chain and combine them in your Jeweler's Kit. Give me the pendants and I will be grateful.");
      quest::summonitem(58137,10); #Small Pale Nihilite
      quest::summonitem(58156,10); #Thin Silver Chain
    }
    elsif (quest::istaskactivityactive(169,1)) { #Jewelcraft Collect Step 2
      quest::say("Good. We need some rings made from with nihilite. Please take a Small Pale nihilite and a Simple Silver Ring and combine them in your Jeweler's Kit. These rings are simple, and their simplicity makes them beautiful. Bring any of these simple nihilite rings that you complete to me.");
      quest::summonitem(58137,10); #Small Pale Nihilite
      quest::summonitem(58118,10); #Simple Silver Ring
    }
    elsif (quest::istaskactivityactive(169,2)) { #Jewelcraft Collect Step 3
      quest::say("Good. I would like you to make some earrings using Pale nihilite. Place one Small Pale nihilite and a Simple Silver Earring in your Jeweler's Kit and combine them. I do not believe that these earrings are very appealing, as the nihilite is not as attractive in small pieces, but there are others that think otherwise. Bring me the earrings when you have them done.");
      quest::summonitem(58137,10); #Small Pale Nihilite
      quest::summonitem(58117,10); #Simple Silver Earring
    }
    elsif (quest::istaskactivityactive(169,3)) { #Jewelcraft Collect Step 4
      quest::say("Thank you for being so helpful, $name. The Wayfarers Brotherhood has adopted a simple, but distinctive signet ring using Pale nihilite over the emblem of our brotherhood. Here are the materials you need to make them. Simply combine the Small Pale nihilite, Wayfarer Sigil and Simple Silver Ring in you Jeweler's Kit. There is a rather urgent desire to get these rings out to those that desire them, so please return them to me as quickly as you can.");
      quest::summonitem(58208,10); #Wayfarer Sigil
      quest::summonitem(58118,10); #Simple Silver Ring
    }
    else {
      quest::say("I do not need this.");
      quest::summonitem(58064); #Pale Nihilite
    }
  }
  elsif (plugin::check_handin(\%itemcount, 58068 => 1)) { #Raw Shimmering Nihilite
    quest::say("Ah, yes. Here is your Nihilite.");
    quest::summonitem(58081,2); #Shimmering Nihilite
  }
  elsif (plugin::check_handin(\%itemcount, 58107 => 4) || plugin::check_handin(\%itemcount, 58107 => 3) || plugin::check_handin(\%itemcount, 58107 => 2) || plugin::check_handin(\%itemcount, 58107 => 1)) { #Simple Pale Nihilite Pendant
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58108 => 4) || plugin::check_handin(\%itemcount, 58108 => 3) || plugin::check_handin(\%itemcount, 58108 => 2) || plugin::check_handin(\%itemcount, 58108 => 1)) { #Simple Pale Nihilite Ring
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58106 => 4) || plugin::check_handin(\%itemcount, 58106 => 3) || plugin::check_handin(\%itemcount, 58106 => 2) || plugin::check_handin(\%itemcount, 58106 => 1)) { #Simple Pale Nihilite Earring
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58209 => 4) || plugin::check_handin(\%itemcount, 58209 => 3) || plugin::check_handin(\%itemcount, 58209 => 2) || plugin::check_handin(\%itemcount, 58209 => 1)) { #Wayfarer Signet Ring
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 63838 => 2, 62481 => 1, 17912 => 1)) { #Shimmering Steel Thread x 2, Turepta Shell, Jeweler's Kit
    quest::say("Good work! Here is your new kit.");
    quest::summonitem(62480); #Reinforced Jeweler's Kit
  }
  plugin::return_items(\%itemcount);
}