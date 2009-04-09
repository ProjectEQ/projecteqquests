# Bard Reports & Aenia and Behroe
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Ah, greetings, $name!  How are you this evening?  Hopefully, you are faring much better than I..  I'm stuck on the night watch here, and never get to see my lovely [Aenia].  Ah..  she is so sweet..  I wrote her this beautiful [ballad], but I fear she may never hear it.");
  }
  if ($text=~/aenia/i) {
    quest::say("Aenia lives in North Qeynos in a little blue house near the Temple of Life with her overprotective father.  Last time he caught me there, he nearly killed me!");
  }
  if ($text=~/ballad/i) {
    quest::say("I wrote this little song for my dearest Aenia, but I can't sing it to her because I'm stuck here on watch duty.  You have a nice voice, $name, maybe you could go and sing my song to her for me, huh?  Just make sure you don't sing to Aenia when her father's around, 'cause like I said, he's already tried to kill me for seeing her.");
    quest::summonitem(18026);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18027 => 1)) {
    quest::say("Ah, thank you, kind $name.  You've made two foolish lovebirds very happy.  Please, take this..  Though it is not much, it will help keep you warm on those chilly Karana nights.  It is very good to have a friend such as yourself, and I will one day repay you for your kindness and generosity.");
  }
  elsif (plugin::check_handin(\%itemcount, 18021 => 1)) {
    quest::emote("yawns and says, 'Oh, report time already again?  Yeah, here ya go, $name.  Be careful around here at night, I've been seeing some rough looking characters lurking about.");
    quest::summonitem(18023);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::exp(250);
  quest::faction(192,2); #league of antonican bards
  quest::faction(184,2); #knights of truth
  quest::faction(135,2); #guards of qeynos
  quest::faction(273,-2); #ring of scale
  quest::faction(207,-2); #mayong mistmoore
}

# EOF zone: qeynos ID: 1000 NPC: Behroe_Dlexon

