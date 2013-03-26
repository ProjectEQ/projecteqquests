# Dolvak's Report
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You have pervaded the inner core of the shrine, what brings your corporeal essence this far? Seek you to prove your worth to the lord and his kin?");
  }
  if ($text=~/prove my worth/i) {
    quest::say("So it shall be then that you will perform a task for the kin. As it happens, I was on a mission to speak with a [contact] of the shrine in the lands that do not sleep. This contact has vital information on the movements of the giants in that region and it is most important that we recover that information. Unfortunately, I have been called away on duty to further bolster our defenses and will not be able to meet with her.");
  }
  if ($text=~/contact/i) {
    quest::say("Her name is Eysa Florawhisper. She is a Countess from the Tunarean Court, of whom we are allied with in this fight against the giants. The court does not want the giants encroaching on the lands of Tunare, for they fear that the giants will cause great harm to the area, should they be allowed to control it. As you can see, this gives us a common enemy, which has forged an even stronger alliance between our two peoples. If you can deliver this report to her in my stead, she will give you the documents we need.");
    quest::summonitem(29067);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29623 => 1)) {
    quest::say("Ah, excellent. You've returned with the papers we needed. There is some rather interesting information here that I'm sure the council will be glad to have in their possession, and it will allow for our further fortification against the giants. You have proven yourself to be an honorable ally and a friend to the shrine and we thank you for it. I cannot offer you much for this but in time, your actions may prove to be invaluable to the shrine and its kin.");
    quest::exp(5000);
    quest::givecash(2,3,5,7);
    quest::faction(42,10); #CoV
    quest::faction(362,10); #Yelinak
    quest::faction(189,-30); #Kromzek
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: skyshrine ID: 114340 NPC: Liason_Dolvak

