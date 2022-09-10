; Configuration file for Duet 3 Mini 5+ (firmware version 3.3)
; executed by the firmware on start-up

; General preferences
G90                                          ; send absolute coordinates...
M83                                          ; ...but relative extruder moves
M550 P"Hevo"                                 ; set printer name
M669 K1                                      ; select CoreXY mode

; Network
M552 P0.0.0.0 S1                             ; enable network and acquire dynamic address via DHCP
M586 P0 S1                                   ; enable HTTP
M586 P1 S0                                   ; disable FTP
M586 P2 S0                                   ; disable Telnet

; Drives
M569 P0.0 S0                                 ; physical drive 0.0 (Extruder) goes backwards
M569 P0.1 S1                                 ; physical drive 0.1 (right) goes forwards
M569 P0.2 S0                                 ; physical drive 0.3 (Z-right) goes backwards
M569 P0.3 S0                                 ; physical drive 0.3 (Z-left) goes backwards
M569 P0.4 S1                                 ; physical drive 0.4 (left) goes forwards
M584 X0.4 Y0.1 Z0.3:0.2 E0.0                 ; set drive mapping
M350 X16 Y16 Z16 E16 I1                      ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z160.00 E94.30             ; set steps per mm
M566 X100.00 Y100.00 Z600.00 E300.00         ; set maximum instantaneous speed changes (mm/min)
M203 X9000.00 Y9000.00 Z5000.00 E16000.00     ; set maximum speeds (mm/min)
M201 X1000.00 Y1000.00 Z3000.00 E1000.00    ; set accelerations (mm/s^2)
M906 X1200 Y1200 Z1000 E1400 I30             ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                      ; Set idle timeout

; StealthChop
M569 P0.1 D3 V50						 	 ; stealthChop drive 0.1 (right) (104.2 mm/sec)
M569 P0.4 D3 V50						 	 ; stealthChop drive 0.1 (left) (104.2 mm/sec)
M569 P0.2 D3 V90						 	 ; stealthChop drive 0.1 (z-right) (52.1 mm/sec)
M569 P0.3 D3 V90						 	 ; stealthChop drive 0.1 (z-left) (52.1 mm/sec)
;M569 P0.0 D3 V90						 	 ; stealthChop drive 0.1 (extruder) (104.2 mm/sec)

; Axis Limits
M208 X0 Y0 Z0 S1                             ; set axis minima
M208 X290 Y300 Z245 S0                       ; set axis maxima

; Endstops
M574 Y1 S1 P"io1.in"                         ; configure optical-switch endstop for low end on Y via pin io1.in
M574 Z1 S1 P"io0.in+io3.in"                  ; configure optical-switch endstop for low end on Z via pin io0.in
M574 X2 S1 P"io4.in"                         ; configure optical-switch endstop for high end on X via pin io1.in

; Z-Probe
M558 P0 H5 F120 T6000                        ; disable Z probe but set dive height, probe speed and travel speed
M557 X15:215 Y15:195 S20                     ; define mesh grid

; Heaters
M308 S0 P"temp0" Y"thermistor" A"Bed" T100000 B4138 ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0                           ; create bed heater output on out0 and map it to sensor 0
M307 H0 B0 S1.00                             ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                      ; map heated bed to heater 0
M143 H0 S130                                 ; set temperature limit for heater 0 to 130C
M308 S1 P"temp1" Y"thermistor" A"Hotend" T100000 B4138 ; configure sensor 1 as thermistor on pin temp1
M950 H1 C"out1" T1                           ; create nozzle heater output on out1 and map it to sensor 1
M307 H1 B0 S1.00                             ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                 ; set temperature limit for heater 1 to 280C

; PID Tuning 
M307 H0 R0.447 K0.463:0.000 D2.81 E1.35 S1.00 B0 ; heatbed PID tuning parameters
M307 H1 R2.214 K0.405:0.000 D5.56 E1.35 S1.00 B0 V11.9 ; hotend PID tuning parameters
; Fans
M950 F0 C"out5" Q500                         ; create fan 0 on pin out5 and set its frequency
M106 P0 S0 H-1                               ; set fan 0 value. Thermostatic control is turned off

; Tools
M563 P0 S"Hotend" D0 H1 F0                     ; define tool 0
G10 P0 X0 Y0 Z0                                ; set tool 0 axis offsets
G10 P0 R0 S0                                   ; set initial tool 0 active and standby temperatures to 0C 

; Custom settings are not defined
T0
