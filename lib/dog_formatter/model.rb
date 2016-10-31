module DogFormatter
  module Model
    def self.included(model)
      super
      model.singleton_class.class_eval do
        include ClassMethods
      end
    end

    module ClassMethods
      def method_missing(method_name,  *_args,  &_block)
        return unless method_name.to_s.end_with?("_ymd")

        method_name_except_format_value = method_name.to_s.sub!(/_ymd/, '')
        column_names = self.class.column_names.select { |column_name| column_name =~ /.*_at/ }

        return unless column_names.include?(method_name_except_format_value)

        read_attribute(method_name_except_format_value).strftime("%Y/%m/%d")
      end
    end
  end
end
