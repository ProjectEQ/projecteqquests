sub EVENT_SAY {
  if (($langid == 22) && ($client->GetLanguageSkill(22) == 100)) { #Elder Dragon
    if ($text=~/hail/i) {
      quest::say("'Mortal. . .' He flaps his wings and a talon taps against the floor, making a sharp noise in the silence. 'Mortal. . . time is short. If you can understand me, perhaps you can help me. I need my grimoire, my tome, the source of my power. With help from the [distant ones], I can make my escape.'", 22); #Elder Dragon
    }
    if ($text=~/distant ones/i) {
      quest::say("My learning is one of the eldest. . . perhaps. . . in all existence. From the depths of Limbo can I convene with them. . . they, the distant ones. My bidding can they fulfill, for short times. I need my grimoire! My grimoire, hear me, $race! Fetch it and I can reward you with riches beyond your wildest reckoning! Hurry!", 22); #Elder Dragon
    }
  }
  else {
    quest::emote("does not appear to understand you.");
  }
}