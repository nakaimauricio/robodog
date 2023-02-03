pata_dia_dir = inv_kin(0,80)

vel_horizontal=5;  % mm/s
vel_vertical=5;    % mm/s
pos_x=0;
pos_y=-80;
%tempo de amostragem de 1s

while (1)
    for i=pos_x:vel_horizontal:30
        pos_x=i;
        pata_dia_dir.calc_ang(pos_x,pos_y,1)
    end
    for i=pos_y:-vel_vertical:-110
        pos_y=i;
        pata_dia_dir.calc_ang(pos_x,pos_y,1)
    end
    for i=pos_x:-vel_horizontal:-30
        pos_x=i;
        pata_dia_dir.calc_ang(pos_x,pos_y,1)
    end
    for i=pos_y:vel_horizontal:-80
        pos_y=i;
        pata_dia_dir.calc_ang(pos_x,pos_y,1)
    end
end
