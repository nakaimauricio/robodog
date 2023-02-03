pata_dia_dir = inv_kin(0,100)
% pata_dia_esq = inv_kin(0,100)
% pata_tra_dir = inv_kin(0,100)
% pata_tra_esq = inv_kin(0,100)
% 
% while
%     
% end

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
    for i=pos_y:-vel_vertical:-90
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
% pata_dia_dir.calc_ang(0,-80,1);
% pata_dia_dir.calc_ang(0,-90,1);
% pata_dia_dir.calc_ang(0,-100,1);
% pata_dia_dir.calc_ang(0,-110,1);
% pata_dia_dir.calc_ang(0,-110,1);
% pata_dia_dir.calc_ang(0,-110,1);
% pata_dia_dir.calc_pos(ang(1),ang(2),1);
% pata_dia_dir.calc_pos(30,70,1);
% pata_dia_dir.calc_pos(30,70,1);
% pata_dia_dir.calc_pos(-30,70,1);


% ang=pata_dia_dir.calc_ang(30,70,1);
% ang=pata_dia_dir.calc_ang(30,70,1);
% ang=pata_dia_dir.calc_ang(-30,70,1);