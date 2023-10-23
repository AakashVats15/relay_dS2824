classdef relay_dS2824 < handle
    
    properties
        address;
        port;
        dS2824;
    end
    
    methods
        function obj = relay_dS2824(address, port)
            switch nargin
                case 0
                    obj.address = '192.168.0.123'; % Default IP
                    obj.port = 17123;              % Default Port no. for TCP/IP
                case 2
                    obj.address = address;
                    obj.port = port;
                otherwise
                    error('Illegal number of input arguments.');
            end
            obj.dS2824 = tcpclient(obj.address, obj.port, 'ConnectTimeout', 15);
            drawnow;
%             obj.identify();
        end
        
        function identify(obj)
            try
                % Sending an identification command to the device
                writeline(obj.dS2824, 'IDN?');
                response = fscanf(obj.dS2824);
                disp(['Identification Response: ' response]);
            catch
                disp('Error occurred while identifying the device.');
            end
        end
        
        function setOutputOFF(obj)
            obj.sendCommand('OUTP:STAT OFF');
        end
        
        function setOutputON(obj)
            obj.sendCommand('OUTP:STAT ON');
        end
        
        function answer = getOutputStatus(obj)
            status = obj.getQuery('OUTP:STAT?');
            answer = status(1:end-1);     
        end
        
        function success = ping(obj)
            try
                if ping(obj.address, 5)
                    disp(['Successfully pinged ' obj.address]);
                    success = true;
                else
                    disp(['Could not ping ' obj.address]);
                    success = false;
                end
            catch
                disp(['Error occurred while pinging ' obj.address]);
                success = false;
            end
        end
        
        % Define sendCommand and getQuery methods here
        function sendCommand(obj, command)
            try
                writeline(obj.dS2824, command);
            catch
                disp(['Error sending command: ' command]);
            end
        end
        
        function response = getQuery(obj, query)
            try
                writeline(obj.dS2824, query);
                response = fscanf(obj.dS2824);
            catch
                disp(['Error querying: ' query]);
                response = '';
            end
        end
    end
end