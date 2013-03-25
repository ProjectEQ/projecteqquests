# white paper portion of enchanter epic quest lead-in

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("slowly lifts her head.");
    quest::say("Have you brought any writing materials for me? The last few supplies I had were stolen.");
  }
  if ($text=~/writing materials/i) {
    quest::say("A passing illusionist gave me some enchanted writing materials. He said they would help inspire me to capture my mind's images on paper. If you would just be so kind as to bring me plain old paper and a quill from Qeynos, I can get back to writing.");
  }
  if ($text=~/paper/i) {
    quest::say("I don't know who might be selling those these days. Just ask around. I am sure someone will know.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13063 => 1, 13051 => 1)) {
    quest::emote("gives you a hug. 'Thank you so much. I did some cleaning after you left and found this behind a barrel. It may have been left behind by the person who took my materials. You can have it.'");
    quest::summonitem(12100);
    quest::spawn2(12172,0,0,-11570,878,14,135);
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: qey2hh1 ID: 12074 NPC: Chrislin_Baker

