clearvars
a = arduino("COM3","UnoR4WiFi");

s = servo(a,'D4','MinPulseDuration',1300e-6,'MaxPulseDuration',1700e-6);
d = servo(a,'D5','MinPulseDuration',1300e-6,'MaxPulseDuration',1700e-6);

running = false;
prevLeft = 0;

while true
    leftWhisker = readDigitalPin(a,'D2');
    rightWhisker = readDigitalPin(a,'D3');

  
    if leftWhisker == 1 && prevLeft == 0
        running = ~running;

        if ~running
            stopMotors(s,d);
        end

        pause(0.2);
    end
    prevLeft = leftWhisker;

    if running
        if leftWhisker == 1
            driveBackward(s,d,0.5);
            turnRight(s,d,0.5);
        elseif rightWhisker == 1
            driveBackward(s,d,0.5);
            turnLeft(s,d,0.5);
        else
            driveForward(s,d);
        end
    end

    pause(0.1);
end

function driveForward(s,d)
writePosition(s,0.5);
writePosition(d,0.55);
end

function driveBackward(s,d,t)
writePosition(s,0);
writePosition(d,1);
pause(t);
end

function turnRight(s,d,t)
writePosition(s,1);
writePosition(d,0);
pause(t);
end

function turnLeft(s,d,t)
writePosition(s,0);
writePosition(d,1);
pause(t);
end

function stopMotors(s,d)
writePosition(s,0.5);
writePosition(d,0.55);
end
