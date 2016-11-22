#Quest file for Dulak's Harbor - Quigli (225231)

#This is the non-attackable version. It should only trigger for the monk ready for this fight after killing Wygrish.

sub EVENT_SAY {
  if ($client->GetGlobal("monk_epic") ==4) { #need to add check for Wygrish kill
    if ($text=~/hail/i) {
      quest::say("I have nothing for you unless say you have the  [" . quest::saylink("right price") . "] . . .");
    }
    if ($text=~/right price/i) {
      quest::say("I have just placed my 'ands on this 'ere book and I'd be willin to part with it for a mighty price else you could try and [" . quest::saylink("defeat") . "] me crew.");
    }
    if ($text=~/defeat/i) {
      quest::say("Good. . .good. I 'aven't 'ad much change to stretch me arms in a while.");
	$npc->SetSpecialAbility(19,0);
	$npc->SetSpecialAbility(20,0);
	$npc->SetSpecialAbility(21,0);
	$npc->SetSpecialAbility(24,0);
	$npc->SetSpecialAbility(25,0);
	$npc->AddToHateList($client, 1);
	quest::spawn2(203433,0,0,$x,$y+5,$z,$h);
	quest::spawn2(203433,0,0,$x,$y-5,$z,$h);
	quest::spawn2(203433,0,0,$x-10,$y+5,$z,$h);
	quest::spawn2(203433,0,0,$x+10,$y-5,$z,$h);	
    }
  }
  else {
    quest::say("Go away!");
  }
}
