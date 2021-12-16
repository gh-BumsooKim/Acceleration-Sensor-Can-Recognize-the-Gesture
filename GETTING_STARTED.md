# Getting Started this project

## Environment

- Arduino IDE with Wire Library
- MATLAB R2021a with Deep Neural Designer


## 1. Install IDE

At first, you should install **[Arduino IDE](https://www.arduino.cc/)**, and **[MATLAB](https://www.mathworks.com/products/matlab.html)**
(if you are students and school has matlab license, you can use matlab program for free)

## 2. Circuit Design and Serial Communication Test

You should perchase some sensor, following list:

- 5EA : **[adxl345](https://www.analog.com/media/en/technical-documentation/data-sheets/ADXL345.pdf)** (3-axis-acceleration sensor)
- 1EA : **[TCA9548A](https://www.ti.com/lit/ds/symlink/tca9548a.pdf?ts=1639633469673&ref_url=https%253A%252F%252Fwww.google.com%252F)** (I2C Multiplexer)
- 1EA : **Arduino Uno R3** (MCU)
- nEA : Some **Jumper Wire**

Then, connect circuit like [this visual circuit](visual_circuit.png) or [schematic circuit](schematic_circuit.png ).

- Schematic Circuit :

- Visual Circuit :
![image](https://user-images.githubusercontent.com/67869508/146366067-dcab763d-8fab-4b86-810c-48e2ff11d6b2.png)

And `git glone` this reposiory, you can see acceleration.ino file in arduino folder. (other ino file is for global variable and user define functions)
For init each acceleration sensor, you should compile & upload the init.ino code, repeat uploading ino file as changing `Trigger` value from 7 to 3.

If you init 5 acceleration sensor, upload the [acceleration.ino]() file, then you can see the string `X1 : ~ Y1:` as 1 line in serial monitor.

## 3. Wavelet Transformation (Convert Signal Data to Image Data)

For signal data transformation and deep learning, you should install additional toolbox in matlab add-on manager, following list :

- Wavelet Toolbox
- Deep Learning Toolbox
- Deep Learning Toolbox Model for GoogLeNet Network (if you want to use other deep neural network, install specific model toolbox)

Then, open [inference.m]() mataba code and read [model.mat] file (this file has pre-trained network and we used the googlenet) and run.
If you see the signal data and image like wave in real-time, 

## 4. Customize Network using Your Custom Dataset

If you want to customize this model, open the `Deep Neural Designer` on upper-side bar in matlab ide.

A. Choose the model you want

B. Upload your dataset (if you want to build your custom dataset using matlab, click [Here](build_dataset.m))

C. Train the model

D. Export the model to your workspace

E. Edit `trainedNetwork_1` to exported your custom model in L97. (In workspace, you can config the your model name and info variable.)

F. Save your model like this following code : 

```
% save the model
save("model", [MODEL_NAME]);
save("model", [MODE-INFOL_NAME]);

% load the model
load("model");
```

If you save the model, in working directory, you can see the `model.mat` included model layer and weight parameter.

## Issue

If you have some error, please create an issue.
