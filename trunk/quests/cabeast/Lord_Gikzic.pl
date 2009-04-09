#Lord Gikzic is for the Greenmist quest line and administers the first two quests in the line.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("You dare to intrude upon the presence of a Lord of Pain?!  Such foolish acts can only be those of a knight in training.  Are you a [knight in training]?");
  }
 elsif($text=~/knight in training/i){ #Test of the Pawn (Greenmist Quest 1/8)
  quest::say("If you are a pawn, then let us begin with a simple test.  Complete the test and you shall be rewarded with a new khukri.  Do you [wish to perform the test of a pawn]?");
  }
 elsif($text=~/test of a pawn/i){ #Test of the Pawn (Greenmist Quest 1/8)
  quest::say("You shall carry this pack.  Within it you shall combine 4 sarnak hatchling heads. When you have the full sarnak head pack then you shall return it to me along with your pawn's khukri and I shall reward you with the khukri of a knave. Beware, for the sarnak are our most hated foes and even their whelps are quite formidable fighters. Be sure to seek out Klok Mugruk. He may have some curscale armor available.");
  quest::summonitem(17017); #Sarnak Head Pack
  }
 elsif($text=~/greater concern/i){ #Test of Pain (Greenmist Quest 2/8)
  quest::say("A tome has been taken from us. An expeditionary unit was returning to Cabilis when they were overtaken by a band of froglok raiders. The odds were greatly in their favor, but our forces would soon cut them down. Then, as abruptly as the battle began, it came to an end. The frogs retreated. The only item they took was an ancient tome entitled 'The Origins of Pain'. What the frogs want with it is unknown to us. Will you [retrieve the tome]?");
  }
 elsif($text=~/retrieve the tome/i){ #Test of Pain (Greenmist Quest 2/8)
  quest::say("The tome ripped open in battle. There were but ten pages. This is one of those pages. You must find the remainder and the tome binder. Place the pages within the binder and once you combine them, the binder shall magically lock. Do not look upon the pages, for the words would bring a great madness upon you. Your task is simply to seek out the froglok raiders and return the magically locked tome to me. Return it with a knave's khukri and I shall give you a more powerful weapon.");
  quest::summonitem(18229); #Page 10 of Origins of Pain
  }
}

sub EVENT_ITEM {
  if(($itemcount{12381} == 1) && ($itemcount{5120} == 1)){ #Test of the Pawn (Greenmist Quest 1/8)
  quest::say("You have learned to behead your opponents with great precision. Take the khukri of the knave. It shall prove most formidable in combat when wielded by a young crusader. You may now assist us with a [greater concern] than your training.");
  quest::summonitem(5121);
  quest::givecash("0","0","1","0"); 
  quest::exp(100);
  quest::ding();
  quest::faction(62,20);
  quest::faction(193,10);
 }
 elsif(($itemcount{12382} == 1) && ($itemcount{5121} == 1)){ #Test of Pain (Greenmist Quest 2/8)
  quest::say("You have done as instructed. You are wise to hand this tome to me. It could bring you nothing more than insanity. As your reward, you shall have the squire's khukri. Soon you shall wield the knight's khukri, but that is for another Lord of Pain to decide.");
  quest::summonitem(5122);
  quest::givecash("0","0","3","0"); 
  quest::exp(300);
  quest::ding();
  quest::faction(62,20);
  quest::faction(193,10);
 }
 else{ 
 plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
 plugin::return_items(\%itemcount);
 }
}

#Submitted by: Jim Mills