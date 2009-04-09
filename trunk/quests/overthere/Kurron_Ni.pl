# Part of SK Epic 1.0

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Out of my way, stranger!  I am on a delicate mission; interfere with my search and I shall relieve you of your head! Bother me no more.");
  }
  if($text=~/mission/i) {
    $faction = $client->GetCharacterFactionLevel(342);
    if ($faction < 7) {
      quest::say("My mission is none of your concern!  Now you die, pitiful fool!");
      quest::attack("$name");
    }
    else {
      quest::say("My mission was to find a pathetic shadowknight and bring him closer to Innoruuk. You volunteered. By exercising my superior powers of persuasion, I have now taken from you a fine suit of armor and enough coin to ensure that I will be sleeping neither soberly nor alone for quite some time! Now I ask you, worthy shadowknight, do you not feel the fires of hatred coursing through your veins like never before? That is the very reward I spoke of! You have been brought closer to my master. My mission is complete! You foolish excuse for a dark knight, I shall take your head and tell all of your generous donation to the mighty Teir'Dal rogues!");
      quest::attack("$name");
    }
  }
  if ($text=~/seek/i) {
    quest::say("I have traveled here in hopes of finding a soul worthy of assisting me in completing my mission.");
  }
  if ($text=~/i am worthy/i) {
    quest::say("I doubt it, but I have been wrong before. Before I share with you the details of my mission, however, you must first prove your worthiness. Agreed?");
  }
  if($text=~/agreed/i) {
    quest::say("Very well then, my new friend. I have an acquaintance that stands in need of three pieces of Darkforge Armor. He requires the breast, greaves and helm to complete his set. I also must pay back a loan that has come due in the amount of 900 platinum. Return this to me and I shall share with you my dark mission, and the immeasurable reward that will be earned at its completion. Show your face here without fulfilling my request and I will offer you on the altar to Innoruuk himself. Be off!");
  }
}

sub EVENT_ITEM {
  if (($itemcount{3141} == 1) && ($itemcount{3145} == 1) && ($itemcount{3140} == 1 ) && ($platinum>=900)) {
    quest::say("Well done, $name, I honestly didn't expect to see you again. Yes, yes, this is perfect! My mission is nearly complete!");
    quest::faction(342,7);
    $npc->AddItem(18099, 1);
  }
}

# Quest by mystic414

