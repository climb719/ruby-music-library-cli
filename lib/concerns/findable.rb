module Concerns
    module Findable

        def find_by_name(name)
            all.detect{|a| a.name == name}
        end
    
        def find_or_create_by_name(name)
            a_name = self.find_by_name(name)
                if a_name
                    a_name
            else a_name = self.create(name)
                a_name
            end
        end

    end
end
