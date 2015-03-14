#zone: gunthak NPC: Gaudric_Stormwynd (224193)
#Started by Angelox, finished by Kilelen
#Swarm of Pain/Icewind

#Got the x,y and z manually from in game,
#the description of where the Tempest pops is "behind you"
sub SpawnTempest {
   my $y = 1583;
   my $x = -152;
   my $z = 3;
   my $h = $npc->GetHeading();
   
   my $a = 224340;
   
   quest::unique_spawn($a,0,0,$x,$y,$z);
}

sub EVENT_SAY {
   if ($text=~/Hail/i){
      if ($class eq "Ranger"){
         quest::say("Greeting. What brings you to this forsaken rock? I have been sent here by the council of Surefall Glade to gather information about this Island. This place seethes with anger and hatred, and even the familiar [winds] of Karana blow with a cold bite. So far the creatures have all proved very hostile, even to a follow of Karana. I suspect that the curse of Innoruuk has caused them be very aggressive towards all outsiders. I have been able to gather some information on a new race of [insect] though.");
      }
      else{
        quest::emote("motions for silence. 'Can you hear it?  The sound of nature crying out in pain. The children of Karana long for a release from this place of torment.' Gaudric turns away and appears to begin meditating.");
     }
    }
   if($text=~/winds/i){
      quest::say("The fury of a truly torrential storm is a beautiful thing. Even in their destruction they bring the birth of new life. Such is the cycle of life on Norrath, from the ashes nature always rebuilds. The trolls care nothing for this cycle though, and merely use the power of the storm to fill their treasuries. I hear the tormented cries of tempest [spirits] across the wind.");
   }
   if($text=~/spirits/i){
      quest::say("I believe the followers of Nadox have found a way to control the spirits of the tempest by capturing them in amulets made of the black rock from the island. Bring me one of their amulets and I may be able to free the spirit from it.");
   }
   if($text=~/insect/i){
      quest::say("A strange group of ant like creatures that I've named Nifiliks seems to be native to the island. I've never encountered creatures quite like this. They seem to have a sort of Hive consciousness. They have a vast range in size. The smallest are barely an inch or two across, while the largest can be upwards of four feet tall. The larger ones seem to be able to control the smaller ones by some sort of audible communication. I've heard the strange noises they make, but have yet to [mimic] them.");
   }
   if($text=~/mimic/i){
      quest::say("The smallest ones do not seem to have as developed of a nervous system as the larger ones. They only act on the instincts and the commands of their masters. If we're able to mimic the sounds that they make, we may be able to control the smaller ones. If you're able to capture one of them alive and allow me to listen to its sounds I may be able to mimic them. You'll also need to bring me one of the smaller ones so I can observe its reactions.");
   }
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 59038 => 1, 59039 => 1)) {#A captured Nifilik, A tiny Nifilik
    quest::emote("takes the small nifilik and places it on the ground at his feet. He then partially unties the larger one causing it to let out some sort of high-pitched wailing. The small niflik on the table immediately begins to run across the ground toward you. You try to jump away but the nifilik still manages to latch onto your boot and crawl up under your armor. You howl in pain as the tiny creature bites repeatedly at your skin. Gaudric rebinds the larger nifilik and it stops wailing. The tiny creature below your armor stops biting at your skin.");
    quest::emote("begins to scrawl several runes on a parchment and then hands it to you. 'I believe I've worked it out now. Unfortunately, our voices won't be able to make the sounds necessary to control these creatures, but with the help of Karana's magic you'll be able to imitate the sounds enough to control the small creatures. Use their power wisely, Ninlawen. As you know their bite is quite painful.");
    quest::summonitem(59007);#Spell: Swarm of Pain
    quest::exp(1107392);#1% of level 45 xp
  }
  if(plugin::check_handin(\%itemcount, 59040 => 1)) {#Glowing Zraxthril Amulet
    quest::emote("takes the amulet from your hands and holds it in front of his eyes. He begins to speak arcane words into the stone, holding his other hand under the amulet. The amulet begins to spasm around crazily on its cord as if some creature was trying to escape from it. Sweat begins to bead up at Gaudric's brow. Suddenly the amulet explodes with light and Gadric is thrown to the ground. You reach down and carefully pick the amulet from the ground. You notice a large crack across the face. A watery visage begins to rise from the crack and take shape before you. The tempest spriti coalesces into a vaguely humanoid form and motions toward you. He points directly to the amulet in your hands.");
    quest::summonitem(59041);#Cracked Zraxthril Amulet
    &SpawnTempest();
  }
  plugin::return_items(\%itemcount);
}#Done