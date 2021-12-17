int Read_Axis(byte a){
  int data;

  Wire.beginTransmission(I2C_Address);
  Wire.write(a);
  Wire.endTransmission();

  Wire.beginTransmission(I2C_Address);
  Wire.requestFrom(I2C_Address, 2);

  if (Wire.available()){
    data = (int)Wire.read();
    data = data | (Wire.read() << 8);
  } else { data = 0; }

  Wire.endTransmission();
  return data;
}

void Init_ADXL345(byte r){
  Wire.beginTransmission(I2C_Address);

  Wire.write(DATA_FORMAT);
  Wire.write(r);
  Wire.endTransmission();

  Wire.beginTransmission(I2C_Address);
  Wire.write(POWER_CTL);
  Wire.write(0x08);
  Wire.endTransmission();
}

void i2cMux(uint8_t i) {
  if (i > 7) return;
 
  Wire.beginTransmission(TCAADDR);
  Wire.write(1 << i);
  Wire.endTransmission();  
}
