sub EVENT_SAY {
  if ($faction==1) {
    if ($text=~/hail/i) {
      quest::say("Hello, $name, what brings you to these sacred quarters on this day? If it is treasure that you seek please ask someone else for I do not have time to think of such petty things. My worries are much greater at this time I am afraid.");
    }
    if ($text=~/what.*worries/i) {
      quest::say("Well I suppose I can tell you of my promise if you are willing to listen as I do not feel you have intentions of using anything I tell you against my dragonkin. Not many can walk these quarters unless they are very trusted amongst us.");
    }
    if ($text=~/what.*promise/i) {
      quest::say("I made a promise a very long time ago to my wingmate Faliana, a promise that I feel I may have broken.");
    }
    if ($text=~/broken/i) {
      quest::say("I promised my dear Faliana that I would always keep her talisman close to me. If something has happened to my son I must retain his talisman so that I may keep Faliana's Talisman secure, as I promised her I always would. Before she perished she split her talisman into two pieces one of which I always will carry and the other half which my son Glanitar carries. My son has not returned to me for some time and I am deeply concerned for this is not normal behavior for him. I fear something must have happened to him for he has never been so involved in his training to not inform me of his whereabouts or to not come visit.");
    }
    if ($text=~/what.*training/i) {
      quest::say("It seems like it was only yesterday that my only son Glanitar was practicing his skills as a young Wurm. Before long he quickly mastered many fighting skills and the development of his magical skills rapidly progressed. He was coming along so well in his training that he was quickly drafted for the Patrol. Even when he was away for his training he would often return to me and tell me of his progress. I was very proud of him for his involvement with the Patrol. Although I am very proud of his accomplishments, I have not seen him for longer then I have ever been away from him and I fear for the worst.");
    }
    if ($text=~/what.*patrol/i) {
      quest::say("Ah yes, the patrol. Well in the Great Divide there is a collection of caves that the dragonkind holds as a sacred territory. For this reason we always have a number of our strongest up and coming younger ones train there with the great [Kardakor]. They patrol the caved labyrinth to make sure it is free from unwanted intruders who are quickly dealt with upon discovery.");
    }
    if ($text=~/kardakor/i) {
      quest::say("Kardakor is a strong and powerful Warrior. He has fought in many battles against the vile Giants and is well respected amongst our people as a champion. For this reason when one was needed to train our young fighters seeking guidance in developing both their magical and fighting techniques it was clear to us who we should select for this honor, Kardakor.");
    }
  }
}

sub EVENT_ITEM {
  if (($faction==1) && ($CircletFalinkan=="2")) {
    # 1866  Glanitar's Imbued Talisman
    if (plugin::check_handin(\%itemcount,1866=>1)) {
      quest::say("It is with great sorrow that I receive this talisman which clearly symbolizes the death of my son for he would first suffer a hundred deaths then rather then to willingly give up his only bind to his Mother. However your assistance and dedication to me is unquestioned. For your efforts I would like you to carry something very special to me. Please take this Circlet and treasure it always as it belonged to my Faliana. I feel as much as you assisted me in obtaining the whereabouts of my son I know that she would want you to have it as much as I do. Sadly, now I must mourn my lost son however I shall never forget your kindness, $name, Thank you.");
      quest::summonitem(1867); # 1867  Circlet of the Falinkan
      quest::faction(362,10); # Yelinak
      quest::faction(42,10); # Claws of Veeshan
      quest::faction(189,-30); # Kromzek
      quest::exp(100000);
      quest::delglobal("CircletFalinkan");
    }
  }
  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:skyshrine  NPC:114002 -- #Ralgyn

