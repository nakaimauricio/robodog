pata_dia_dir = inv_kin()
pata_dia_esq = inv_kin()
pata_tra_dir = inv_kin()
pata_tra_esq = inv_kin()
% 
% while
%     
% end

motor=pata_dia_dir.calc_ang(0,100)
pata_dia_dir.calc_pos(motor.motor1, motor.motor2,1)
pata_dia_dir.calc_pos(motor.motor1, motor.motor2,2)
pata_dia_dir.calc_pos(motor.motor1, motor.motor2,4)
