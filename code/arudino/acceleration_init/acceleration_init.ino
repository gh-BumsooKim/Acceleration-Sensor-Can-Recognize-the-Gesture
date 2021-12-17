#include <Wire.h>

#define I2C_Address 0x53
#define TCAADDR 0x70

#define POWER_CTL 0x2D
#define DATA_FORMAT 0x31
#define X_axis 0x32
#define Y_axis 0x34
#define Z_axis 0x36

#define Range_2g 0
#define Range_4g 1
#define Range_8g 2
#define Range_16g 3

#define init_i 3
// chang this 'init_i' value from 7 to 3 for initialize 5 sensor.

void setup(){
  Wire.begin();
  Serial.begin(115200); // for matlab processing
  Init_ADXL345(Range_4g);
}

void loop(){

  i2cMux(init_i);
    
  Serial.print(" X: ");
  Serial.print(Read_Axis(X_axis));
  Serial.print(" Y: ");
  Serial.print(Read_Axis(Y_axis));
  Serial.print(" Z: ");
  Serial.print(Read_Axis(Z_axis));
  Serial.println();
    
  delay(40);
}
