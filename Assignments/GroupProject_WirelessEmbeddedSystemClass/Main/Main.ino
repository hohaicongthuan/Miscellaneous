// "http://history.openweathermap.org/data/2.5/history/city?id=1581130&type=hour&start=1618506000&appid=<replace your API key here>";

#include "time.h"
#include <WiFi.h>
#include <HTTPClient.h>
#include <Arduino_JSON.h>

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#include <NimBLEDevice.h>

//===========================================================================================//

///////////////////////////
// CONFIGURATION SET HERE//
///////////////////////////

// BLUETOOTH CONFIGURATION
#define SERVICE_UUID        "2770a591-388a-4cb6-a629-4f3f902c3db0"
#define CHARACTERISTIC_UUID "4fafc201-1fb5-459e-8fcc-c5c9c331914b"

// OLED CONFIGURATION
#define SCREEN_WIDTH    128     // OLED display width, in pixels
#define SCREEN_HEIGHT   64      // OLED display height, in pixels

#define OLED_RESET      4       // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS  0x3C    // < See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// SERVER & WIFI CONFIGURATION
#define ssid      "Lee Su Min"
#define password  "thuankhung1999"

String api_key    = "&appid=<replace your API key here>";
String city_id    = "city?id=1566083";
String api_type   = "&type=hour";
String start_time = "&start=";
String api_count  = "&cnt=1";


// Your Domain name with URL path or IP address with path
String serverName = "http://history.openweathermap.org/data/2.5/history/";

// Server Path
String serverPath;

class MyCallbacks : public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic *pCharacteristic) {
      std::string value = pCharacteristic->getValue();

      if (value.length() > 0) {
        Serial.print("New value: ");
        for (int i = 0; i < value.length(); i++)
          Serial.print(value[i]);

        Serial.println();
      }
    }
};

//=========================================================================================//

////////////////////////////////
// VARIABLES DECLARATION HERE //
////////////////////////////////

// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.
unsigned int lastTime = 0;
// Timer set to 10 minutes (600000)
//unsigned long timerDelay = 600000;
// Set timer to 5 seconds (5000)
unsigned int timerDelay = 5000;

// Store weather data get from weather.com
String Weather_Data;

// Values to display on the OLED
JSONVar display_time,
        display_temp,
        display_feel_like,
        display_humidity,
        display_cloud,
        display_wind_speed;
        
String display_city_name;

// City IDs & names
int list_city_id[] = {
                  1559969,  1559970,  1559971,  1559972,  1559975,  1559976,  1559977,  1559978,
                  1560037,  1560349,  1560678,  1561096,  1562412,  1562414,  1562548,  1562693,
                  1562798,  1562820,  1563241,  1563281,  1563287,  1563926,  1564676,  1565022,
                  1565033,  1565088,  1565593,  1565654,  1565681,  1566053,  1566083,  1566165,
                  1566166,  1566319,  1566338,  1566346,  1566557,  1566559,  1567069,  1567148,
                  1567621,  1567643,  1567649,  1567681,  1567723,  1567788,  1568043,  1568212,
                  1568510,  1568574,  1568733,  1568738,  1568758,  1568769,  1568839,  1569684,
                  1569805,  1569901,  1569973,  1570449,  1570549,  1570565,  1570815,  1571058,
                  1571067,  1571968,  1572151,  1572461,  1572594,  1573517,  1574023,
                  1575627,  1575788,  1575864,  1576303,  1576632,  1576633,  1577882,  1577995,
                  1578500,  1579008,  1579634,  1580142,  1580240,  1580410,  1580541,  1580578,
                  1580700,  1580830,  1581019,  1581021,  1581030,  1581047,  1581052,  1581088,
                  1581130,  1581188,  1581298,  1581323,  1581326,  1581349,
                  1581364,  1581882,  1582436,  1582562,  1582720,  1582886,  1582926,  1583240,
                  1583477,  1583992,  1584071,  1584169,  1584534,  1584661,  1584807,  1585660,
                  1586151,  1586182,  1586185,  1586203,  1586288,  1586296,  1586350,  1586357,
                  1586443,  1586896,  1587871,  1587919,  1587923,  1587976,  1591449,
                  1591474,  1591527,  1591538,  1591793,  1594018,  1594446,  1892675,  1905099,
                  1905412,  1905419,  1905468,  1905475,  1905480,  1905497,  1905516,  1905577,
                  1905626,  1905637,  1905669,  1905675,  1905678,  1905686,  1905699,  1905856,
                  7910088
                };

