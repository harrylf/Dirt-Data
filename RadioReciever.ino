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

#include <RH_ASK.h>
#include <SPI.h> // Not actualy used but needed to compile

RH_ASK driver;
char node1w[4] = "000";
char node1l[4] = "000";
char node2w[4] = "000";
char node2l[4] = "000";
char node3w[4] = "000";
char node3l[4] = "000";
char node4w[4] = "000";
char node4l[4] = "000";
char node5w[4] = "000";
char node5l[4] = "000";
char node6w[4] = "000";
char node6l[4] = "000";
char node7w[4] = "000";
char node7l[4] = "000";
char node8w[4] = "000";
char node8l[4] = "000";
int readcount = 0;
void setup()
{
  
    Serial.begin(9600); // Debugging only
    if (!driver.init())
         Serial.println("init failed");
}

void loop()
{
    uint8_t buf[9];
    uint8_t buflen = sizeof(buf);
    if (driver.recv(buf, &buflen)) // Non-blocking
    {
      int i;
      String str = (char*)buf;
      // Message with a good checksum received, dump it.
      char node = str[8];
      switch(node){
        case '1':
          node1w[0] = str[0];
          node1w[1] = str[1];
          node1w[2] = str[2];
          node1l[0] = str[4];
          node1l[1] = str[5];
          node1l[2] = str[6];
        break;
        case '2':
          node2w[0] = str[0];
          node2w[1] = str[1];
          node2w[2] = str[2];
          node2l[0] = str[4];
          node2l[1] = str[5];
          node2l[2] = str[6];
          Serial.println(node2w);
          Serial.println(node2l);
        break;
        case '3':
          node3w[0] = str[0];
          node3w[1] = str[1];
          node3w[2] = str[2];
          node3l[0] = str[4];
          node3l[1] = str[5];
          node3l[2] = str[6];
          Serial.println(node3w);
          Serial.println(node3l);
        break;
        case '4':
          node4w[0] = str[0];
          node4w[1] = str[1];
          node4w[2] = str[2];
          node4l[0] = str[4];
          node4l[1] = str[5];
          node4l[2] = str[6];
        break;
        case '5':
          node5w[0] = str[0];
          node5w[1] = str[1];
          node5w[2] = str[2];
          node5l[0] = str[4];
          node5l[1] = str[5];
          node5l[2] = str[6];
        break;
        case '6':
          node6w[0] = str[0];
          node6w[1] = str[1];
          node6w[2] = str[2];
          node6l[0] = str[4];
          node6l[1] = str[5];
          node6l[2] = str[6];
        break;
        case '7':
          node7w[0] = str[0];
          node7w[1] = str[1];
          node7w[2] = str[2];
          node7l[0] = str[4];
          node7l[1] = str[5];
          node7l[2] = str[6];
        break;
        case '8':
          node8w[0] = str[0];
          node8w[1] = str[1];
          node8w[2] = str[2];
          node8l[0] = str[4];
          node8l[1] = str[5];
          node8l[2] = str[6];
        break;
      }
      readcount++;
      if(readcount == 8){
        readcount = 0;
        char waterSendMessage[34];
        char lightSendMessage[34];
        strcpy(waterSendMessage,"1,");
        strcpy(lightSendMessage,"0,");
        strcat(waterSendMessage,node1w);
        strcat(waterSendMessage,",");
        strcat(lightSendMessage,node1l);
        strcat(lightSendMessage,",");
        strcat(waterSendMessage,node2w);
        strcat(waterSendMessage,",");
        strcat(lightSendMessage,node2l);
        strcat(lightSendMessage,",");
        strcat(waterSendMessage,node3w);
        strcat(waterSendMessage,",");
        strcat(lightSendMessage,node3l);
        strcat(lightSendMessage,",");
        strcat(waterSendMessage,node4w);
        strcat(waterSendMessage,",");
        strcat(lightSendMessage,node4l);
        strcat(lightSendMessage,",");
        strcat(waterSendMessage,node5w);
        strcat(waterSendMessage,",");
        strcat(lightSendMessage,node5l);
        strcat(lightSendMessage,",");
        strcat(waterSendMessage,node6w);
        strcat(waterSendMessage,",");
        strcat(lightSendMessage,node6l);
        strcat(lightSendMessage,",");
        strcat(waterSendMessage,node7w);
        strcat(waterSendMessage,",");
        strcat(lightSendMessage,node7l);
        strcat(lightSendMessage,",");
        strcat(waterSendMessage,node8w);
        strcat(lightSendMessage,node8l);
        Serial.println(waterSendMessage);
        delay(2000);
        Serial.println(lightSendMessage);
      }
    }
}
