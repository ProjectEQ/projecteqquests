sub EVENT_SAY {
  if(quest::istaskactivityactive(169,4) && $text=~/hail/i) {
      quest::say("You have been of great assistance to me. It would be improper for me to ask more of you. I will find others to do these tasks. I have learned much doing research while you have been helping me. Let me show you the method I have discovered for preparing the nihilite.' She works swiftly, but you understand what she is doing as she carefully prepared the soft stone. 'Here is some of the special polish that we have devised for use with the nihilite. What I have shown you will work for both the Pale and Shimmering nihilite and you should be able to get useful stones from Raw Pale and Raw Shimmering nihilite.' You know you can reproduce the polish she has given you. You are certain that you can improve on the method she has shown you, given enough practice with the nihilite.");
      quest::updatetaskactivity(169,4);
      }
  if(quest::istaskactivityactive(160,4) && $text=~/hail/i) {
   quest::emote("smiles broadly at you.");
   quest::say("You have been of great assistance to me. It would be improper for me to ask more of you. I will find others to do these tasks. I have learned much doing research while you have been helping me. Let me show you the method I have discovered for preparing the Nihilite.' She works swiftly, but you understand what she is doing as she carefully prepared the soft stone. 'Here is some of the special polish that we have devised for use with the Nihilite. What I have shown you will work for both the Pale and Shimmering Nihilite, and you should be able to get useful stones from Raw Pale and Raw Shimmering Nihilite.' You know you can reproduce the polish she has given you. You are certain that you can improve on the method she has shown you, given enough practice with the Nihilite.");  
   quest::updatetaskactivity(160,4);
}
elsif ($text=~/hail/i) {
    quest::say("Greetings. You are looking well.' Glirina gives you a critical glance, 'I wonder, are you skilled in Jewelcrafting? Or perhaps you are interested in learning our craft? I have an opportunity for one who fits either of these categories. I have need of help, and by helping me you will learn something of what I know, if you are [interested] in such things.");
  }
  if ($text=~/interested/i) {
    quest::say("There are always many simple but time-consuming jobs to do on board the Queen of Thorns. I have more important research to attend to. I have been given samples of a new gem and I must turn my attention to discovering its properties. I have already discovered a method for cutting and preparing this [Pale Nihilite], as we've named it, so that it can be used in the creation of some beautiful work. We named it after a faction of the natives, though I'm not certain how these Nihil differ from the others. I haven't time for the local politics. I have far too much work to do for that. Are you interested in learning something about jewelcrafting while helping me complete my [work]?");
  }
  if ($text=~/pale nihilite/i) {
    quest::say("This Nihilite is an unusual gemstone. In its natural state it is opaque and a milky color, generally not too attractive. But when prepared properly, it retains its opacity but gains a unique property. When you place it upon another object, the Nihilite transfers the image of that object to the front face of the stone! For example,' Glirina takes a small piece of cloudy looking stone and shows you all sides. It appears the same milky color on all sides, though two sides are smooth while the others remain rough. She places one flat side onto the Wayfarers Brotherhood emblem on her cloak. The portion of the emblem covered by the Nihilite is visible on the surface of the stone, as if the stone were suddenly transparent like glass, but only between those two surfaces. 'The stone is rather soft, so it is both easy and delicate to work with. We have discovered the method for preparing Nihilite. If you can bring some Raw Pale Nihilite, I will prepare it for you, keeping only a small amount of it for my own.");
  }
  if ($text=~/work/i) {
    quest::say("I am pleased. I have work for you even now. As you may have noticed, members of the Wayfarers Brotherhood are often rough and careless. Despite my repeated insistence that they take more care with the things I make for them, they still return to me with [many items] in need of repair. The most common item that they break are the simple clasps that hold various items together. I would be grateful if you could make many such clasps for me. Simply place this Thin Steel Wire into your Jeweler's Kit and combine it. It is a rather simple task, though the fine wire requires a delicate touch. Bring the clasps back to me when you are done. I have many such tasks that you can help me with. If you prove to be helpful enough, perhaps I will teach you how to prepare raw Nihilite for use in you future jewelcrafting.");
    quest::taskselector(160);
  }
  if(quest::istaskactivityactive(160,0) && $text=~/many items/i) {
      quest::summonitem(58158,20);
}
  if(quest::istaskactivityactive(160,1) && $text=~/many items/i) {
     quest::say("My thanks to you, $name. We have need of some simple items for trade, both here and in other lands. It's a way to keep ourselves involved in the markets all over Norrath. I would appreciate it if you would create some simple copper rings for me to help round out our inventory. Just place the Small Sheet of Copper and a Blob of Metal Polish in your Jeweler's Kit and combine them. Bring the rings to me when you are done.");
     quest::summonitem(58141,20);
     quest::summonitem(58023,20);
}
   if(quest::istaskactivityactive(160,2) && $text=~/many items/i) { 
      quest::say("I appreciate your assistance. I have a task for you that should be a little more challenging. We sell a fair amount of simple jewelry all around Norrath. Right now we are in need of simple brass armbands. They seem to have become popular, and we'd like to take advantage of this trend while it lasts. Just take the Small Sheet of Brass and a Blob of Metal Polish and combine them in your Jeweler's Kit. Please bring the armbands back to me as soon as you can.");
      quest::summonitem(58140,20);
      quest::summonitem(58023,20);
 }
    if(quest::istaskactivityactive(160,3) && $text=~/many items/i) {
       quest::say("I am appreciative of your assistance. This task is a bit more complicated. We use a lot of silver chain in our work here, and it is always better and cheaper to make our own. If you could take the Thin Silver Wire and a Blob of Metal Polish and combine them in your Jeweler's Kit, I am certain you can create beautiful silver chain. Please return the chains to me when you are done, we have need of them.");
       quest::summonitem(58158,20);
       quest::summonitem(58023,20);
  }
  }
  
  sub EVENT_ITEM {
   plugin::return_items(\%itemcount); 
  }