module DogFormatter
  module Model
   extend ActiveSupport::Concern

   included do
   end

    def method_missing(method_name, *_args, &_block)
      method_name_suffix =  matched_method_name_suffix(method_name.to_s)
      return unless method_name_suffix

      suffix_pattern = Regexp.new(method_name_suffix)
      attribute_name_except_format_value = method_name.to_s.sub!(suffix_pattern, '')

      return unless exist_column?(attribute_name_except_format_value)

      formatted_with_method_name_suffix(attribute_name_except_format_value, method_name_suffix)
    end

    private
    def format_suffixs
      ['_ymd', '_ymd_ja', '_ym', '_ym_ja']
    end

    def matched_method_name_suffix(method_name)
      format_suffixs.each { |suffix| return suffix if method_name.end_with?(suffix) }
    end

    def date_columns
      self.class.column_names.select { |column_name| column_name =~ /.*_at/ }
    end

    def exist_column?(attribute_name)
      date_columns.include?(attribute_name)
    end

    def formatted_with_method_name_suffix(attribute_name, method_name_suffix)
      read_attribute(attribute_name).strftime(format_text(method_name_suffix))
    end

    def format_text(method_name_suffix)
      # TODO: 設定ファイルなどに外出ししたものを読み込んでマッチした形式を使うようにする
      case method_name_suffix
      when '_ymd'
        '%Y/%m/%d'
      when '_ymd_ja'
        '%Y年%m月%d日'
      when '_ym'
        '%Y/%m'
      when '_ym_ja'
        '%Y年%m月'
      else
        raise '変換できません。該当する日付形式がありません'
      end
    end
  end
end

ActiveRecord::Base.send :include, DogFormatter::Model
