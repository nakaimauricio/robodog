% Cinemática Inversa
classdef inv_kin
    properties 
        motor1
        motor2
        atual_x
        atual_y
    end
    properties (Constant)
        L1=69
        L2=47
    end
    methods
        function obj = inv_kin(atual_x, atual_y)
            obj.atual_x=atual_x;
            obj.atual_y=atual_y;
        end
        function ang = calc_ang(obj,x,y)
            %cinemática inversa
            %x e y são representa a posição em relação ao ombro do robô
            theta2rad = acos((x^2+y^2-obj.L1^2-obj.L2^2)/(2*obj.L1*obj.L2));
            theta1rad = atan(y/x)-atan(obj.L2*sin(theta2rad)/(obj.L1+obj.L2*cos(theta2rad)));
            if (theta1rad>pi)
                theta1rad = theta1rad-pi;
            end
            if (theta1rad<pi)
                theta1rad = theta1rad+pi;
            end
            ang.motor1 = 90-(theta1rad*180/pi);
            ang.motor2 = 90-(theta2rad*180/pi);
        end
        function pos = calc_pos(obj,angmotor1,angmotor2,janela)
            %cinemática direta
            %q1 ângulo do ombro do robo, posição 0 no meio da articulação
            %q2 ângluo do joelho do robô, posição 0 com o joelho flexionado
            %em 90 graus
        
            theta1=angmotor1;
            theta2=90-angmotor2;
            theta1rad=pi/180*theta1;
            theta2rad=pi/180*theta2;
        
            %posição em Y
            posY2=cos(theta1rad)*obj.L1 + cos(theta2rad-theta1rad)*obj.L2;
            posY1=cos(theta1rad)*obj.L1;
            
            %posição em x
            posX2 = sin(theta1rad)*obj.L1 - sin(theta2rad-theta1rad)*obj.L2;
            posX1= sin(theta1rad)*obj.L1;
            figure(janela);
            line([0 posX1 posX2],[0 -posY1 -posY2]);
            grid;
        end
    end
end
