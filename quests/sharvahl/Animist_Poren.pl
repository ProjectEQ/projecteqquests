sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings $name, it is good to see you. If you have come for the first stage of Khati Sha training please show me your acrylia slate.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 2877 => 1)) { #Acrylia Slate of Shar Vahl
    quest::say("I have much for you to do $name. There is great need for capable Khati Sha in this new land. It is important that you progress speedily. We need to outfit you with the equipment that defines our chosen path. Well start with your battleclaws... But be aware of the fact that it will take you some time before can use both sets in combat. Just keep them both with you while you learn.");
    quest::say("Take this stitching pack and combine two shade silks from the xakra worms. Combine two of the resulting threads to make a bandage. Take this pattern and sew together three of the bandages. With considerable practice this will produce the handwraps that will be a foundation for your first sacred weapon. When you have created them return to me the scrap material.");
    quest::summonitem(17237); #Stitching Pack
    quest::summonitem(2877); #Acrylia Slate of Shar Vahl
    quest::summonitem(3663); #Khati Sha Handwrap Pattern
  } 
  elsif (plugin::check_handin(\%itemcount, 3665 => 1)) { #Shade Silk Scraps
    quest::say("Ahh, you have done well young one. Now it is time for you to create claws of your own, and those handwraps are the base. You will need a few things to complete them, however. Combine those handwraps in your stitching pack along with two sharp claws from the young rockhoppers in the pit around our city, as well as some forged fasteners.");
    quest::say("Im afraid I am unsure where you can find the fasteners, though you might ask Kagazz about them. You can find him over near the forges. Return and hand me both claws, and your cloak as proof of your deeds.");
    quest::say("Oh, and dont worry about destroying your handwraps. They are well made and though you may not be successful in making your claws, they will last. Now you best move along and get started, as we still have much to do!");
    quest::exp(300);
  }
  elsif (plugin::check_handin(\%itemcount, 3673 => 1, 3674 => 1, 2878 => 1)) { #Primary Khati Sha Recruit Claw, Secondary Khati Sha Recruit Claw, Initiate's Cloak of Shar Vahl
    quest::say("I am greatly impressed with your work here. Very few recruits can make such claws, let alone master the technique. It is with great pleasure I present you a new cloak and welcome you as a full Recruit!");
    quest::shout("Attention everyone! It is with great pride and pleasure that I welcome $name to the ranks of the Khati Sha Recruits! $name has done our great city proud, and will continue to do great things!");
    quest::say("Now that you are a full recruit, it is time for you to move on with your training. Take my seal and seek out Mahron. He is a well traveled animist and can teach you many things. He is usually over near the bank. Be safe and well done, young one!");
    quest::exp(500);
    quest::summonitem(3673); #Primary Khati Sha Recruit Claw
    quest::summonitem(3674); #Secondary Khati Sha Recruit Claw
    quest::summonitem(3675); #Cloak of the Khati Sha Recruit
    quest::summonitem(3670); #Seal of Animist Poren
  }
  else {
    #Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
  }
  plugin::return_items(\%itemcount);
}
#End of FILE Zone:sharvahl  ID:155073 -- Animist_Poren