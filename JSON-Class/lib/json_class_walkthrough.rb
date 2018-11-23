require 'json'
require 'date'

class ParseJson

  attr_accessor :json_file

  def initialize(json_file)
    @json_file = JSON.parse(File.read(json_file))
    @day = 0
    @month = 0
    @year = 0
  end

  def get_base
    base = @json_file['base']
  end

  def current_date
    date = @json_file['date']
  end

  def date_validate?
    year, month, day = @json_file['date'].split '-'
    Date.valid_date? year.to_i, month.to_i, day.to_i
  end

  def base_exchange_count
    counter = base_exchange_validate.length
  end

  def jd_date
    old_date = Date.parse(@json_file['date'])
    oldCurrentDifference = (DateTime.now.jd - old_date.jd)
    oldCurrentDifference

  end


end
