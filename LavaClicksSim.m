
%run for size 1 to 100
for n = 1:100
    disp(n);
    %run 1000 simulations
    for i = 1 : 1000
        
        %1 if holding lava
        hold = 0;
        clicks = 0;
        %f is amount of lava sources left in the pool
        f = n;

        while f > 0
            clicks = clicks + 1;

            if randi(n) <= f

                if hold == 0
                    hold = 1;
                    f = f - 1;
                else 
                    hold = 0;
                end    

            else    

                if hold == 1
                    hold = 0;
                    f = f + 1;
                else
                    hold = 0;
                end
            end
        end
        allClicks(i)= clicks;

    end
    avgClicks(n) = mean(allClicks);
end


xAxis = 1:1:100;

%just plots it and makes it look nice
plot(xAxis,avgClicks);

