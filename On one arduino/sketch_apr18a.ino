const int numInputs = 13; // 13 dijital giriş pinini okuyacağız
const int inputPins[numInputs] = {0,2,3, 4, 5, 6, 7, 8, 10, 11, 12, 13}; // Array to store the digital input pins

void setup() {
  pinMode(0, OUTPUT); // Set pin 9 as output, linked to Timer1

  // Set input pins
  for (int i = 0; i < numInputs; i++) {
    pinMode(inputPins[i], INPUT);
  }

  Serial.begin(115200); // Initialize serial communication at 115200 baud rate

  // Configure Timer1
  TCCR1A = _BV(COM1A0);  // Toggle OC1A on Compare Match (Pin 9 toggles automatically)
  TCCR1B = _BV(WGM12) | _BV(CS10); // Set timer to CTC (Clear Timer on Compare Match) mode with no prescaling
  OCR1A = 19999; // Set compare match value to generate 400 Hz
}

void loop() {
  // Read and send the states of each digital input pin
  for (int i = 0; i < numInputs; i++) {
    int state = digitalRead(inputPins[i]); // Read the state of the current input pin
    Serial.print(state); // Send the state to the serial port
    if (i < numInputs - 1) {
      Serial.print(","); // Separate values with a comma (except for the last one)
    }
  }
  Serial.println(); // End the line after sending all input states
  delayMicroseconds(200); // Small delay to allow for readable updates in the plotter
}
