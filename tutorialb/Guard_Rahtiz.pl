#zone - tutorialb
#quest - Spider Tamer Gugan
#site3op

sub EVENT_SAY {
   if (quest::istaskactivityactive(16,2)){
      quest::say("Well done! If you collected any Gloomingdeep Silk, be sure to give it to Vahlara. She can use it to make bandages for the other wounded slaves. Here are some coins I found on a dead kobold. Good work, my friend!");
   }
   else{
      if ($text=~ /Hail/i){
         quest::say("Greetings, $name. We're glad you found your way to our camp. We can use all the help we can get!");   
         quest::say("The Gloomingdeep spider tamer is able to brew anti-venom from a rare flower that grows in gloomingdeep. If we had this flower,we may be able to use it to save the lives of our comardes.");
         quest::updatetaskactivity(23,0);
      }
   }
   quest::taskselector(16, 17, 18);
}

sub EVENT_TASKACCEPTED {
        if($task_id == "16") {
                quest::say("The kobolds are raising the Gloomfang Spiders to guard these mines. Queen Gloomfang's latest brood recently tore free from their cocoons and now the southern caves are crawling with giant spider.");
      quest::say("Get in there and clear out those blasted things!");
        }
   if($task_id == "17") {
      quest::say("The vermin infesting these tunnels threaten our scarce provisions. If you want to help our revolt, start by clearing the tunnel beyond of rats and bats. Speak with Vahlara when you've finished your hunt and she will reward you with a pair of stitched leggings. They're not much, but they're all we can spare right now.");
   } 
   if($task_id == "18") {
      quest::say("The kobolds will be charging down this passage here. I'll only have time to fire a few arrows before they close to melee. Venture into the tunnels beyond and bring me one more arrow, it might just save my life. The kobolds typically leave extras ammunition in the barrels throughout the mines. Break a few of them open and you'll likely find some arrows we can use.");
   }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 54604 => 1)) {
          quest::say("Well done $name! We shall start brewing right away.");
          quest::exp(25);
     }
   elsif(plugin::check_handin(\%itemcount, 8500 => 1)) {
      if(quest::istaskactivityactive(18,0)) {
         quest::updatetaskactivity(18,0);
         if(quest::istaskactivityactive(18,1)) {
            quest::say("Nice work, I'm sure the others will make good use of these arrows. I found this quiver stashed behind some boxes while out on patrol. I can't hit the wide end of an ogre with a bow, but maybe you can make better use of it.");
            quest::updatetaskactivity(18,1);
         }   
      }
   }
   plugin::return_items(\%itemcount);
}