#zone - tutorialb
#quest - Busted Locks

sub EVENT_SAY {
      if ($text=~ /Hail/i){
         quest::say("Shhhh. We just swum up thro' da secret tunnel. Not even koboldies know it. Lead 'em back 'ere and we'll bash 'em good.");   
   quest::taskselector(20);
 }
}

sub EVENT_TASKACCEPTED {
        if($task_id == "20") {
                quest::say("Most of da slaves who limp back ta dis cavern are still bound in chains. Our blades are dull from breaking all da kobolds bonds. We needs ya ta find da kobold locksmith and steals his key ring. Da smith iz an albino kobold dat spends most of 'is time near da Gloomingdeep Jail");
        }
}

sub EVENT_ITEM {
          quest::say("I don't need this."); #text made up
          plugin::return_items(\%itemcount);
     }