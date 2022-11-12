# frozen_string_literal: true

class ArsCurrencyAccountValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless Account.find(value).currency == 'ars'
      record.errors.add attribute, (options[:message] || 'must have ars as currency.')
    end
  end
end
