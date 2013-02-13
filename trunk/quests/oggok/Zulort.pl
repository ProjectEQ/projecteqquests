sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class == "Shaman")) { 
		$client->Message(15,"You stand in a large alcove. Next to you is a huge Ogre, with an evil grin. 'You come for training? You join us or me will smash you! I am Zulort. I train you! Read note in inventory and hand to me when ready to start!'");
  }
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Um, you. Hi.. You Shaman of War now, right? You gotta learns war and war spells. We fights all and makes the Warlord likes us. You [gonna help] or me gonna feed you fat stoopid boddie to doggies.");
  }
  if($text=~/help/i) {
    quest::say("Good. Warlord need many boddie.. I means Shamans of War.. to kill and gets killed.. no, ummm.. kill and smoosh for Him and makes Him happy. You goes show me you can smoosh tings good. Gets me four froglok tadpole fleshies for me to munchings on and me be happy.. um, He, the Warlord be so berry happy. Helping our tuff friends de Greenbloods but be watching for dem scummy Crakneks, dumb ogres dey is. No good, no our friends. Go now. Me.. er.. he waiting and hungry.");
  }
  if($text=~/bedder shaman/i) {
    quest::say("Yoo want to be bedda shaman? Them lizards in de Feerrott tink de bedda den us and bodder us wit der majiks like fleas on a dog. Kill dem and bring me, um, one of dem bags dey wear around dem necks and, um, three of dem dolls dey hold.");
  }
  if ($text=~/trades/i) {
    quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
    quest::summonitem(51121); # Tradeskill Basics Volume 1
  }
  if ($text=~/second book/i) {
    quest::say("Here is the second volume of the book you requested, may it serve you well!");
    quest::summonitem(51122); # Tradeskill Basics Volume 2
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13187 => 4)) {
    quest::say("Oh, me.. um.. Warlord BERRY happy. Berry like dese. Gimme. Uh, why is you still here? Take dis and gets more kills. You learning good, come sees me. I teaches you bout stuff. Make you [bedder shaman]. Go. He and me watching.");
    quest::summonitem(15093);
    quest::faction(295, 10);
    quest::exp(100);
  }
  elsif (plugin::check_handin(\%itemcount, 14199 => 1, 13367 => 3)) {
    quest::say("Dis good stuff! Me and Warlord happy! Wear dis symbol and he make yoo strong with majik!");
    quest::summonitem(1444);
    quest::faction(295, 10);
    quest::exp(100);
  }
  elsif (plugin::check_handin(\%itemcount, 18788 => 1)) { #Tattered Note
    quest::say("Take, take.. You now Shaman of War.. Zulort make you majik, too.  When you [gonna help] you tell Zulort. You return to me and when you stronger, I teach you many things I know, including how to start working in the various [trades].");
    quest::summonitem(13526); #Dirty Patched Fur Tunic*
		quest::ding();
		quest::faction(295, 5); # Shaman of War
		quest::exp(100);
  }
  else {
    quest::say("Me not need dis."); #text made up
    plugin::return_items(\%itemcount);
  }
}

# Quests by mystic414