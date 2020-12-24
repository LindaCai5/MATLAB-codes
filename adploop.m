function numI = adploop(tol,level,levmax,fun,f,x,display)
numI=0;
v=0;
reachflag = 0;
%initialize an array that holds values to be summed over each level
right_area=zeros(levmax);
if display 
             disp('level       numI                area added ')
             disp('----------------------------------------------------------')    
end
%to facilitate computing values, save the previously computed results
f_buffer=zeros(levmax,3);
x_buffer=zeros(levmax,3);
while (level>0)
    fprintf(' %d      %.12e.   %.12e.    ', level, numI, right_area(level));
    h=(x(5)-x(1));
    % save right half subinterval info
    for k=1:3
        f_buffer(level,k)=f(k+2);
        x_buffer(level,k)=x(k+2);
    end
    right_area(level)=(h/12)*(f(3)+4*f(4)+f(5)); %right interval
    if v<=0 
        I_1=(h/6)*(f(1)+4*f(3)+f(5)); 
    end
    left_area=(h/12)*(f(1)+4*f(2)+f(3));
    I_2=left_area+right_area(level);
    fprintf('I2: %.12e. I1: %.12e.\n', I_2, I_1);
    %case 1 termination, the min tolerance reached
    %previous level and next level results don't make much differences
    if abs(I_1-I_2)>15*tol
        level=level+1;
        I_1=left_area;
        if level > levmax
            fprintf("second termination condition reached.\n");
            numI=numI+I_2;
            level=level-1;
            v=0; 
        else 
            v=1; 
            f(5)=f(3); %adjust the endpoints accordingly
            f(3)=f(2);
            x(5)=x(3);
            x(3)=x(2);
        end
    else
        if (reachflag == 0)
            fprintf("first termination condition reached \n");
        end
        reachflag = 1;
        %begin to return back to the previous level
        level=level-1;
        v=0;
        %we use the conservative strategy of accepting the two-panel composite
        %Simpson rule. The method described on the web page uses y=y+simp1.
        numI=numI+I_2 + (1/15)*(I_2-I_1);
        if level<=0
            fprintf(' %d      %.12e.  \n', level, numI);
            %fprintf('I2: %.12e. I1: %.12e.\n', I_2, I_1);
            return
        end
        o=1;
        for k=1:2:5 % update f(1),f(3) and f(5)
            f(k)=f_buffer(level,o);
            x(k)=x_buffer(level,o);
            o=o+1;
        end
    end
    for k=2:2:4  %fix values at f(2) and f(4)
        s = x(k+1)+x(k-1);
        x(k)=(1/2)*s;
        f(k)=feval(fun,x(k));
    end        
end

