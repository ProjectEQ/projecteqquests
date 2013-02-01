# Part of SK Epic 1.0

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Ah, you do not possess the heart of an innocent. Be gone with you!");
  }
  if ($text=~/heart of an innocent/i) {
    quest::say("What's that? Heart of the Innocent, you say?! Ages, it has been, since I was last asked that. The Heart of the Innocent is an item of great power. Few are they who have ever commanded the dark magic of such an object. It is the bound soul of a pure mortal, rare indeed. Take this hollow gem, and combine with it the heart of one who is pure. If your hand is steady and your mind is clear, you shall have what you seek.");
    quest::summonitem(17051);
  }
}

# Quest by mystic414

