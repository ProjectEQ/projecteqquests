sub EVENT_SAY {
  if ($text=~/hail/i) {#Need correct text
    quest::say("Well met $name, if you have some time on your hands I have a [proposition] for you");
  }
  if ($text=~/proposition/i) {
    quest::say("Well, you see I am a smith, and I can make almost anything that you could want, however I have heard of a weapon of special power that I would like to try my skills on, however I lack some of the [materials].  If you gather them for me I can forge the weapon and will give it to you for your assistance.");
  }
  if ($text=~/materials/i) {
    quest::say("The items that I require to be gathered are three bars of gold, but they must be enchanted.  The other item that I require are the plans for this weapon.  I have heard rumor that there is one of large stature in the Southern Desert of Ro that may know where they are.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12206 => 1, 16506 => 3 )) {
    quest::say("Excellent, now let me get to work. There we go, here is the weapon that I promised you.");
    quest::exp(1500);
    quest::summonitem(5366);
    quest::faction( 92, 30);
    quest::faction( 99, 30);
    quest::faction( 8, 30);
    quest::faction( 174, 30);
  }
}