String list_city_name[] = {
                        "Tinh Nghe An",             "Tinh Ninh Binh",           "Tinh Ninh Thuan",          "Tinh Soc Trang",
                        "Tinh Tra Vinh",            "Tinh Tuyen Quang",         "Tinh Vinh Long",           "Tinh Yen Bai",
                        "Yen Vinh",                 "Yen Bai",                  "Xom Yan Lac Hau",          "Xom Pho",
                        "Tinh Lao Cai",             "Vung Tau",                 "Vinh Yen",                 "Vinh Long",
                        "Vinh",                     "Viet Tri",                 "Uong Bi",                  "Tuy Hoa",
                        "Tuyen Quang",              "Tra Vinh",                 "Tinh Tien Giang",          "Thu Dau Mot",
                        "Tinh Thua Thien-Hue",      "Tinh Kon Tum",             "Thong Tay Hoi",            "Thon Dien Ha",
                        "Thon Chiet Bi Ha",         "Huyen Thanh Son",          "Thanh pho Ho Chi Minh",    "Tinh Thanh Hoa",
                        "Thanh Hoa",                "Thai Nguyen",              "Tinh Thai Binh",           "Thai Binh",
                        "Tinh Tay Ninh",            "Tay Ninh",                 "Tan An",                   "Tam Ky",
                        "Son Tay",                  "Tinh Son La",              "Huyen Son Duong",          "Son La",
                        "Song Cau",                 "Soc Trang",                "Sa Pa",                    "Sa Dec",
                        "Rach Gia",                 "Quy Nhon",                 "Tinh Quang Tri",           "Quang Tri",
                        "Tinh Quang Ninh",          "Tinh Quang Ngai",          "Tinh Quang Binh",
                        "Pleiku",                   "Tinh Phu Yen",             "Thi xa Phu Tho",           "Duong GJong",
                        "Phu Ly",                   "Phu Khuong",               "Phu Huu",                  "Phong Tho",
                        "Phan Thiet",               "Phan Rang-Thap Cham",      "Ninh Binh",                "Nha Trang",
                        "Ngo Chau",                 "Tinh Hoa Binh",            "Nam Dinh",                 "My Tho",
                        "Long Xuyen",               "Tinh Long An",             "Loc Ninh",                 "Lao Cai",
                        "Tinh Lang Son",            "Lang Son",                 "Tinh Lam Dong",            "Lagi",
                        "Kon Tum",                  "Tinh Kien Giang",          "Tinh Khanh Hoa",           "Hung Yen",
                        "Hue",                      "Ha Long",                  "Hoi An",                   "Thanh pho Ho Chi Minh",
                        "Tinh Ha Tinh",             "Hoa Binh",                 "Tinh Ha Tay",              "Hau Duong",
                        "Tinh Ha Giang",            "Ha Tinh",                  "Ha Tien",                  "Tinh Gia Lai",
                        "Ha Noi",                   "Tinh Can Tho",             
                        "Hai Phong",                "Hai Ha",                   "Hai Duong",                "Ha Giang",
                        "Ha Dong",                  "Tinh Binh Thuan",          "Dong Xoai",                "Tinh Dong Thap",
                        "Tinh Dong Nai",            "Dong Hoi",                 "Dong Ha",                  "Huyen Doan Hung",
                        "Dien Bien Phu",            "Turan",                    "Da Lat",                   "Tinh Dac Lak",
                        "Ba Ria-Vung Tau",          "Cu Chi",                   "Con Son",                  "Chau Doc",
                        "Cao Lanh",                 "Tinh Cao Bang",            "Cao Bang",                 "Can Tho",
                        "Can Gio",                  "Can Duoc",                 "Cam Ranh",                 "Cam Pha Mines",
                        "Ca Mau",                   "Buon Ma Thuot",            "Tinh Binh Dinh",           "Bim Son",
                        "Bien Hoa",                 "Ben Tre",                  "Bac Ninh",
                        "Thanh pho Bac Lieu",       "Bac Giang",                "Bac Kan",                  "Ap Van Tu Tay",
                        "Ap Ba",                    "Tinh An Giang",            "Ben Dinh",                 "Huyen Dien Bien",
                        "Tinh Bac Ninh",            "Tinh Bac Giang",           "Tinh Da Nang",             "Tinh Binh Duong",
                        "Tinh Binh Phuoc",          "Tinh Thai Nguyen",         "Tinh Quang Nam",           "Tinh Phu Tho",
                        "Tinh Nam Dinh",            "Tinh Ha Nam",              "Tinh Bac Kan",             "Tinh Bac Lieu",
                        "Tinh Ca Mau",              "Tinh Hai Duong",           "Tinh Hung Yen",            "Tinh Vinh Phuc",
                        "Uyen Hung"
                      };

//==========================================================================================//
/////////////////////////
// SETUP FUNCTION HERE //
/////////////////////////

void setup() {
    Serial.begin(115200);

    // Change I2C pin
    Wire.begin(5, 4);

    // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
    // if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    //     Serial.println(F("SSD1306 allocation failed"));
    //     for(;;); // Don't proceed, loop forever
    // }

    WiFi.begin(ssid, password);
    // Log_New("Connecting");
    // while(WiFi.status() != WL_CONNECTED) {
    //     delay(250);
    //     Log(".");
    // }


    // Log_New("Connected to WiFi network with IP Address: ");
    // display.print(WiFi.localIP());

    // BLUETOOTH INITIALISATION
    BLEDevice::init("WEATHER SERVER");
    BLEServer *pServer = BLEDevice::createServer();
  
    BLEService *pService = pServer->createService(SERVICE_UUID);
  
    BLECharacteristic *pCharacteristic = pService->createCharacteristic(
                                           CHARACTERISTIC_UUID,
                                           NIMBLE_PROPERTY::READ |
                                           NIMBLE_PROPERTY::WRITE 
                                         );
  
    pCharacteristic->setCallbacks(new MyCallbacks());
  
    pCharacteristic->setValue("HELLO WORLD!"); 
    pService->start();
  
    BLEAdvertising *pAdvertising = pServer->getAdvertising();
    pAdvertising->start();
}

