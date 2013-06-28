sub EVENT_DEATH_COMPLETE {
    quest::setglobal("poeb_Birak",1,3,"D3");
    quest::signal(222023);
}