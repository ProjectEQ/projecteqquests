sub EVENT_SAY {
    if ($text=~/I will help/i) {
      quest::emote("reaches out and puts something in your hand, 'Find Magistrate Phenic, he is the only one that I know I can trust.' With a look of someone who has left unfinished business behind her, Halle lets go and dies.");
      quest::summonitem(18330);
      $npc->Depop();
    }
}