fi120 = pi/4;
fi230 = pi/2;
fi340 = pi/2;
fi450 = pi/4;
fi560 = pi/4;
fi670 = pi/4;


T01p = eye(4);
T12p = Tfiz(fi120)*Tz(L_base);
T13p = T12p*Tfiy(-fi230);
T14p = T13p*Tx(L_link1)*Tfiy(-fi340);
T15p = T14p*Tx(L_link2)*Tfix(fi450);
T16p = T15p*Tx(L_link3)*Tfiy(-fi560);
T17p = T16p*Tfix(fi670)*Tx(L_link4)*Tx(L_grip)


pos = T17p*[0;0;0;1];
x0 = pos(1)
y0 = pos(2)
z0 = pos(3)

Rot = T17p(1:3,1:3);

angles = rotm2eul(Rot, 'XYZ');

fix0 = angles(1)
fiy0 = angles(2)
fiz0 = angles(3)







function T = Tx(x)
    T = [1,   0,    0,    x;
         0,   1,    0,    0;
         0,   0,    1,    0;
         0,   0,    0,    1];
end

function T = Ty(y)
    T = [1,   0,    0,    0;
         0,   1,    0,    y;
         0,   0,    1,    0;
         0,   0,    0,    1];
end

function T = Tz(z)
    T = [1,   0,    0,    0;
         0,   1,    0,    0;
         0,   0,    1,    z;
         0,   0,    0,    1];
end




function T = Tfix(fix)
    T = [1,        0,           0,    0;
         0, cos(fix),   -sin(fix),    0;
         0, sin(fix),    cos(fix),    0;
         0,        0,           0,    1];
end

function T = Tfiy(fiy)
    T = [ cos(fiy),  0, sin(fiy),    0;
                 0,  1,        0,    0;
         -sin(fiy),  0, cos(fiy),    0;
                 0,  0,        0,    1];
end

function T = Tfiz(fiz)
    T = [cos(fiz),   -sin(fiz),    0,   0;
         sin(fiz),    cos(fiz),    0,   0;
                0,           0,    1,   0;
                0,           0,    0,   1];
end

