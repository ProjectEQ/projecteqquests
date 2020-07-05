# items: 58128, 58167, 58060, 58169, 58063, 58168, 58062, 58049, 58050, 58130, 58122, 58093, 58097
sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(162,4)) { #Poisonmaking Freebie Step 5
      quest::say("You have proven your worth. You need do no more tasks for us. You have done enough and your skills will be more useful elsewhere. Here is the secret we promised you.");
      quest::emote("retrieves a thin piece of paper from his pocket. He tells you that it is a bit of the filter that he uses for distilling Muramite blood. He waves it suddenly under your nose. You can't help but flinch at the stench, which causes him to chuckle. You recognize the smell and are able to figure out exactly what he uses to distill the poison from the blood. Figuring out the process is easy now. You also know that you can teach yourself a more effective process with enough practice.");
      quest::emote("then continues, 'The same method will work for the material we have been calling Muramite bile, though that probably has less in common with what we know as bile.'");
      quest::LearnRecipe(276); #Muramite Blood Distillate
      quest::LearnRecipe(275); #Muramite Bile
    }
    elsif (quest::istaskactivityactive(174,4)) { #Poisonmaking Collect Step 5
      quest::say("You have proven your worth. You need do no more tasks for us. You have done enough and your skills will be more useful elsewhere. Here is the secret we promised you.");
      quest::emote("retrieves a thin piece of paper from his pocket. He tells you that it is a bit of the filter that he uses for distilling Muramite blood. He waves it suddenly under your nose. You can't help but flinch at the stench, which causes him to chuckle. You recognize the smell and are able to figure out exactly what he uses to distill the poison from the blood. Figuring out the process is easy now. You also know that you can teach yourself a more effective process with enough practice.");
      quest::emote("then continues, 'The same method will work for the material we have been calling Muramite bile, though that probably has less in common with what we know as bile.'");   
      quest::LearnRecipe(276); #Muramite Blood Distillate
      quest::LearnRecipe(275); #Muramite Bile
    }
    else {
      quest::say("Hello, Uiyaniv drawls as he appraises you. You may be of use to me. If you are wise enough to handle a few simple tasks, you will free me up to do more important things. Are you [willing] in making yourself useful?");
    }
  }
  if ($text=~/willing/i) {
    quest::say("Good start. Being useful is a good talent to cultivate. I am busy working on some interesting uses for the blood of the creatures they have dubbed Muramites. You can please me by doing some of the bothersome tasks that I have been given so that I can apply my talents to this research. Do you want to make yourself [useful] so that I can study the [Muramite blood]?");
  }
  if ($text=~/muramite blood/i) {
    quest::say("I've never seen one of these Muramites, but I've seen samples of their blood -- though calling it blood somewhat extends the usual meaning of that word. There is little resemblance to our blood and and it certainly interacts with it in a very negative way. It's almost like these creatures are antithetical to us. Maybe that's a little extreme, but their blood carries things in it that are first-class poisons to us. The stuff is a little difficult to work with and will certainly make you break out in a rash if you spill it on yourself. The issue is that the blood spoils easily and must be treated properly. I've figured out how to work with it. If you bring me a sample of Muramite blood, I'll distill it for you into something useful and keep a bit of it for my own use.");
  }
  if ($text=~/useful/i) {
    quest::say("Tolerable. At least you are willing to try to prove yourself. Here is what I propose. I will have you complete many tedious and -- if I can manage it -- [painful tasks]. The result will mean that I have more free time to work on my own projects. In exchange, if you work hard enough, I will teach you the secret for distillation of the Muramite blood. Don't expect this to happen quickly.");
    quest::taskselector(162); #Poisonmaking Freebie
  }
  if ($text=~/painful tasks/i) {
    if (quest::istaskactivityactive(162,0)) { #Poisonmaking Freebie Step 1
      quest::say("Your first task will be to create some simple universal suspension. Just take the simple thickener and a vial of Abysmal Sea water and combine them in you mortar and pestle. Return the suspension to me when you are done.");
      quest::summonitem(58128,20); #Simple Thickener
      quest::summonitem(58167,20); #Vial of Abysmal Sea Water
    }
    if(quest::istaskactivityactive(162,1)) { #Poisonmaking Freebie Step 2
      quest::emote("looks you over with a critical glance");
      quest::say("I have plenty for you to do. We need some solvent. We use a lot of it around here. Just put one ounce of mild acid and a vial of Abysmal Sea water into you mortar and pestle and mix them. Go do that and leave me to my work. Only come back to give me the solvent.");
      quest::summonitem(58060,20); #Ounce of Mild Acid
      quest::summonitem(58167,20); #Vial of Abysmal Sea Water
    }
    if(quest::istaskactivityactive(162,2)) { #Poisonmaking Freebie Step 3
      quest::say("You are skilled enough to do something more challenging. We have some need of simple poison, though I cannot tell you exactly why. Just take a vial of simple suspension and one ounce of weak spider venom and combine them in your mortar and pestle. Bring me the resultant poison and you will earn a little more respect.");
      quest::summonitem(58169,20); #Vial of Simple Suspension
      quest::summonitem(58063,20); #Ounce of Weak Spider Venom
    }
    if(quest::istaskactivityactive(162,3)) { #Poisonmaking Freebie Step 4
      quest::say("Good. Now, get to work making some injected poison for me. It's not hard to do. Just take a vial of simple solvent and an ounce of weak snake venom and combine them in your mortar and pestle. Bring me the poison when you are done.");
      quest::summonitem(58168,20); #Vial of Simple Solvent
      quest::summonitem(58062,20); #Ounce of Weak Snake Venom
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58049 => 1)) { #Muramite Blood
    quest::say("Ah, yes. Here is your distillate.");
    quest::summonitem(58050,2); #Muramite Blood Distillate
  }
  elsif (plugin::check_handin(\%itemcount, 58130 => 4) || plugin::check_handin(\%itemcount, 58130 => 3) || plugin::check_handin(\%itemcount, 58130 => 2) || plugin::check_handin(\%itemcount, 58130 => 1)) { #Simple Universal Suspension
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58122 => 4) || plugin::check_handin(\%itemcount, 58122 => 3) || plugin::check_handin(\%itemcount, 58122 => 2) || plugin::check_handin(\%itemcount, 58122 => 1)) { #Simple Solvent
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58093 => 4) || plugin::check_handin(\%itemcount, 58093 => 3) || plugin::check_handin(\%itemcount, 58093 => 2) || plugin::check_handin(\%itemcount, 58093 => 1)) { #Simple Contact Poison
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58097 => 4) || plugin::check_handin(\%itemcount, 58097 => 3) || plugin::check_handin(\%itemcount, 58097 => 2) || plugin::check_handin(\%itemcount, 58097 => 1)) { #Simple Injected Poison
    quest::say("Ah, yes. Thank you.");
  }
  plugin::return_items(\%itemcount);
}