class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @records = []
    @next_id = 1
    load_csv if File.exist?(csv_file)
  end

  def all
    @records
  end

  def find(id)
    @records.find {|record| record.id == id}
  end

  def create(new_record)
    new_record.id = @next_id
    @records << new_record
    @next_id += 1
    save_csv
  end

  def delete(id)
    @records.delete_if {|record| record.id == id}
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << headers
      @records.each do |record|
        csv << record_to_row(record)
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @records << row_to_record(row)
    end
    @next_id = @records.empty? ? 1 : @records.last.id + 1
  end
end