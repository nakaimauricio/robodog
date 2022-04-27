class Sirene
{
  public:
    Sirene(byte pin,byte smax, byte smin);
    void tick();
    void liga(void);
    void desliga(void);
  private:
    int portasirene;
    int _Estado_sirene=0;
    int _timer_sirene;
    int _flag_sirene=false;
    byte _smin;
    byte _smax;
};
