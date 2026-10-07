clear a
a = arduino();
count1=0;
count2=0;
ap= 0;
for i=1:1000
    sa=readDigitalPin(a,"D2");
    sb=readDigitalPin(a,"D4");
    if (sa==0 && sb==1)
        pause(0.2)
        if ap==1
            count1 =count1+ 1;
        end
        if ap==2
            count2= count2+1;
        end
    end
    if sb == 0 && sa==1
        pause(0.2)
        ap=ap+1;
    end
    if ap==3
        break
    end
end
if ap==3
    average = (count1+count2)/2
    disp("Switch B was pressed an average of " + average + " times during the two rounds counted.")
end