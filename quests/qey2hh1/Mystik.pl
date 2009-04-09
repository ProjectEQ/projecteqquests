sub EVENT_SAY {
 if($text=~/hail/i){
  # Monk Epic 1.5/2.0 (Prequest)
  quest::say("I see you bear the Sign of Acceptance. So you believe you are strong enough to accomplish all that is asked of you? If you stand true during this [test] you will find all you seek.");
 }
 if($text=~/i am ready for the test/i){ 
  # Monk Epic 1.5/2.0 (Prequest)
  quest::say("In this test you will have to face me and prove that you have the heart to succeed. I hope you have brought strong allies to accompany you for you shall need them. We shall begin as soon as you are [ready to start].");
 }
 if($text=~/i am ready to start/i){ 
  # Monk Epic 1.5/2.0 (Prequest)
  quest::say("I didnt know slime could speak common.. go back to the sewer before I lose my temper.");
  quest::attack($name);
 }
}

sub EVENT_DEATH {
  quest::say("You have proven to be successful. Go now and continue your journey.");
}


#NpcID: 00000 - NpcName: Mystik - Zone: westkarana - Loc: (1370, -7350)
#Race: 1 - HelmTexture: 0 - Texture: 4 - Gender: 0
#AddToDropTable, ItemID: 48101 ItemName: Seal of Mystik DropRate: 100%
#End of File