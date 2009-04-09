sub EVENT_SAY {
 if($text =~ /Hail/i) {
    quest::say("Why, hello there, $name! I am Jusean, loyal member of the League of Antonican Bards. You look like the reliable sort, maybe you could help me out for a bit, huh? It's about time for our field agents to turn in their [watch reports], and I need someone to go pick them up for me."); 
 }
 if ($text=~/watch reports/i) {
   quest::say("We always have someone stationed on watch duty at the two main entries to the city to keep an eye on what is happening around Qeynos. We have [Anehan and Behroe] down at the docks, and [Leanon and Quinon] working the North Gate.");
 }
 if ($text=~/Anehan and Behroe/i) {
   quest::say("Here, if you take this to Anehan or Behroe down at the docks, and then return their report to me as soon as you can, I will give you a small reward.");
   quest::summonitem(18021);
 }
 if ($text=~/Leanon and Quinon/i) {
   quest::say("Leanon is in charge of the day shift at the North Gates of Qeynos, and Quinon is stationed there during the night. Please take this to either of them, have them fill it out, and then return it to me as soon as you can.");
   quest::summonitem(18020);
 }
 
 if($text =~ /Who is your father/i) {
        quest::say("My father Heltin disappeared while on a voyage aboard the Sea King. A group of troll pirates attacked and boarded the ship. Ginleen Harltop and the steel warriors traveling with them managed to fight them off, but took many casualties. My father was one of the bodies that was not accounted for. They found his song book floating in the water near the boat. The red water soaked through it's pages told more of the story then I ever care to know.");
}
 }

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 59023 => 1)) {
    #aria of acestiscisitmishm
    quest::emote("peers intently through several pages of the book, mumbling quietly under his breath as he does. His gaze falls on one page in particular as his eyes begin to widen as they pass over each line. He begins scribbling frantically across the pages in between the lines.");
    quest::say("Take this, who ever wrote it was obviously a student of my father. The style is unmistakable. I've written some notes up for you so it should be easier to read. Take this back to Kardin and he'll teach it to you.");
    quest::summonitem("59024");
    quest::exp(2500);
    quest::faction(192,10); #league of antonican bards
    quest::faction(184,10); #knights of truth
    quest::faction(135,10); #guards of qeynos
    quest::faction(273,-30); #ring of scale
    quest::faction(207,-30); #mayong mistmoore
  }
  elsif (plugin::check_handin(\%itemcount, 59042 => 1)) {
    #aria of innocence
    quest::say("My father gave you this just before he died?! So he's been alive all these years in the mines of Brokenskull Rock. What a bitter end for such a talented minstrel. I will transcribe this song for you $name, but you must promise to use it to help those like my father, trapped in an unnatural insanity. I pray that you will not fall to the same fate.");
    quest::summonitem("59001");
    quest::exp(2500);
    quest::faction(192,10); #league of antonican bards
    quest::faction(184,10); #knights of truth
    quest::faction(135,10); #guards of qeynos
    quest::faction(273,-30); #ring of scale
    quest::faction(207,-30); #mayong mistmoore
  }
  if (plugin::check_handin(\%itemcount, 18023 =>1 )) {
    quest::say("Good job. I hope Behroe wasn't sleeping on the job again when you talked to him. Hmm, the docks seem to be a hotbed of activity after the sun goes down. Thanks for your quick work, $name, here's a little cash for your efforts.");
    quest::exp(250);
    quest::faction(192,3); #league of antonican bards
    quest::faction(184,3); #knights of truth
    quest::faction(135,3); #guards of qeynos
    quest::faction(273,-3); #ring of scale
    quest::faction(207,-3); #mayong mistmoore
    quest::givecash(10,2,0,0);
  }
  if (plugin::check_handin(\%itemcount, 18024 =>1 )) {
    quest::say("Ah, very good. I'll make sure to note Leanon's report in our journals. Here's a little something for your troubles, $name.");
    quest::exp(250);
    quest::faction(192,3); #league of antonican bards
    quest::faction(184,3); #knights of truth
    quest::faction(135,3); #guards of qeynos
    quest::faction(273,-3); #ring of scale
    quest::faction(207,-3); #mayong mistmoore
    quest::givecash(10,2,0,0);
  }
  if (plugin::check_handin(\%itemcount, 18022 =>1 )) {
    quest::say("Ah, very good. I'll make sure to note Anehan's report in our journals. Here's a little something for your troubles, $name."); #not live text
    quest::exp(250);
    quest::faction(192,3); #league of antonican bards
    quest::faction(184,3); #knights of truth
    quest::faction(135,3); #guards of qeynos
    quest::faction(273,-3); #ring of scale
    quest::faction(207,-3); #mayong mistmoore
    quest::givecash(10,2,0,0);
  }
  if (plugin::check_handin(\%itemcount, 18025 =>1 )) {
    quest::say("Ah, very good. I'll make sure to note Quinon's report in our journals. Here's a little something for your troubles, $name."); #not live text
    quest::exp(250);
    quest::faction(192,3); #league of antonican bards
    quest::faction(184,3); #knights of truth
    quest::faction(135,3); #guards of qeynos
    quest::faction(273,-3); #ring of scale
    quest::faction(207,-3); #mayong mistmoore
    quest::givecash(10,2,0,0);
  }
  
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Bard');
    plugin::return_items(\%itemcount);
  }
}

