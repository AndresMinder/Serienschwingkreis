classdef MessageBlock
    properties
        message = '';
    end
    
    methods
        % Konstruktor
        function obj = MessageBlock(message)
        obj.message = message;
        end
        
        % getter
%         function obj = getMessage()
%             
%         end
        
        % setter
        function setMessage(new_message)
            new_message.message;
        end
    end
end