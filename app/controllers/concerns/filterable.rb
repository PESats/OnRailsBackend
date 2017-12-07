module Filterable
    extend ActiveSupport::Concern
    module ClassMethods
        def filter(filter_params)
            result = self.where(nil)
            filter_params.each do |key,value|
                result = result.public_send(key, value) if value.present?
            end
            result
        end        
    end    
end