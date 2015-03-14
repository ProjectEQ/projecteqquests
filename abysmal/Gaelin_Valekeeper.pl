# Druid Abysmal Sea armor
# Created by Gonner

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings $name, I am looking for those protectors of the woodland, the most noble of all classes, the [druid]. You wouldn't happen to be one would you?");
  }
  if($text=~/druid/i) {
    quest::say("Wonderful, it brings me joy to see fellow naturewalkers. For one such as yourself, I may be able to assist. If you are in need of new equipment such as [cap], [leggings], [tunic], [bracer], [sleeves], [gloves], or [sandals] - let me know.");
  }
  if($text=~/bracer/i) {
    quest::say("A bracer is rather simple to reshape, if you know what you're doing. Bring me back Muramite Bracer Armor piece and I will get to work on it. You will also need a section of infused Muramite leather to finish the bracer in a loom. Talk to Nalasrine if you still some help infusing the leather");
  }
  if($text=~/cap/i) {
    quest::say("I should be able to reform Muramite Helm Armor into something quite useful to you. Explore these lands until you find some Muramite leather padding. Talk to Nalasrine about infusing it, then bring piece it together with your new helm from me in a loom.");
  }
  if($text=~/gloves/i) {
    quest::say("I can make you a wonderful pair of gloves. Take the time to dig up some Muramite leather and have Nalasrine assist you with infusing it. Bring me Muramite Glove Armor and I can reshape it into something that you can use. Strengthen the gloves by reinforcing them with the infused leather in a loom, and a fine pair shall be yours.");
  }
  if($text=~/leggings/i) {
    quest::say("Reforming some Muramite greaves into a pair of leggings that would serve you well should be no great feat. Bring me a pair of Muramite Greaves and I will get to work on that. To finish your leggings you will also need to obtain two pieces of Muramite leather padding. Speak to Nalasrine about infusing it, then place the leather pieces and leggings in a loom to work them together.");
  }
  if($text=~/tunic/i) {
    quest::say("A tunic! Of course. Such a thing of beauty! I can craft one for you fairly easily if you do the legwork. Travel into the hostile areas and bring back two sections of Muramite leather and Muramite Chest Armor. Make sure to speak to Nalasrine about infusing the sections of leather. Bring me the chest piece for reworking, then simply weld together the new chest and leather in a loom.");
  }
  if($text=~/sandals/i) {
    quest::say("Soft, supple boots are my specialty. Bring me back Muramite Boot Armor and I believe I can rework them into something quite fine for you. Once I've reworked them, you will need to take a section of infused Muramite leather along with the new boots and reinforce them in a loom. If you need help in the infusing process, just talk to Nalasrine.");
  }
  if($text=~/sleeves/i) {
    quest::say("Some new sleeves? Indeed, arm protection is important. Venture into these strange lands and find some Muramite Sleeve Armor. Bring the armor piece to me and I will get to work on refitting it for you. Once you have a piece of Muramite leather padding, talk to Nalasrine about infusing the it. The new sleeve from me can be easily stitched up in a loom with the infused Muramite leather.");
  }
}

sub EVENT_ITEM {
  if ($class eq "Druid") {
    if (plugin::check_handin(\%itemcount, 68222 => 1)) { # Bracer
      quest::summonitem(54121); # reworked Bracer
    }
    elsif (plugin::check_handin(\%itemcount, 68220 => 1)) { # cap
      quest::summonitem(54119); # reworked cap
    }
    elsif (plugin::check_handin(\%itemcount, 68223 => 1)) { # Gloves
      quest::summonitem(54122); # reworked gloves
    }
    elsif (plugin::check_handin(\%itemcount, 68225 => 1)) { # leggings
      quest::summonitem(54124); # reworked leggings
    }
    elsif (plugin::check_handin(\%itemcount, 68226 => 1)) { # tunic
      quest::summonitem(54125); # reworked tunic
    }
    elsif (plugin::check_handin(\%itemcount, 68224 => 1)) { # Sandals
      quest::summonitem(54123); # reworked sandals
    }
    elsif (plugin::check_handin(\%itemcount, 68221 => 1)) { # Sleeves
      quest::summonitem(54120); # reworked sleeves
    }
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279015 -- Gaelin_Valekeeper.pl