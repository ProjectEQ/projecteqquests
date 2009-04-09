# Gemmed Sword Hilt
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Ah, hello there stranger. I do not often receive visitors in my workshop, what brings you here today.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4762 => 1)) {
    quest::say("Ah, a Gemmed sword hilt attached with a note from my old friend Daloran. It is a shame that I have not seen him for such a long time. Being so busy with my work has prevented me from seeing and of my family or friends, really. Alas, this hilt has a positive energy eminating from it and not destructive as Daloran feared. Please take this back to him as Im sure he awaits it.");
    quest::summonitem(4762);
    quest::targlobal("swordhilt",2,"D1",150089,$charid,150);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: katta ID: 160212 NPC: Yaeorat

