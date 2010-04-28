#zone - tutorialb
#quest - Busted Locks, Goblin Treachery

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(21,2)) {
      quest::say("I'm glad you got dat over and done with. Now we can focus our attention on da kobolds demselves. Here's an invisibility potion we captured from one of Rookfynn's apprentices. May it keep you safe, fr'en'.");
    }
    else{
      quest::say("Shhhh. We just swum up thro' da secret tunnel. Not even koboldies know it. Lead 'em back 'ere and we'll bash 'em good.");  
      quest::taskselector(20, 21);
    }
  }
}

sub EVENT_TASKACCEPTED {
  if($task_id == "20") {
    quest::say("Most of da slaves who limp back ta dis cavern are still bound in chains. Our blades are dull from breaking all da kobolds bonds. We needs ya ta find da kobold locksmith and steals his key ring. Da smith iz an albino kobold dat spends most of 'is time near da Gloomingdeep Jail");
  }
  if($task_id == "21") {
    quest::say("When da revolt first began, we thought da goblins slaves were wit' us. Turns out da goblins' former leader, a shaman named Rookfynn, secretly told hiz kindred to help da Gloomingdeep kobolds suppress our revolt.");
    quest::say("Rookfynn hopes to gain favor with the koboldies for his loyalty. Slay Rookfynn and ten of his treacherous kindred. Da only thing worse than a goblin is a goblin loyal to a slave master.");
    quest::say("The goblins are busy excavating at Dig Site One. Rookfynn is likely wit' them.");
    quest::say("Good luck, fr'en'.");
  }
}