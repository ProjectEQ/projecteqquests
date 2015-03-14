sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("What is it, mortal? Can you not leave me alone to mourn my [loss]?")
  }
  if ($text=~/loss/i) {
    quest::say("The loss of all my [work]!' Silzok lets out a wail that echoes throughout the caverns.");
  }
  if ($text=~/what work/i) {
    quest::say("I do not know why I am telling you this, but the Overlord, concerned with the recent opening of this part of Chardok, had commissioned me to create a means to animate the ultimate golem to protect the Royal Family. I had always had a knack with golem creation, but it was a most difficult task to create a golem of the power that the Overlord wanted due to their physiology. After much intense research I had finally documented a way to create what I think could be the most powerful golem ever created. It was all detailed in my [tome].");
  }
if ($text=~/what tome/i) {
  quest::say("A tome of great power. The ultimate guide to golem creation! Before I could present the tome to the Overlord, my foolish [brother] had to ruin everything! I curse him!");
  }
  if ($text=~/what brother/i) {
    quest::say("My brother, Gaodon. He has always been jealous of my superior intellect. However what he lacked in intelligence he more than made up for with malice. When he found out about this project he flew into a rage, claiming that the Overlord should have let him research the golem. However, my brother did not have the slightest notion how to create a golem. I should have known that he had some sort of [plan] to steal my tome.");
  }
  if ($text=~/what plan/i) {
  quest::say("Whilst I was resting in my chambers, he made his way inside and found where I kept the tome. I had only the simplest of wards activated to protect it. That was foolish of me. My brother dispelled the wards and fled with the tome. I arose just in time to see him run out of my chambers. I gave chase. We ran through the tunnels for some time before Gaodon made a [fatal mistake].");
  }
  if ($text=~/what fatal mistake/i) {
  quest::say("A mistake made even more fatal considering my brother and I are no longer composed of living flesh, but rotting bone. Gaodon had broken through the fence leading to the breeding pens of the Royal Family's most vicious chokidai. Gaodon was promptly torn limb from limb. A fitting end for him! However the chokidai also got hold of my tome. They began to tear it apart. Dodging their gnashing teeth, I managed to recover the remains of the tome. However some of the pages were missing. The chokidai, seeing that their pen was now open, fled into the tunnels. As the chokidai escaped, I noticed that some of them had pages from my tome dangling from their maws. This happened recently so there may still be [hope] in recovering the pages.");
 }
 if ($text=~/what hope/i) {
   quest::say("The chokidai should still be somewhere within these Halls, so finding the pages could be possible. I do not think I can re-write the missing pages, as they came to me in a moment of inspiration. The Overlord is not a patient being, so if you could make it your priority to [search for the missing pages], I will make sure you are rewarded.");
 }
 if ($text=~/I will search/i) {
 quest::say("Luckily there are only four missing pages. The pages are known as the page of clay, the page of decay, the page of dust, and the page of stone. Once you have all four pages, hand them to me and I will reward you!");
 }
 sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55189 => 1, 55187 => 1, 55190 =>1, 55188 =>1)) {#Pages Handin
   quest::say("I cannot believe you have found the pages! Let me examine them.' Silzok carefully places the tattered pages back into his tome. 'They are little damages, but mostly salvageable. Stand back, I will wait no longer to use the power of this tome!"); 
   quest::emote("Silzok reads from the tome, uttering in a strange tongue. The dust below your feet begins to stir, forming a large whirlwind. Dirt and stones float from the floor into the ever-glowing cyclone. Soon the noise from the swirling maelstorm grows deafeningly loud. As you stare in awe, the ground shakes underneath your feet as a dark form steps out of the swirling mass of debris. It is a large golem, and it doesn't look happy. Silzok barks a command to the newly formed golem. The huge creature completely ignore Silzok and begins to attack!");
   quest::say("This is all [wrong]!");
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(277115,0,0,$x,$y+5,$z,$h) 
  } 
  if ($text=~/what is wrong/i) {
  quest::say("The golem is not following my orders! You must stop it, lest it destroy us all! Destroy it and give me its heart!");
  }
  if (plugin::check_handin(\%itemcount,  55191=> 1)) {
    quest::say("So my creation has failed. Perhaps I am not the master of golem creation that I thought I was. This golem could have destroyed the Royal Family whould I have summoned it in front of them. I will destroy its heart and this tome so that this shall never happen again. Here is your reward as promised. Now leave me.");
    quest::summonitem(55192);
  }
 }
}