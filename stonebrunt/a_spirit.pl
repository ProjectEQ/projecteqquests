# items: 2100, 2297
sub EVENT_SAY {
  if ($faction > 5) {
    plugin::reject_say();
  }
  elsif ($faction > 4) {
    quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
  }
  elsif ($text=~/hail/i) {
    quest::emote("flares brightly as you attempt to speak with it. By listening very closely you're brely able to make out it's frantic whispering. It keep refering to one of the Kejekans, one that apparently slew him as he attempted to cleanse the land of them. It wants nothing more than to destroy who killed him, but it cannot in this [form].");
  }
  elsif ($text=~/form/i) {
    quest::emote("flares brightly again as it explains there isn't enough time for it to explain. It then begins to whisper again, telling you that it commands you the aid it in it's revenge. You make out, through the barely audible whispering, that if you do help it, you will be rewarded.");
  }
  elsif ($text=~/revenge/i) {
    quest::emote("whispers that he will need to become whole again before he can defeat the fool animal that slew him. The spirit admits to one mistake before coming here to wipe the Kejekans. In an earlier campaign, he lost a very powerful weapon. That weapon would enable him to take on a form likened to his former self. If you return this weapon to the spirit, and then help him to defeat his enemy, the reward will be yours.");
  }
  elsif ($text=~/campaign/i) {
    quest::emote("seems hesitant to go into details and reacts harshly when asked further. He does say that he went to enlist an army of lesser beings to do it's bidding, but they refused. The spirit scoffs and says they believed the lord they shared favored them more than it. It goes on, explaining their utter foolishness and eventual demise in great detail.");
  }
}

sub EVENT_ITEM {
  if ($faction < 5 && plugin::check_handin(\%itemcount, 2100 => 1)) { #Grimy Lance
    # Make sure we face target so the spawned NPC also faces target.
    $npc->FaceTarget($client);
    quest::settimer("turn", 2);
    quest::say("Yes! The lance.");
    quest::emote("begins to glow as it draws power from the lance, which now floats in mid air next to the spirit. The form of the spirit expands and takes on a humanoid shape. The air itself then seems to condense about the spirit as bits of matter appear within the glowing form. The bits soon take the shape of bones and ropes of muscle. Within minutes, an emaciated Erudite male stands before you. Despite his frail appearance, he stands upright and strong, a fierce red light burning in his eyes.");
    quest::exp(10000);
    quest::summonitem(2297); #Idol of Fear
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
    quest::stoptimer("turn");
    quest::unique_spawn(100221,323,0,-70,474,509,$h); #Ridossan_the_Unliving
    quest::depop_withtimer();
}
