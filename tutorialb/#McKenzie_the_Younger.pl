sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (!quest::istaskcompleted(8505) && !quest::istaskactive(8505)) { #task: Kickin' Things Up A Notch - Augmentations
      quest::say("Waaaagh! Oh! Ye gave me quite the start there, friend. I thought one of those blasted kobolds had snuck up on me. I nearly even chipped the [" . quest::saylink("augmentation") . "] I just found.");
      quest::assigntask(8505); #Task: Kickin' Things Up A Notch - Augmentations
    }
    elsif (quest::istaskactivityactive(8505, 1) && !$client->GetInventory()->HasAugmentEquippedByID(54696)) { #Task: Kickin' Things Up A Notch - Augmentations, Item: Steatite Fragment
      quest::say("Hmm, that doesn't look quite right. Ye need ta put the augment inta your weapon - and don't forget ta re-equip yourr weapon afterwards. We wouldn't want ta see ye try facing those kobolds without that, now would we?!");
    }
    elsif (quest::istaskactivityactive(8505, 1) && $client->GetInventory()->HasAugmentEquippedByID(54696)) { #Task: Kickin' Things Up A Notch - Augmentations, Item: Steatite Fragment
      quest::say("Aye, a fine job, ye did, friend. Give those kobolds a good thrashin' for me!");
      quest::updatetaskactivity(8505, 1); #Task: Kickin' Things Up A Notch - Augmentations
      if (quest::istaskactivityactive(1448, 16)) {
        quest::updatetaskactivity(1448, 16); #Task: Basic Training
      }
    }
    elsif (quest::istaskcompleted(8505) && !plugin::check_hasitem($client, 54696)) { #Task: Kickin' Things Up A Notch - Augmentations, Item: Steatite Fragment
      quest::say("Ach! Don't tell me ye lost your augmentation already?! I'll give ye another, but take care now; these things are hard to come by. I can't dig too much for these, for fear o' bringin' the ceilin' down on our own heads!");
      quest::summonitem(54696); #Steatite Fragment
    }
    elsif (quest::istaskcompleted(8505)) { #Task: Kickin' Things Up A Notch - Augmentations
      quest::say("Ach! It's good ta see you're still in one piece! I was a bit worried about how you'd do when I first met ye, but I guess you're tougher than ye, look after all!");
    }
  }
  if ($text=~/augmentation/i) {
    quest::say("What's that? Ye want ta learn about augmentations, ye say? Hmm, I guess I could give ye a quick history [" . quest::saylink("lesson") . "].");
  }
  if ($text=~/lesson/i) {
    quest::say("As my old man once told me...' He starts to ramble monotonously about his father's friend, '*blahblah* so Morden's cleanin' his fingernail with his dagger when it slipped... *blah* blood everywhere... *blah* did he learn his lesson? No! *blahblah* scratching this little gemstone, with his dagger when it merged! *blah* power... *blahblah * and - Hey! Are ye [" . quest::saylink("listenin") . "]?!");
  }
  if ($text=~/listenin/i) {
    if (quest::istaskactivityactive(8505, 0) && !plugin::check_hasitem($client, 54696)) { #Task: Kickin' Things Up A Notch - Augmentations, Item: Steatite Fragment
      quest::say("Ok, forget the history for now. See that little stone I just gave ye? That's an augment. If ye [" . quest::saylink("embed") . "] it in a weapon or a piece o' armor, it can make that item more powerful. Mind, ye can't put an augment just anywhere. Ye need ta look at your armor and make sure the augment'll fit properly. If ye examine it, ye'll see what type o' items ye can attach it to.");
      quest::summonitem(54696); #Steatite Fragment
    }
    else {
      quest::emote("scratches his head, 'Yer a funny one. What're ye going on about?'");
    }
  }
  if ($text=~/embed/i) {
    if (quest::istaskactivityactive(8505, 0)) {
      quest::updatetaskactivity(8505, 0); #Task: Kickin' Things Up A Notch - Augmentations
    }
    quest::popup("Embedding an Augmentation", "1. Right-click on your weapon and hold for a few seconds to open its description window.<br><br>2. Pick up your augmentation, and place it in the empty box next to the slot type which matches your augmentation: slot type 4 (Weapon : General). The text next to an empty slot will turn orange when you pick up an augmentation which can fit into that slot, which makes it easy to identify.<br><br>3. A pop-up box will appear, asking you to confirm if you would like to attach your augmentation to your weapon. Select 'Yes' to approve this action, and embed your augmentation to your weapon.", 11);
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
