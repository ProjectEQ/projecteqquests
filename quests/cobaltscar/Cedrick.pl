sub EVENT_SAY {
 if($text=~/hail/i){ 
  # Monk Epic 1.5/2.0 (Prequest)
  quest::say("So you wish to challenge me, eh? Why else would you be here bearing the Sign of Acceptance. It is your own funeral though. If you still wish to [prove your worth] and ascend to the next level I am ready.");
  }
 elsif($text=~/i will prove my worth/i){ 
  # Monk Epic 1.5/2.0 (Prequest)
  quest::say("I didnt know slime could speak common.. go back to the sewer before I lose my temper.");
  quest::attack($name);  
 }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("You have proven to be successful. Go now and continue your journey.");
 }

# NpcID: 00000 - NpcName: Cedrick - Zone: cobaltscar - Loc: (-970, 1185)
# Race: 1 - HelmTexture: 0 - Texture: 4 - Gender: 0
# AddToDropTable - ItemID: 48100 - ItemName: Seal of Cedrick - DropRate: 100%
# End of File
