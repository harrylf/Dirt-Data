  #include <RadioHead.h>
#include <radio_config_Si4460.h>
#include <RHCRC.h>
#include <RHDatagram.h>
#include <RHGenericDriver.h>
#include <RHGenericSPI.h>
#include <RHHardwareSPI.h>  
#include <RHMesh.h>
#include <RHNRFSPIDriver.h>
#include <RHReliableDatagram.h>
#include <RHRouter.h>
#include <RHSoftwareSPI.h>
#include <RHSPIDriver.h>
#include <RHTcpProtocol.h>
#include <RH_ASK.h>
#include <RH_NRF24.h>
#include <RH_NRF905.h>
#include <RH_RF22.h>
#include <RH_RF24.h>
#include <RH_RF69.h>
#include <RH_RF95.h>
#include <RH_Serial.h>
#include <RH_TCP.h>
#include <LowPower.h>


#include <RH_ASK.h>
#include <SPI.h> // Not actually used but needed to compile

RH_ASK driver;
int RESETPin = PD5;
int analogPin = A0; //pin A0 or #4
int lightPin = A1;
int i = 1;
int moisture; //raw value
int percentage; //percentage
int lpercentage;
int light;
int map_low = 706;  //These values relate to a 3.3 Vin OG 706
int map_high = 350;  //OG: 350
int light_low = 895;
int light_high = 230;
int brightness;
void(*resetFunc) (void) = 0;
void setup()
{
    Serial.begin(9600);   // Debugging only
    Serial.println("3");
    if (!driver.init())
         Serial.println("init failed");
}

void loop()
{
    delay(1000);
    unsigned int sleep;
      for(sleep = 150; sleep >0;sleep--){
      LowPower.powerDown(SLEEP_8S, ADC_OFF, BOD_OFF);
    }
    delay(1000);
    char water[4] = "";
    char bright[4] = "";
    char transmission[10] = "";
    driver.waitPacketSent();
    int percent = 0;
    moisture = 0;
    String percentagelstr;
    String percentagewstr;
    char wpercent[4];
    char lpercent[4];

    moisture = analogRead(analogPin);
    Serial.print("moisture:");
    Serial.println(moisture);
    light = analogRead(lightPin);
    Serial.print("light");
    Serial.println(light);
    


    percentage = map(moisture, map_low, map_high, 0, 100);
    lpercentage = map(light, light_low, light_high, 0, 100);
    if(percentage > 100)
      percentage = 100;
    if(percentage <0)
      percentage = 0;
    if(lpercentage > 100)
      lpercentage = 100;
    if(lpercentage <0)
      lpercentage = 0;
    percentagewstr = String(percentage);     
    percentagelstr = String(lpercentage);
    percentagewstr.toCharArray(wpercent, 4);
    percentagelstr.toCharArray(lpercent, 4);
    if(percentage < 100)
      strcat(transmission,"0");
    if(percentage < 10)
      strcat(transmission,"0");  
    strcat(transmission,wpercent);    
    strcat(transmission, ",");
    
    if(lpercentage < 100)
      strcat(transmission,"0");
    if(lpercentage < 10)
      strcat(transmission,"0");
    strcat(transmission, lpercent);  
    strcat(transmission, ",");
    strcat(transmission, "6");
    driver.send((const char *)transmission, strlen(transmission));
    Serial.println(transmission);
}
