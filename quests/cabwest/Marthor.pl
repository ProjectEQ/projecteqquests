#Marthor is a former pupil of Supreme Master Tynn, and helps us along on our Whistling Fists quest. Buying him 4 Trog Brews (sold in East Cabilis) will get him to open up to us.

sub EVENT_SPAWN {
$Brew = 0;
}

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("hiccups and breathes drunken breath in your face saying, Leave me be, can't you see that I am meditating or something?");
 }
 elsif($text=~/master tynn/i && $Brew == 1){
  quest::say("Supreme Master Tynn was the only one that has even seen the weapon. I do not know its origin. I tell you though, you would need to be as powerful as he was to be able to wield the weapon. Only an Iksar of the last rung would be able to use it, come back and show me you have earned your Tynnonium Shackle and I will discuss with you what I know.");
 }
 elsif($text=~/tynnonium shackle/i && $Brew == 1){
  quest::say("Veltar was one with the ways of Tynn. He did return to Cabilis, I know you have rescued him from his cell. He has traveled afar to clear his mind of his torture in the mines. He did not say where his travels would take him. You will have to find him once more and ask him about the Tynnonium Shackle he still wears.");
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 8348 => 4)){
  quest::say("Ha! How did you know my favorite drink? Master Rinmark told you? That crazy old monk spends his days sitting on that mountain in Timorous Deep doesn't he? And they call me a drunkard! Anyhow, I bet he told you about the Whistling Fists. I have never seen them myself, and have only heard legend passed down by [Master Tynn].");
  quest::ding();
  quest::settimer("Brew",300);
  $Brew = 1;
 }
 elsif (plugin::check_handin(\%itemcount, 4199 => 1)){
  quest::say("Ah, a monk of the final rung. You should seek Gandan Tailfist in Charasis. He, too, was seeking for a way to advance even further."); #Made this up, unable to find actual text
  quest::summonitem(4199);
  quest::ding();
 }
 else{ 
 plugin::return_items(\%itemcount);
 quest::say("I don't want that."); #Made this up
 }
}

sub EVENT_TIMER {
 if($timer eq "Brew") {
  quest::stoptimer("Brew");
  $Brew = 0;
 }
}

#Submitted by: Jim Mills