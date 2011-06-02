# Nioti's Predicament
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Yes, what is it? I am a bit occupied right now with quite the [predicament]. I swear things keep getting worse and worse around here.")  
  }
  if ($text=~/predicament/i) {
    quest::say("Well simply put, we are overwhelmed with repairs. While we made it safely to the shores of the new continent, we suffered some damage to the ship. To make matters worse, we are running out of supplies to complete the needed repairs and I don't have time to return to the mainland to find more. I sure could use some [assistance]. I knew we should have never come here.")  
  }
  if ($text=~/assistance/i) {
    quest::say("Well I cannot really believe someone would want to help me, but if you really could help, that would be great. I would need you to find four Branches of Sylvan Oak and return them to me. If you do this for me, I will find some way to reward you for your efforts.")  
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19140 => 4)) { # Branch of Sylvian Oak
    quest::say("I don't think you would return. I appreciate your assistance. I hate to do this, but before I can convince my foreman to give you a reward, I am going to need to ask you to help me again. According to another adventurer that passed through here the other day, there is a golem graveyard of sorts in a temple somewhere on this continent. If you could find this place and gather one clay golem part that would help us greatly with repairs. Why do we need these golem parts you ask? I have no idea. Grumpy, our foreman said we needed them for some sort of repairs. Oh yeah, take this badge. It identifies you as part of the ship's maintenance crew. Just hand the badge to me when you hand in the golem parts.");  
    quest::exp(50000);
    quest::summonitem(55560); # Worker's Badge - Number one
  }
  elsif (plugin::check_handin(\%itemcount, 55566 => 1, 55560 => 1)) { # Clay golem parts and workers badge - number one
    quest::say("Thanks. I hope that wasn't too much trouble. Seems we need more help. Grumby just informed me that some parts on the bridge have already been damaged by rust. That doesnt sound good at all. We will need your help to get some sort of anti rust agent. What? Hey, dont get mad at me. I am sorry I keep asking for help, but I am just following Grumby's orders. There is a gnomish tinker in Ak'anon named Gilipus that might have something to help us. Go there and hand him this note along with your badge so he knows you are working for Grumby. I promise to reward you for your time when you are done helping us. Take your badge back and give it to me again when you hand in the anti-rusting agent."); 
    quest::exp(60000);
    quest::summonitem(55561); # Worker's Badge - Number two
    quest::summonitem(55557); # Note to Gilipus
  }
  elsif (plugin::check_handin(\%itemcount, 55564 => 1, 55556 => 1)) { # Worker's badge - number five and Vial of anti rust agent
    quest::say("What took so long? Grumby has been breathing down my neck all day asking for this stuff. I am glad you were able to acquire it. It seems like everything around here is rusting away in this salty air. Your reward? Yes, yes. I will reward you. However it seems we need more help. Grumby has informed me that we need some ore. Think you could go and get some for us? Bring back three blocks of ore and your Worker's Badge."); 
    quest::exp(100000);
    quest::summonitem(55565); # Worker's badge - number six
  }
  elsif (plugin::check_handin(\%itemcount, 55565 => 1, 10503 => 3)) { # Worker's badge - number six and Block of ore
    quest::say("Not the best quality but this ore should help a lot. Now don't get mad at me, but before we can reward you, Grumby has told me that you will need to go get him some food. He said he wants some Filleted Mammoth. Oh and he also wanted a Jumjum Cake. Bring me those food items along with your worker's badge.");  
    quest::exp(110000);
    quest::summonitem(55567); # Workers Badge - number seven
  }
  elsif (plugin::check_handin(\%itemcount, 55567 => 1, 9747 => 1, 9654 => 1)) { # Worker's badge - number seven, Filleted Mammoth, Jumjum Cake
    quest::say("Looks like your work here is done. Grumby said I can reward you. Here you go. Thanks again and sorry for all the trouble.");  
    quest::exp(200000);
    quest::summonitem(55559); # Worker's Earring of Efficiency
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}
# END of FILE Zone:abysmal  ID:279052 -- Nioti.pl