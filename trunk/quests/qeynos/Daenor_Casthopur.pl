#BeginFile: Daenor_Casthopur.pl
#Quest for South Qeynos - Daenor casthopur: Note to Neclo

sub EVENT_SAY {
  if($faction<=5) { #Indifferent or better
    if($text=~/hail/i) {
      quest::say("Ah, hello there, $name, and welcome to the Hall of Sorcery! I'm Daenor, a wizard of the Order of Three. I can help you practice your skills and learn some new ones.");
    }
    if($text=~/Neclo/i) {
      quest::say("Neclo Rheslar is an old friend of mine. Right now, he's out working in the Qeynos Hills. In fact, if you have some free time, you should go out and meet him. Here, if you go, take this note to him for me. Thanks, friend.");
      quest::summonitem(18823); #Note to Neclo
    }
  }
  else {
    quest::say("I am busy right now. Come back later."); #Added only for cosmetics
  }
}

sub EVENT_ITEM {
  quest::say("I have no need of this, $name.");
  plugin::return_items(\%itemcount);
}
#EndFile: Daenor_Casthopur.pl