////////////////////////
// LOOP FUNCTION HERE //
////////////////////////

void loop() {

    //Send an HTTP POST request every 10 minutes
    if ((millis() - lastTime) > timerDelay) {
        //Check WiFi connection status
        if(WiFi.status()== WL_CONNECTED) {
        
            // Get the current time and convert to string and
            // concatenate to start_time
            start_time += time_to_string(getTime());

            // Create serverPath by concatenating all components
            serverPath = serverName + city_id + api_type + start_time + api_count + api_key;

            // Making HTTP GET request
            Weather_Data = httpGETRequest(serverPath);

            Parse_Weather_Data(Weather_Data);

            display.clearDisplay();
            display.setCursor(0, 0);
            
            // Print out info
            display.setTextSize(2);
            display.setCursor(0, 0);
            
            display.print(display_temp);
            display.print("'C");

            display.setTextSize(1);
            
            display.setCursor(0, 20);
            display.println(display_city_name);

            display.print("Date: ");
            display.println(display_time);

            display.print("Humid: ");
            display.print(display_humidity);
            display.println("%");

            display.print("Cloud: ");
            display.print(display_cloud);
            display.println("%");

            display.print("Wind: ");
            display.print(display_wind_speed);
            display.println("m/s");

            display.display();
            delay(1000);
        }
        else {
            // Log_New("WiFi Disconnected");
        }
        lastTime = millis();
    }

    //========================================================================//

    //////////////////
    // OLED DISPLAY //
    //////////////////

    // Draw a single pixel in white
    // display.drawPixel(64, 32, SSD1306_WHITE);

}

//==============================================================================//

//////////////////////////////
// FUNCTION DEFINITION HERE //
//////////////////////////////

// Function that makes HTTP GET request
String httpGETRequest(String serverPath) {
    HTTPClient http;
    
    // Your IP address with path or Domain name with URL path 
    http.begin(serverPath.c_str());

    // Send HTTP POST request
    int httpResponseCode = http.GET();

    String payload = "{}"; 

    if (httpResponseCode > 0) {
        // Log_New("HTTP Response code: ");
        // display.print(httpResponseCode);
        payload = http.getString();
    }
    else {
        // Log_New("Error code: ");
        // display.print(httpResponseCode);
    }
    // Free resources
    http.end();

    return payload;
}

// Function that gets current epoch time
unsigned long getTime() {
    time_t now;
    struct tm timeinfo;
    if (!getLocalTime(&timeinfo)) {
        // Serial.println("Failed to obtain time");
        return(0);
    }
    time(&now);
    return now;
}

// Function that converts time_t to char*
String time_to_string(time_t time) {
    String result = "";
    char digit;

    while (time != 0) {
        digit = (time % 10) + 48;
        result = digit + result;
        time /= 10;
    }
    return result;
}

// This function searches a given city ID in city_id array and returns the index of
// that city ID in the array
int SearchID(int city_ID) {
  for (int i = 0; i < sizeof(list_city_id); i++) {
    if (city_ID == list_city_id[i]) return i;
  }
  return -1; // City ID not found
}

// This function parses the weather data, picks up essential data to display on the OLED
void Parse_Weather_Data(String weather_data) {

  int city_index;
  
  JSONVar myObject = JSON.parse(weather_data);

  // JSON.typeof(jsonVar) can be used to get the type of the var
  // if (JSON.typeof(myObject) == "undefined") {
  //     Log_New("Parsing input failed!");
  //     return;
  // }

  city_index = SearchID(int(myObject["city_id"]));
  display_city_name = list_city_name[city_index];
  
  display_time        = myObject["list"][0]["dt"];
  display_temp        = JSONVar(int(myObject["list"][0]["main"]["temp"]) - 273);
  display_feel_like   = JSONVar(int(myObject["list"][0]["main"]["feels_like"]) - 273);
  display_humidity    = myObject["list"][0]["main"]["humidity"];
  display_wind_speed  = myObject["list"][0]["wind"]["speed"];
  display_cloud       = myObject["list"][0]["clouds"]["all"];
}

// This function logs on OLED. Clears screen & prints new text
void Log_New(String text) {
    // Clear the buffer
    display.clearDisplay();
    display.setTextSize(1);               // Normal 1:1 pixel scale
    display.setTextColor(SSD1306_WHITE);  // Draw white text
    display.setCursor(0, 0);              // Start at top-left corner
    display.print(text);
    display.display();
    delay(1000);
}

// This function logs on OLED. Prints text wihout clearing the screen
void Log(String text) {
    display.setTextSize(1);               // Normal 1:1 pixel scale
    display.setTextColor(SSD1306_WHITE);  // Draw white text
    display.print(text);
    display.display();
    delay(1000);
}
