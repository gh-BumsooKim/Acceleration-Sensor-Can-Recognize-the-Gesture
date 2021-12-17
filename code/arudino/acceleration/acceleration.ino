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

void setup(){
  Wire.begin();
  Serial.begin(115200); // for matlab processing
  Init_ADXL345(Range_4g);
}

void loop(){

  i2cMux(7);
    
  Serial.print(" X1: ");
  Serial.print(Read_Axis(X_axis));
  Serial.print(" Y1: ");
  Serial.print(Read_Axis(Y_axis));
  Serial.print(" Z1: ");
  Serial.print(Read_Axis(Z_axis));

  i2cMux(6);
    
  Serial.print(" X2: ");
  Serial.print(Read_Axis(X_axis));
  Serial.print(" Y2: ");
  Serial.print(Read_Axis(Y_axis));
  Serial.print(" Z2: ");
  Serial.print(Read_Axis(Z_axis));

  i2cMux(5);

  Serial.print(" X3: ");
  Serial.print(Read_Axis(X_axis));
  Serial.print(" Y3: ");
  Serial.print(Read_Axis(Y_axis));
  Serial.print(" Z3: ");
  Serial.print(Read_Axis(Z_axis));

  i2cMux(4);
    
  Serial.print(" X4: ");
  Serial.print(Read_Axis(X_axis));
  Serial.print(" Y4: ");
  Serial.print(Read_Axis(Y_axis));
  Serial.print(" Z4: ");
  Serial.print(Read_Axis(Z_axis));

  i2cMux(3);
    
  Serial.print(" X5: ");
  Serial.print(Read_Axis(X_axis));
  Serial.print(" Y5: ");
  Serial.print(Read_Axis(Y_axis));
  Serial.print(" Z5: ");
  Serial.print(Read_Axis(Z_axis));
  Serial.println();
    
  delay(20);
}
