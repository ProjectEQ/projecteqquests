# Aenia and Behroe
#

sub EVENT_SPAWN {
  $npc->SetAppearance(1);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Why, hello there!  I'm Aenia, daughter of Dranom.  It's such a bore just sitting around here all day and night.  My father is soooooo overprotective! He never lets me go out and have any fun at all.  And he's so mean to my poor [boyfriend]!");
  }
  if ($text=~/boyfriend/i) {
    quest::say("My boyfriend's name is Behroe Dlexon.  He is so dreamy..  <sigh>..  But, I haven't been able to see him lately.  He works nights down at the docks, and with my father here all day, we just can't seem to get together.  Oh, how I wish I could speak with him..");
  }
  if ($text=~/Oh beautiful thornless rose, growing in the briar patch. Oh glistening crimson rose, you would be such a catch. Oh beautiful thornless rose, your essence has no match. Oh glistening crimson rose, your love i must snatch./i) {
    quest::say("Oh..   My Behroe is so sweet.  Oh, how I long to see him.  Please, oh please, kind Kajigger, can you do me but one favor? Here, quickly, before my father returns.  Take this letter to my love, Behroe.  I have no money to offer you, but as you are a friend of his, so are you a friend of mine, and I will not forget your good deeds, Kajigger.  Thank you and be safe.");
    quest::summonitem(18027);
  }
}

# EOF zone: qeynos2 ID: 2096 NPC: Aenia_Ghenson

