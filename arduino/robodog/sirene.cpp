/*
 * Controle Sirene Intermintente
 * Criado: 23/07/2020
 * Atualizado: 23/04/2021
 * Autor: Mauricio Eiji Nakai
 */

#include "Arduino.h"
#include "sirene.h"
#include "timer.h"


Sirene::Sirene(byte pin, byte smax, byte smin){
  _smax=smax;
  _smin=smin;
  pinMode(_smax, INPUT_PULLUP);
  pinMode(_smin, INPUT_PULLUP);
  portasirene=pin;
  noTone(portasirene);
  _Estado_sirene=0;
}

void Sirene::tick(void){
  Serial.print("Estado_sirene:");
  Serial.print(_Estado_sirene);
  Serial.print("  ");
  
  switch(_Estado_sirene){
    case 0:
      noTone(portasirene);
      _timer_sirene=get_timer();
      _Estado_sirene = 1;
      break;
    case 1:
      noTone(portasirene);
      break;
    case 2:
      if (check_timer(_timer_sirene)==0){
        _flag_sirene=!_flag_sirene;
        if (_flag_sirene == true) {         // check if the input is HIGH (button released)
          noTone(portasirene);
        } else {
          tone(portasirene,440);
        }
        init_timer(_timer_sirene,200);
      }
      break;
  }
  
  Serial.print("_smax:");
  Serial.print(digitalRead(_smax));
  Serial.print("  ");
  
  if (digitalRead(_smax) || digitalRead(_smin)){
    liga();
  }else{
    desliga();
  }
}



void Sirene::liga(void){
  _Estado_sirene=2;
}

void Sirene::desliga(void){
  _Estado_sirene=1;
}
      
